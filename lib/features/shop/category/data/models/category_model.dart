import '../../domain/entities/category.dart';

class CategoryModel extends Category {
  CategoryModel({
    super.id,
    required super.name,
    required super.image,
    required super.isFeatured,
    super.parentId,
  });

  // EMPTY HELPER FUNCTION
  static CategoryModel empty() =>
      CategoryModel(id: 0, name: '', image: '', isFeatured: false);

  CategoryModel copyWith({
    int? id,
    String? name,
    String? image,
    String? parentId,
    bool? isFeatured,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      parentId: parentId ?? this.parentId,
      isFeatured: isFeatured ?? this.isFeatured,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'image': image});
    result.addAll({'parent_id': parentId});
    result.addAll({'is_featured': isFeatured});

    return result;
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      parentId: map['parent_id'] ?? '',
      isFeatured: map['is_featured'] ?? false,
    );
  }

  @override
  String toString() {
    return 'CategoryModel(id: $id, name: $name, image: $image, parentId: $parentId, isFeatured: $isFeatured)';
  }
}
