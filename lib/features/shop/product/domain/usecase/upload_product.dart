import 'package:ahiaa/features/shop/product/domain/repository/product_repositories.dart';
import 'package:ahiaa/utils/exceptions/exceptions.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../core/entities/coupon.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../brands/data/models/brandmodel.dart';
import '../../../brands/domain/entities/brands.dart';
import '../../data/models/product_attributes.dart';
import '../../data/models/product_variations.dart';
import '../../../../../core/entities/product.dart';

class UploadProduct implements UseCase<Products, ProductParams> {
  final ProductRepository _productRepo;

  UploadProduct({required ProductRepository productRepo})
    : _productRepo = productRepo;
  @override
  Future<Either<Failure, Products>> call(ProductParams params) async {
    return await _productRepo.uploadProduct(
      stock: params.stock,
      sku: params.sku,
      price: params.price,
      salePrice: params.salePrice,
      title: params.title,
      isFeatured: params.isFeatured,
      brand: params.brand,
      description: params.description,
      categoryId: params.categoryId,
      canResale: params.canResale,
      resaleAddedAmount: params.resaleAddedAmount,
      coupon: params.coupon,
      sellerId: params.sellerId,
      productType: params.productType,
    );
  }
}

class ProductParams {
  final String sellerId;
  final int stock;
  final String? sku;
  final double price;
  final double? salePrice;
  final String title;
  final bool? isFeatured;
  final BrandModel? brand;
  final String description;
  final String categoryId;
  final String productType;
  final bool? canResale;
  final double? resaleAddedAmount;
  final Coupon? coupon;

  ProductParams({
    required this.sellerId,
    required this.stock,
    this.sku,
    required this.price,
    this.salePrice,
    required this.title,
    this.isFeatured,
    this.brand,
    required this.description,
    required this.categoryId,
    required this.productType,
    this.canResale,
    this.resaleAddedAmount,
    this.coupon,
  });
}
