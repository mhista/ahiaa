part of 'category_bloc.dart';

@immutable
sealed class CategoryEvent {}

final class GetAllCategory extends CategoryEvent {}

final class GetAllFeaturedCategory extends CategoryEvent {}

final class GetSubCategory extends CategoryEvent {
  final int? categoryId;

  GetSubCategory({this.categoryId});
}

final class CategoryUpload extends CategoryEvent {
  final int? id;
  final String name;
  final String image;
  final String? parentId;
  final bool isFeatured;
  final int productCounts;

  CategoryUpload({
    this.id,
    required this.name,
    required this.image,
    this.parentId,
    required this.isFeatured,
    required this.productCounts,
  });
}

final class GetAllParentCategories extends CategoryEvent {}
