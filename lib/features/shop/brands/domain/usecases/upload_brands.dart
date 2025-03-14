import 'package:ahiaa/core/usecases/usecase.dart';
import 'package:ahiaa/features/shop/brands/domain/entities/brands.dart';
import 'package:ahiaa/utils/exceptions/exceptions.dart';
import 'package:fpdart/src/either.dart';

import '../repository/brand_repository.dart';

class UploadBrands implements UseCase<Brand, UploadBrandsParams> {
  final BrandRepository _repository;

  UploadBrands({required BrandRepository repository})
    : _repository = repository;
  @override
  Future<Either<Failure, Brand>> call(UploadBrandsParams params) async {
    return await _repository.uploadBrand(
      id: params.id,
      name: params.name,
      image: params.image,
      isFeatured: params.isFeatured,
      productsCount: params.productsCount,
    );
  }
}

class UploadBrandsParams {
  final String id;
  final String name;
  final String image;
  final bool? isFeatured;
  final int? productsCount;

  UploadBrandsParams({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    required this.productsCount,
  });
}
