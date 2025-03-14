import 'package:ahiaa/features/shop/brands/domain/entities/brands.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../utils/exceptions/exceptions.dart';

abstract class BrandRepository {
  Future<Either<Failure, List<Brand>>> getAllBrands();
  Future<Either<Failure, Brand>> uploadBrand({
    required id,
    required name,
    required image,
    isFeatured,
    productsCount,
  });
}
