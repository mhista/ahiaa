import 'package:ahiaa/core/usecases/usecase.dart';
import 'package:ahiaa/features/shop/brands/domain/entities/brands.dart';
import 'package:ahiaa/features/shop/brands/domain/repository/brand_repository.dart';
import 'package:ahiaa/utils/exceptions/exceptions.dart';
import 'package:fpdart/fpdart.dart';

class GetAllBrands implements UseCase<List<Brand>, NoParams> {
  final BrandRepository _brandRepo;

  GetAllBrands({required BrandRepository brandRepo}) : _brandRepo = brandRepo;
  @override
  Future<Either<Failure, List<Brand>>> call(NoParams params) async {
    return await _brandRepo.getAllBrands();
  }
}
