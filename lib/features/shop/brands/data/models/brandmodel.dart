import 'dart:convert';

import 'package:ahiaa/features/shop/brands/domain/entities/brands.dart';

class BrandModel extends Brand {
  BrandModel({
    required super.id,
    required super.name,
    required super.image,
    super.isFeatured,
    super.productsCount,
  });

  static BrandModel empty() => BrandModel(id: '', name: '', image: '');

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'image': image});
    if (isFeatured != null) {
      result.addAll({'isFeatured': isFeatured});
    }
    if (productsCount != null) {
      result.addAll({'productsCount': productsCount});
    }

    return result;
  }

  factory BrandModel.fromMap(Map<String, dynamic> map) {
    return BrandModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      isFeatured: map['isFeatured'],
      productsCount: map['productsCount']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory BrandModel.fromJson(String source) =>
      BrandModel.fromMap(json.decode(source));
}
