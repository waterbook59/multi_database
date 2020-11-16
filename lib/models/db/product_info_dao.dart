import 'package:moor/moor.dart';
import 'package:mutidatabaseapp/models/db/product_info_database.dart';

part 'product_info_dao.g.dart';

@UseDao(tables:[ProductRecords,ProductRecordImages])
class ProductInfoDao extends DatabaseAccessor<MyProductInfoDB> with _$ProductInfoDaoMixin{
  ProductInfoDao(MyProductInfoDB infoDB) : super(infoDB);

//DB空にしてからapiServiceのデータを書き込む
//１つ１つのクエリを普通に書いて、2つ以上のクエリを1つとして実行=>transaction

  //消す
  Future<void> clearDB() async{
    await delete(productRecords).go();
    await delete(productRecordImages).go();
  }
//入れる(2行以上の挿入はbatch)
//List<ProductRecord> productsの引数のところはテーブル名とかぶるのでproducts
  Future<void> insertDB(List<ProductRecord> products) async {
    ///productRecordsテーブル
    await batch((batch) {
      //tableのところにテーブル名、rowsのところに引数として入ってきたリスト(products)を入れる
      batch.insertAll(productRecords, products);
    });
    ///productRecordImagesテーブル
    await batch((batch) {
      //tableのところにテーブル名、rowsのところに引数として入ってきたリスト(products)を入れる
      batch.insertAll(productRecordImages, products);
    });
  }

  //読み込む
  Future<List<ProductRecord>> get allProductRecords =>
      select(productRecords).get();

  Future<List<ProductRecordImage>> get allProductRecordImages =>
      select(productRecordImages).get();


//transaction行う時にも引数はinsertDBのもの(List<ProductRecord> products)入れる
  Future<List<ProductRecord>> insertAndReadProductFromDB(
      List<ProductRecord> products) =>
      transaction(() async {
        await clearDB();
        await insertDB(products);
        //最後だけ読み込みして結果を返すのでreturn
        //ゲッターなのでallArticleRecordsの後ろは()いらない
        return allProductRecords;
      });

  //imageはProductRecordでclear,insertしてるので、読み込みのみにしてみる
  Future<List<ProductRecordImage>> readImageFromDB(
      List<ProductRecord> products) =>
//      transaction(() async {
//        await clearDB();
//        await insertDB(products);
//        //最後だけ読み込みして結果を返すのでreturn
//        //ゲッターなのでallArticleRecordsの後ろは()いらない
//        return
          allProductRecordImages;
//      });


}