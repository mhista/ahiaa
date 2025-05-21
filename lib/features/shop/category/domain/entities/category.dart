import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int? id;
  final String name;
  final String image;
  final String parentId;
  final bool isFeatured;
  final int productCounts;
  const Category({
    this.id,
    required this.name,
    required this.image,
    this.parentId = '',
    required this.isFeatured,
    required this.productCounts,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    image,
    parentId,
    isFeatured,
    productCounts,
  ];
}
