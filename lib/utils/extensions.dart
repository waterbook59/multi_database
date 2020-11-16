


import 'package:mutidatabaseapp/data_models/product.dart';
import 'package:mutidatabaseapp/data_models/product_image.dart';
import 'package:mutidatabaseapp/data_models/product_record.dart';
import 'package:mutidatabaseapp/data_models/product_record_image.dart';
import 'package:uuid/uuid.dart';


//<List<product>>からDBのモデルクラス<List<productRecord>>
// すなわち,ProductRecordとProductRecordImage
extension ConvertToProductRecord on List<Product>{
  static final productId = Uuid().v1();

  List<ProductRecord> toProductRecord(List<Product> products){
    final productRecords =<ProductRecord>[];

    //List<Product>を一つ一つProductRecordとProductImageRecordに分解する
    products.map((product) {
      productRecords.add(
        ProductRecord(
          productId: productId ?? '',
          name: product.name ?? '',
          description: product.description ??'',
        ),
      );
    });
    return productRecords;
  }

  List<ProductRecordImage> toProductRecordImage(List<Product> products) {
    final productRecordImages =<ProductRecordImage>[];
    products.map((product) {
      productRecordImages.add(
          ProductRecordImage(
            productId: productId ??'',
            imageId:  Uuid().v1() ?? '',
            small:product.productImage.small ??'',
            medium:product.productImage.medium  ??'',
          )
      );
    });
    return productRecordImages;
  }

}


extension ConvertToProduct on List<ProductRecord>{

  List<Product> toProduct(List<ProductRecord> productRecords){
    final products =<Product>[];

    productRecords.map((productRecord) {
      products.add(
          Product(
              name: product.name ?? '',
              description: product.description ??'',
              productImage: ProductRecordImage(
                productId: uuid同じやつ ??'',
                imageId: uuid ?? '',
                small: ??'',
                medium:  ??'',
              )
          )
      );
    });
    return productRecords;
  }

}