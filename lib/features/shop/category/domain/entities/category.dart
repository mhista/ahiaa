class Category {
  final String id;
  final String name;
  final String image;
  final String parentId;
  final bool isFeatured;
  Category({
    required this.id,
    required this.name,
    required this.image,
    this.parentId = '',
    required this.isFeatured,
  });
}
