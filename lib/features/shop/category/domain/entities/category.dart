import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int? id;
  final String name;
  String image;
  final String parentId;
  final bool isFeatured;
  Category({
    this.id,
    required this.name,
    required this.image,
    this.parentId = '',
    required this.isFeatured,
  });

  @override
  List<Object?> get props => [id, name, image, parentId, isFeatured];
}
