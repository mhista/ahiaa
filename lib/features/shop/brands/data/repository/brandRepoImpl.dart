import 'package:ahiaa/features/shop/brands/data/datasource/brand_dart_source.dart';
import 'package:ahiaa/features/shop/brands/domain/entities/brands.dart';
import 'package:ahiaa/features/shop/brands/domain/repository/brand_repository.dart';
import 'package:ahiaa/utils/exceptions/exceptions.dart';
import 'package:fpdart/src/either.dart';

import '../../../../../utils/exceptions/subabase/server_exceptions.dart';

class BrandRepoImpl implements BrandRepository {
  final BrandDataSource _dataSource;

  BrandRepoImpl({required BrandDataSource dataSource})
    : _dataSource = dataSource;
  @override
  Future<Either<Failure, List<Brand>>> getAllBrands() async {
    try {
      final brands = await _dataSource.getAllBrands();
      return right(brands);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Brand>> uploadBrand({
    required id,
    required name,
    required image,
    isFeatured,
    productsCount,
  }) {
    // TODO: implement uploadData
    throw UnimplementedError();
  }
}
