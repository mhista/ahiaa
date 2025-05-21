import 'package:ahiaa/features/shop/category/data/datasource/category_data_source.dart';
import 'package:ahiaa/features/shop/category/domain/entities/category.dart';

import 'package:ahiaa/utils/exceptions/exceptions.dart';
import 'package:flutter/widgets.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../utils/exceptions/subabase/server_exceptions.dart';
import '../../domain/repository/category_repository.dart';
import '../models/category_model.dart';

class CategoryRepoImpl implements CategoryRepository {
  final CategoryDataSource _categoryDataSource;

  CategoryRepoImpl({required CategoryDataSource categoryDataSource})
    : _categoryDataSource = categoryDataSource;
  @override
  Future<Either<Failure, List<Category>>> getAllCategories() async {
    try {
      final categories = await _categoryDataSource.getAllCategories();
      return right(categories);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getSubCategories(
    int categoryId,
  ) async {
    try {
      final categories = await _categoryDataSource.getSubCategories(categoryId);
      return right(categories);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Category>> uploadCategory({
    required id,
    required name,
    required image,
    required parentId,
    required isFeatured,
    required productCounts,
  }) async {
    debugPrint(id.toString());
    try {
      CategoryModel categoryModel = CategoryModel(
        id: id,
        name: name,
        image: image,
        isFeatured: isFeatured,
        parentId: parentId,
        productCounts: productCounts,
      );
      debugPrint('uploading category ${id.toString()}');

      final imageUrl = await _categoryDataSource.uploadImage(categoryModel);
      debugPrint('uploaded category image ${id.toString()}');
      debugPrint('uploaded category image ${imageUrl.toString()}');
      debugPrint('uploaded category image ${parentId.toString()}');

      // final cat =
      final category = await _categoryDataSource.uploadCategory(
        categoryModel.copyWith(image: imageUrl),
      );
      debugPrint('uploaded category ${id.toString()}');

      return right(category);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getParentCategories() async {
    try {
      final categories = await _categoryDataSource.getParentCategories();
      return right(categories);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
