import 'package:flutter/material.dart';
import 'package:mutidatabaseapp/data_models/product_image.dart';

class Product {
  final String name;
  final ProductImage productImage;
  final String description;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  // ignore: sort_constructors_first
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
    // ignore: lines_longer_than_80_chars
    return 'Product{${' name: $name,'}${' productImage: $productImage,'}${' description: $description,'}}';
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
      'name': name,
      'productImage': productImage,
      'description': description,
    };
  }

  // ignore: sort_constructors_first
  factory Product.fromMap(Map<String, dynamic> map) {
    return new Product(
      name: map['name'] as String,
      productImage: map['productImage'] as ProductImage,
      description: map['description'] as String,
    );
  }

//</editor-fold>
}