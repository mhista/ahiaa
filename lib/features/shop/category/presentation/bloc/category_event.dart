part of 'category_bloc.dart';

@immutable
sealed class CategoryEvent {}

final class GetAllCategory extends CategoryEvent {}

final class GetAllFeaturedCategory extends CategoryEvent {}

final class GetSubCategory extends CategoryEvent {
  final int categoryId;

  GetSubCategory({required this.categoryId});
}

final class CategoryUpload extends CategoryEvent {
  final int? id;
  final String name;
  final String image;
  final String? parentId;
  final bool isFeatured;

  CategoryUpload({
    this.id,
    required this.name,
    required this.image,
    this.parentId,
    required this.isFeatured,
  });
}

class GetAllParentCategories extends CategoryEvent {}
