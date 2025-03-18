import 'package:ahiaa/utils/exceptions/exceptions.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../core/entities/coupon.dart';
import '../../../brands/data/models/brandmodel.dart';
import '../../../brands/domain/entities/brands.dart';
import '../../data/models/product_attributes.dart';
import '../../data/models/product_variations.dart';
import '../entities/product.dart';

abstract interface class ProductRepository {
  Future<Either<Failure, Products>> uploadProduct({
    required String sellerId,
    required int stock,
    required String sku,
    required double price,
    required double salePrice,
    required String title,
    required String thumbnail,
    required bool isFeatured,
    required BrandModel brand,
    required String description,
    required String categoryId,
    required List<String> images,
    required String productType,
    required List<ProductAttributeModel> productAttributes,
    required List<ProductVariationModel> productVariations,
    required bool canResale,
    required double resaleAddedAmount,
    required Coupon coupon,
  });

  Future<Either<Failure, List<Products>>> getAllProducts();
  Future<Either<Failure, List<Products>>> getProductsByBrand({
    required String brandId,
    int limit = -1,
  });
  Future<Either<Failure, List<Products>>> getFeaturedProducts();
  Future<Either<Failure, List<Products>>> getAllFeaturedProducts();
  Future<Either<Failure, List<Products>>> getRecommendedProducts();
  Future<Either<Failure, List<Products>>> getAllRecommendedProducts();
  // Future<Either<Failure, List<Products>>> fetchProductsByQuery(Query query);
  Future<Either<Failure, List<Products>>> getFavoriteProducts(
    List<String> productId,
  );
}
