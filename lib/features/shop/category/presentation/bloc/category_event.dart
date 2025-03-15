part of 'category_bloc.dart';

@immutable
sealed class CategoryEvent {}

final class GetAllCategory extends CategoryEvent {}

final class GetSubCategory extends CategoryEvent {
  final String categoryId;

  GetSubCategory({required this.categoryId});
}

final class CategoryUpload extends CategoryEvent {
  final String id;
  final String name;
  final String image;
  final String parentId;
  final bool isFeatured;

  CategoryUpload({
    required this.id,
    required this.name,
    required this.image,
    required this.parentId,
    required this.isFeatured,
  });
}
