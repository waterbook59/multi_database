
import 'package:flutter/material.dart';

class ProductRecordImage {
  final String productId;
  final String imageId;
  final String small;
  final String medium;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const ProductRecordImage({
    @required this.productId,
    @required this.imageId,
    @required this.small,
    @required this.medium,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductRecordImage &&
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
    return 'ProductRecordImage{' +
        ' productId: $productId,' +
        ' imageId: $imageId,' +
        ' small: $small,' +
        ' medium: $medium,' +
        '}';
  }

  ProductRecordImage copyWith({
    String productId,
    String imageId,
    String small,
    String medium,
  }) {
    return new ProductRecordImage(
      productId: productId ?? this.productId,
      imageId: imageId ?? this.imageId,
      small: small ?? this.small,
      medium: medium ?? this.medium,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': this.productId,
      'imageId': this.imageId,
      'small': this.small,
      'medium': this.medium,
    };
  }

  factory ProductRecordImage.fromMap(Map<String, dynamic> map) {
    return new ProductRecordImage(
      productId: map['productId'] as String,
      imageId: map['imageId'] as String,
      small: map['small'] as String,
      medium: map['medium'] as String,
    );
  }

//</editor-fold>
}