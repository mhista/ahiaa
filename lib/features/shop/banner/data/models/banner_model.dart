import 'dart:convert';

import 'package:ahiaa/features/shop/banner/domain/entities/banner.dart';

class BannerModel extends Bannerr {
  BannerModel({
    required super.imageUrl,
    required super.targetScreen,
    required super.active,
  });

  BannerModel copyWith({String? imageUrl, String? targetScreen, bool? active}) {
    return BannerModel(
      imageUrl: imageUrl ?? this.imageUrl,
      targetScreen: targetScreen ?? this.targetScreen,
      active: active ?? this.active,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'image_url': imageUrl});
    result.addAll({'target_screen': targetScreen});
    result.addAll({'active': active});

    return result;
  }

  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(
      imageUrl: map['image_url'] ?? '',
      targetScreen: map['target_screen'] ?? '',
      active: map['active'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory BannerModel.fromJson(String source) =>
      BannerModel.fromMap(json.decode(source));
}
