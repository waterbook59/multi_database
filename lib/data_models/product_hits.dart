import 'package:flutter/material.dart';
import 'package:mutidatabaseapp/data_models/product.dart';

class ProductHits {
  final int totalResultsAvailable;
  final int totalResultsReturned;
  final List<Product> hits;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  // ignore: sort_constructors_first
  const ProductHits({
    @required this.totalResultsAvailable,
    @required this.totalResultsReturned,
    @required this.hits,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductHits &&
          runtimeType == other.runtimeType &&
          totalResultsAvailable == other.totalResultsAvailable &&
          totalResultsReturned == other.totalResultsReturned &&
          hits == other.hits);

  @override
  int get hashCode =>
      totalResultsAvailable.hashCode ^
      totalResultsReturned.hashCode ^
      hits.hashCode;

  @override
  String toString() {
    // ignore: lines_longer_than_80_chars
    return 'ProductHits{${' totalResultsAvailable: $totalResultsAvailable,'}${' totalResultsReturned: $totalResultsReturned,'}${' hits: $hits,'}}';
  }

  ProductHits copyWith({
    int totalResultsAvailable,
    int totalResultsReturned,
    List<Product> hits,
  }) {
    return new ProductHits(
      totalResultsAvailable:
          totalResultsAvailable ?? this.totalResultsAvailable,
      totalResultsReturned: totalResultsReturned ?? this.totalResultsReturned,
      hits: hits ?? this.hits,
    );
  }

  Map<String, dynamic> toMap() {
    return <String,dynamic>{
      'totalResultsAvailable': totalResultsAvailable,
      'totalResultsReturned': totalResultsReturned,
      'hits': hits,
    };
  }


  ///fromMapで自分で作ったモデルクラスのリストへ変換する時は手動で修正
  /// hits: map['hits'] as List<Product>,のままだと当然エラー
  /// hitsはリスト形式なので、mapメソッドで分解して格納
  //      hits: (map['hits'] as List)
  //          ?.map(( dynamic e ) =>
  //        e == null ? null : Product.fromMap(e as Map<String, dynamic>))
  //          ?.toList(),

  // ignore: sort_constructors_first
  factory ProductHits.fromMap(Map<String, dynamic> map) {
    return new ProductHits(
      totalResultsAvailable: map['totalResultsAvailable'] as int,
      totalResultsReturned: map['totalResultsReturned'] as int,
      hits: (map['hits'] as List)
          ?.map(( dynamic e ) =>
      e == null ? null : Product.fromMap(e as Map<String, dynamic>))
          ?.toList(),
    );
  }

//</editor-fold>
}