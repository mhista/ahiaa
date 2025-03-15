import 'package:fpdart/fpdart.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../../../utils/exceptions/exceptions.dart';
import '../entities/category.dart';
import '../repository/category_repository.dart';

class GetAllCategories implements UseCase<List<Category>, NoParams> {
  final CategoryRepository _categoryRepo;

  GetAllCategories({required CategoryRepository categoryRepo})
    : _categoryRepo = categoryRepo;

  @override
  Future<Either<Failure, List<Category>>> call(NoParams params) async {
    return await _categoryRepo.getAllCategories();
  }
}
