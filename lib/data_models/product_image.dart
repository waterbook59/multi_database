import 'package:flutter/material.dart';

class ProductImage {
  final int productId;
  final int imageId;
  final String small;
  final String medium;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const ProductImage({
    @required this.productId,
    @required this.imageId,
    @required this.small,
    @required this.medium,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductImage &&
          runtimeType == other.runtimeType &&
          productId == other.productId &&
          imageId == other.imageId &&
          small == other.small &&
          medium == other.medium);

  @override
  int get hashCode =>
      productId.hashCode ^ imageId.hashCode ^ small.hashCode ^ medium.hashCode;

  @override
  String toString() {
    return 'ProductImage{' +
        ' productId: $productId,' +
        ' imageId: $imageId,' +
        ' small: $small,' +
        ' medium: $medium,' +
        '}';
  }

  ProductImage copyWith({
    int productId,
    int imageId,
    String small,
    String medium,
  }) {
    return new ProductImage(
      productId: productId ?? this.productId,
      imageId: imageId ?? this.imageId,
      small: small ?? this.small,
      medium: medium ?? this.medium,
    );
  }

  Map<String, dynamic> toMap() {
    return <String,dynamic>{
      'productId': this.productId,
      'imageId': this.imageId,
      'small': this.small,
      'medium': this.medium,
    };
  }

  factory ProductImage.fromMap(Map<String, dynamic> map) {
    return new ProductImage(
      productId: map['productId'] as int,
      imageId: map['imageId'] as int,
      small: map['small'] as String,
      medium: map['medium'] as String,
    );
  }

//</editor-fold>
}



