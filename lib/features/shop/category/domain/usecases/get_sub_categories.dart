import 'package:fpdart/fpdart.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../../../utils/exceptions/exceptions.dart';
import '../entities/category.dart';
import '../repository/category_repository.dart';

class GetSubCategories implements UseCase<List<Category>, SubCatParams> {
  final CategoryRepository _categoryRepo;

  GetSubCategories({required CategoryRepository categoryRepo})
    : _categoryRepo = categoryRepo;

  @override
  Future<Either<Failure, List<Category>>> call(SubCatParams params) async {
    return await _categoryRepo.getSubCategories(params.categoryID);
  }
}

class SubCatParams {
  final String categoryID;

  SubCatParams({required this.categoryID});
}
