import 'package:ahiaa/core/usecases/usecase.dart';
import 'package:ahiaa/features/shop/product/domain/entities/product.dart';
import 'package:ahiaa/utils/exceptions/exceptions.dart';
import 'package:fpdart/fpdart.dart';

import '../repository/product_repositories.dart';

class GetFeaturedProducts
    implements UseCase<List<Products>, FeaturedProductsParams> {
  final ProductRepository _productRepo;

  GetFeaturedProducts({required ProductRepository productRepo})
    : _productRepo = productRepo;
  @override
  Future<Either<Failure, List<Products>>> call(
    FeaturedProductsParams params,
  ) async {
    return params.useLimit
        ? await _productRepo.getAllFeaturedProducts()
        : await _productRepo.getFeaturedProducts();
  }
}

class FeaturedProductsParams {
  final bool useLimit;

  FeaturedProductsParams({this.useLimit = true});
}
