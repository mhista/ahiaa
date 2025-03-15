import 'package:ahiaa/features/shop/category/data/datasource/category_data_source.dart';
import 'package:ahiaa/features/shop/category/domain/entities/category.dart';

import 'package:ahiaa/utils/exceptions/exceptions.dart';
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
    String categoryId,
  ) async {
    try {
      final categories = await _categoryDataSource.getAllCategories();
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
    parentId = '',
    required isFeatured,
  }) async {
    try {
      CategoryModel categoryModel = CategoryModel(
        id: id,
        name: name,
        image: image,
        isFeatured: isFeatured,
        parentId: parentId,
      );
      final imageUrl = await _categoryDataSource.uploadImage(categoryModel);
      final category = await _categoryDataSource.uploadCategory(
        categoryModel.copyWith(image: imageUrl),
      );
      return right(category);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
