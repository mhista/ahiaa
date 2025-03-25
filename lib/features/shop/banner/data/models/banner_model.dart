import 'dart:convert';

import 'package:ahiaa/features/shop/banner/domain/entities/banner.dart';

class BannerModel extends Bannerr {
  BannerModel({
    required super.imageUrl,
    required super.targetScreen,
    required super.active,
    required super.shopperId,
    required super.startDate,
    required super.endDate,
  });

  BannerModel copyWith({
    String? imageUrl,
    String? targetScreen,
    bool? active,
    String? shopperId,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return BannerModel(
      imageUrl: imageUrl ?? this.imageUrl,
      targetScreen: targetScreen ?? this.targetScreen,
      active: active ?? this.active,
      shopperId: shopperId ?? this.shopperId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'image_url': imageUrl});
    result.addAll({'target_screen': targetScreen});
    result.addAll({'active': active});
    result.addAll({'shopper_id': shopperId});
    result.addAll({'start_date': startDate.toIso8601String()});
    result.addAll({'end_date': endDate.toIso8601String()});

    return result;
  }

  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(
      imageUrl: map['image_url'] ?? '',
      targetScreen: map['target_screen'] ?? '',
      active: map['active'] ?? false,
      shopperId: map['shopper_id'] ?? '',
      startDate: DateTime.parse(map['start_date']),
      endDate: DateTime.parse(map['end_date']),
    );
  }

  String toJson() => json.encode(toMap());

  factory BannerModel.fromJson(String source) =>
      BannerModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BannerModel(imageUrl: $imageUrl, targetScreen: $targetScreen, active: $active, shopperId: $shopperId, startDate: $startDate, endDate: $endDate)';
  }
}
