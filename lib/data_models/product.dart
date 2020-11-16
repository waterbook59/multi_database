import 'package:flutter/material.dart';
import 'package:mutidatabaseapp/data_models/product_image.dart';

class Product {
//  final int productId;
  final String name;
  final ProductImage productImage;
  final String description;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const Product({
    @required this.name,
    @required this.productImage,
    @required this.description,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          productImage == other.productImage &&
          description == other.description);

  @override
  int get hashCode =>
      name.hashCode ^ productImage.hashCode ^ description.hashCode;

  @override
  String toString() {
    return 'Product{' +
        ' name: $name,' +
        ' productImage: $productImage,' +
        ' description: $description,' +
        '}';
  }

  Product copyWith({
    String name,
    ProductImage productImage,
    String description,
  }) {
    return new Product(
      name: name ?? this.name,
      productImage: productImage ?? this.productImage,
      description: description ?? this.description,
    );
  }

  ///returnの後ろへ<String,dynamic>追加、this.削除(Remove this expression)
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': this.name,
      'productImage': this.productImage,
      'description': this.description,
    };
  }


  /// productImage: map['productImage'] as ProductImageのままではNG
  /// productImage: ProductImage.fromMap(map['image'] as Map<String, dynamic>),へ変更
  factory Product.fromMap(Map<String, dynamic> map) {
    return new Product(
      name: map['name'] as String,
      productImage: ProductImage.fromMap(map['image'] as Map<String, dynamic>),
      description: map['description'] as String,
    );
  }

//</editor-fold>
}


