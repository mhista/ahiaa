class Brand {
  final String id;
  final String sellerId;
  final String name;
  final String image;
  final bool? isFeatured;
  final int? productsCount;
  final DateTime createdAt;
  Brand({
    required this.id,
    required this.sellerId,
    required this.name,
    required this.image,
    this.isFeatured,
    this.productsCount,
    required this.createdAt,
  });
}
