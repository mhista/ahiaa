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

  BrandModel copyWith({
    String? id,
    String? name,
    String? image,
    bool? isFeatured,
    int? productsCount,
  }) {
    return BrandModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      isFeatured: isFeatured ?? this.isFeatured,
      productsCount: productsCount ?? this.productsCount,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'image': image});
    if (isFeatured != null) {
      result.addAll({'is_featured': isFeatured});
    }
    if (productsCount != null) {
      result.addAll({'products_count': productsCount});
    }

    return result;
  }

  factory BrandModel.fromMap(Map<String, dynamic> map) {
    return BrandModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      isFeatured: map['is_featured'],
      productsCount: map['products_count']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory BrandModel.fromJson(String source) =>
      BrandModel.fromMap(json.decode(source));
}
