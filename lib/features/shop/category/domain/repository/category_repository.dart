import 'package:fpdart/fpdart.dart';

import '../../../../../utils/exceptions/exceptions.dart';
import '../entities/category.dart';

abstract interface class CategoryRepository {
  Future<Either<Failure, List<Category>>> getAllCategories();
  Future<Either<Failure, List<Category>>> getParentCategories();

  Future<Either<Failure, List<Category>>> getSubCategories(int categoryId);
  Future<Either<Failure, Category>> uploadCategory({
    required id,
    required name,
    required image,
    required parentId,
    required isFeatured,
  });
}
