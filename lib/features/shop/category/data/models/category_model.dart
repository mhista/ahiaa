import '../../domain/entities/category.dart';

class CategoryModel extends Category {
  const CategoryModel({
    super.id,
    required super.name,
    required super.image,
    required super.isFeatured,
    super.parentId,
    required super.productCounts,
  });

  // EMPTY HELPER FUNCTION
  static CategoryModel empty() => CategoryModel(
    id: 0,
    name: '',
    image: '',
    isFeatured: false,
    productCounts: 0,
  );

  CategoryModel copyWith({
    int? id,
    String? name,
    String? image,
    String? parentId,
    bool? isFeatured,
    int? productCounts,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      parentId: parentId ?? this.parentId,
      isFeatured: isFeatured ?? this.isFeatured,
      productCounts: productCounts ?? this.productCounts,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'image': image});
    result.addAll({'parent_id': parentId});
    result.addAll({'is_featured': isFeatured});
    result.addAll({'product_counts': productCounts});

    return result;
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      parentId: map['parent_id'] ?? '',
      isFeatured: map['is_featured'] ?? false,
      productCounts: map['product_counts'].toInt() ?? 0,
    );
  }

  @override
  String toString() {
    return 'CategoryModel(id: $id, name: $name, image: $image, parentId: $parentId, isFeatured: $isFeatured, productCounts: $productCounts)';
  }
}
