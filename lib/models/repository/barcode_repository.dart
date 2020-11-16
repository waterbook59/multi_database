import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:mutidatabaseapp/data_models/product.dart';
import 'package:flutter/material.dart';
import 'package:mutidatabaseapp/data_models/product_hits.dart';
import 'package:mutidatabaseapp/main.dart';
import 'package:mutidatabaseapp/models/db/product_info_dao.dart';
import 'package:mutidatabaseapp/models/db/product_info_database.dart';
import 'package:mutidatabaseapp/utils/extensions.dart';

class BarcodeRepository {
  Future<List<Product>> getProductInfo() async {
    String path = 'assets/sample.json';
    String jsonString;
    var results = <Product>[];

    try {
      jsonString = await rootBundle.loadString(path);
      final responseBody = json.decode(jsonString) as Map<String, dynamic>;
      print('responseBody:$responseBody');

      results = await insertAndReadFromDB(responseBody);

      return results;
    } on FlutterError {
      print('Faild to open $path');
      exit(0);
    }

    //responseBodyはjson.decode(json)した後と同じ
//    final responseBody = response.body as Map<String, dynamic>;
    //    result = await insertAndReadFromDB(responseBody);
  }

  //responseBodyに対して、DBを経由させた後、resultへ格納
  Future<List<Product>> insertAndReadFromDB(
      Map<String, dynamic> responseBody) async {
    final productInfoDao = myProductInfoDB.productInfoDao;
//    final products = ProductHits.fromMap(responseBody).hits;

    //1.responseBody(json)をモデルクラス(List<Product>)へ変更
    var products = <Product>[];
    var productRecords = <ProductRecord>[];
    var productRecordImages = <ProductRecordImage>[];

    products = ProductHits.fromMap(responseBody).hits;

    //2.モデルクラス(List<Product>)をDBのテーブルクラス
    // (List<ProductRecord>,List<ProductRecordImage>)へ変換
    //ProductRecordとProductRecordImageにidを追加して変換・登録
    ///productRecordというモデルクラスをdata_models内に作らない(database.g.dartにある)
    productRecords = products.toProductRecord(products).cast<ProductRecord>();
    productRecordImages =
        products.toProductRecordImage(products).cast<ProductRecordImage>();

    //3.DBのテーブルクラス(List<ProductRecord>)に変換したリストでDBに登録・読込
    productRecords =
        await productInfoDao.insertAndReadProductFromDB(productRecords);
    productRecordImages =
        await productInfoDao.readImageFromDB(productRecordImages);

    //4.DBのテーブルクラス(List<ProductRecord>,List<ProductRecordImage>)から
    // モデルクラス(List<Product>)へ変換
    return products =
        productRecords.toProduct(productRecords, productRecordImages);
    return products;
  }
}
