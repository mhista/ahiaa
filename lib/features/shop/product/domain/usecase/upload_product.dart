import 'package:ahiaa/features/shop/product/domain/repository/product_repositories.dart';
import 'package:ahiaa/utils/exceptions/exceptions.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../core/entities/coupon.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../brands/domain/entities/brands.dart';
import '../../data/models/product_attributes.dart';
import '../../data/models/product_variations.dart';
import '../entities/product.dart';

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
      thumbnail: params.thumbnail,
      isFeatured: params.isFeatured,
      brand: params.brand,
      description: params.description,
      categoryId: params.categoryId,
      images: params.images,
      productType: params.productType,
      productAttributes: params.productAttributes,
      productVariations: params.productVariations,
      canResale: params.canResale,
      resaleAddedAmount: params.resaleAddedAmount,
      coupon: params.coupon,
      sellerId: params.sellerId,
    );
  }
}

class ProductParams {
  final String sellerId;
  final int stock;
  final String sku;
  final double price;
  final double salePrice;
  final String title;
  final String thumbnail;
  final bool isFeatured;
  final BrandModel brand;
  final String description;
  final String categoryId;
  final List<String> images;
  final String productType;
  final List<ProductAttributeModel> productAttributes;
  final List<ProductVariationModel> productVariations;
  final bool canResale;
  final double resaleAddedAmount;
  final Coupon coupon;

  ProductParams({
    required this.sellerId,
    required this.stock,
    required this.sku,
    required this.price,
    required this.salePrice,
    required this.title,
    required this.thumbnail,
    required this.isFeatured,
    required this.brand,
    required this.description,
    required this.categoryId,
    required this.images,
    required this.productType,
    required this.productAttributes,
    required this.productVariations,
    required this.canResale,
    required this.resaleAddedAmount,
    required this.coupon,
  });
}
