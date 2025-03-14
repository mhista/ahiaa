import 'package:ahiaa/core/usecases/usecase.dart';
import 'package:ahiaa/features/shop/product/domain/entities/product.dart';
import 'package:ahiaa/utils/exceptions/exceptions.dart';
import 'package:fpdart/fpdart.dart';

import '../repository/product_repositories.dart';

class GetAllProducts implements UseCase<List<Products>, NoParams> {
  final ProductRepository _productRepo;

  GetAllProducts({required ProductRepository productRepo})
    : _productRepo = productRepo;
  @override
  Future<Either<Failure, List<Products>>> call(NoParams params) async {
    return await _productRepo.getAllProducts();
  }
}
