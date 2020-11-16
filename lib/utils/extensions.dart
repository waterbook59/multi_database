import 'package:mutidatabaseapp/data_models/product.dart';
import 'package:mutidatabaseapp/data_models/product_image.dart';
import 'package:mutidatabaseapp/models/db/product_info_database.dart';
import 'package:uuid/uuid.dart';


//<List<product>>からDBのモデルクラス<List<productRecord>>
// すなわち,ProductRecordとProductRecordImage
///一つのリストに対してキーを加えて２つのリストへ変換する作業
extension ConvertToProductRecord on List<Product>{
  //staticでproductId付けちゃうとたぶんリスト内全部同じidになってしまう
//  static final productId = Uuid().v1();
//productIdはjson=>モデルクラス(Product)へ変換する時につける

  List<ProductRecord> toProductRecord(List<Product> products) {
    final productRecords = <ProductRecord>[];
//    final productId = Uuid().v1();

    ///List<Product>を一つ一つProductRecordとProductImageRecordに分解する
    products.map((product) {
      productRecords.add(
        ProductRecord(
          productId: product.productId ?? '',
          name: product.name ?? '',
          description: product.description ?? '',
        ),
      );
    });
    return productRecords;
  }

  ///productIdは引継ぎつつ、imageIdを新たに追加
  List<ProductRecordImage> toProductRecordImage(List<Product> products) {
    final productRecordImages = <ProductRecordImage>[];
    products.map((product) {
      productRecordImages.add(
          ProductRecordImage(
            productId: product.productId ?? '',
            imageId: Uuid().v1() ?? '',
            small: product.productImage.small ?? '',
            medium: product.productImage.medium ?? '',
          )
      );
    });
    return productRecordImages;
  }

}


extension ConvertToProduct on List<ProductRecord>{

  ///2つのリストをキーを使って一つのリストに戻す作業(内部結合？外部結合？)
  List<Product> toProduct(
      List<ProductRecord> productRecords,
      List<ProductRecordImage> productRecordImages) {
    final products = <Product>[];

    productRecords.map((productRecord) {
      products.add(
        Product(
            name: productRecord.name ?? '',
            description: productRecord.description ?? '',
            productImage:
                ProductRecordImages.map((productRecortImage)){

        }


            ProductRecordImage(
              productId: uuid同じやつ ??'',
              imageId: uuid ?? '',
              small: ??'',
              medium: ??'',
            )
        );


      );
    });
    return productRecords;
  }

}