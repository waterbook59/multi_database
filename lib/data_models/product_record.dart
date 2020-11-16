
import 'package:flutter/material.dart';
import 'package:mutidatabaseapp/data_models/product_image.dart';

class ProductRecord {
  final String productId;
  final String name;
//  final ProductImage productImage;
  final String description;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const ProductRecord({
    @required this.productId,
    @required this.name,
    @required this.description,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductRecord &&
          runtimeType == other.runtimeType &&
          productId == other.productId &&
          name == other.name &&
          description == other.description);

  @override
  int get hashCode => productId.hashCode ^ name.hashCode ^ description.hashCode;

  @override
  String toString() {
    return 'ProductRecord{' +
        ' productId: $productId,' +
        ' name: $name,' +
        ' description: $description,' +
        '}';
  }

  ProductRecord copyWith({
    String productId,
    String name,
    String description,
  }) {
    return new ProductRecord(
      productId: productId ?? this.productId,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': this.productId,
      'name': this.name,
      'description': this.description,
    };
  }

  factory ProductRecord.fromMap(Map<String, dynamic> map) {
    return new ProductRecord(
      productId: map['productId'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
    );
  }

//</editor-fold>
}