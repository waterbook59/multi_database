import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mutidatabaseapp/data_models/product.dart';
import 'package:mutidatabaseapp/models/repository/barcode_repository.dart';

class DataRegistrationViewModel extends ChangeNotifier{
 final BarcodeRepository _barcodeRepository =BarcodeRepository();

 String _productName ='ここに名前';
 String get productName => _productName;

 String _productDescription='ここに説明';
 String get productDescription => _productDescription;

 String _productImage='ここにイメージ';
 String get productImage => _productImage;

 bool _isProcessing = false;
 bool get isProcessing => _isProcessing;
 List<Product> _products = <Product>[];
 List<Product> get products => _products;



 Future<void> getProductInfo() async{
  _isProcessing = true;
  notifyListeners();

  _products = await _barcodeRepository.getProductInfo();

  if (_products.isEmpty) {
   await Fluttertoast.showToast(
    msg: '商品データが見つかりません',
    toastLength: Toast.LENGTH_SHORT,
    fontSize: 14,
    textColor: Colors.black,
    backgroundColor: Colors.cyan,
   );
  } else {
   _productName = _products[0].name;
   _productImage = _products[0].productImage.small;
   _productDescription = _products[0].description;
  }
  notifyListeners();

  _isProcessing = false;
  notifyListeners();
 }



 Future<void> registerProductData() async{
//   await _barcodeRepository.registerProductData();
//   notifyListeners();
print('ここを押して情報保存');

  }




}