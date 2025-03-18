import 'package:ahiaa/core/usecases/usecase.dart';
import 'package:ahiaa/features/shop/product/domain/entities/product.dart';
import 'package:ahiaa/utils/exceptions/exceptions.dart';
import 'package:fpdart/fpdart.dart';

import '../repository/product_repositories.dart';

class GetFeaturedProducts
    implements UseCase<List<Products>, FavProductsParams> {
  final ProductRepository _productRepo;

  GetFeaturedProducts({required ProductRepository productRepo})
    : _productRepo = productRepo;
  @override
  Future<Either<Failure, List<Products>>> call(FavProductsParams params) async {
    return params.useLimit
        ? await _productRepo.getAllFeaturedProducts()
        : await _productRepo.getFeaturedProducts();
  }
}

class FavProductsParams {
  final bool useLimit;

  FavProductsParams({this.useLimit = true});
}
