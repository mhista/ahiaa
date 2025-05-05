import 'package:fpdart/fpdart.dart';

import 'package:ahiaa/core/usecases/usecase.dart';
import 'package:ahiaa/core/entities/product.dart';
import 'package:ahiaa/utils/exceptions/exceptions.dart';

import '../repository/product_repositories.dart';

class GetProductsByBrand
    implements UseCase<List<Products>, BrandProductParams> {
  final ProductRepository _productRepo;

  GetProductsByBrand({required ProductRepository productRepo})
    : _productRepo = productRepo;
  @override
  Future<Either<Failure, List<Products>>> call(
    BrandProductParams params,
  ) async {
    return await _productRepo.getProductsByBrand(
      brandId: params.brandId,
      limit: params.limit ?? -1,
    );
  }
}

class BrandProductParams {
  final String brandId;
  final int? limit;
  BrandProductParams({required this.brandId, this.limit});
}
