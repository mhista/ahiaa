import 'package:ahiaa/utils/exceptions/exceptions.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../core/entities/coupon.dart';
import '../../../brands/data/models/brandmodel.dart';
import '../../../../../core/entities/product.dart';

abstract interface class ProductRepository {
  Future<Either<Failure, Products>> uploadProduct({
    required String sellerId,
    required int stock,
    String? sku,
    required double price,
    double? salePrice,
    required String title,
    bool? isFeatured,
    BrandModel? brand,
    required String description,
    required int categoryId,
    required String productType,
    bool? canResale,
    double? resaleAddedAmount,
    Coupon? coupon,
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
