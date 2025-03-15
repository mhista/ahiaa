import 'package:fpdart/fpdart.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../../../utils/exceptions/exceptions.dart';
import '../entities/category.dart';
import '../repository/category_repository.dart';

class UploadCategories implements UseCase<Category, CategoryParams> {
  final CategoryRepository _categoryRepo;

  UploadCategories({required CategoryRepository categoryRepo})
    : _categoryRepo = categoryRepo;

  @override
  Future<Either<Failure, Category>> call(CategoryParams params) async {
    return await _categoryRepo.uploadCategory(
      id: params.id,
      name: params.name,
      image: params.image,
      isFeatured: params.isFeatured,
    );
  }
}

class CategoryParams {
  final String id;
  final String name;
  final String image;
  final String parentId;
  final bool isFeatured;
  CategoryParams({
    required this.id,
    required this.name,
    required this.image,
    this.parentId = '',
    required this.isFeatured,
  });
}
