import 'dart:convert';

class Brand {
  final String id;
  final String name;
  final String image;
  final bool? isFeatured;
  final int? productsCount;
  Brand({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.productsCount,
  });
}
