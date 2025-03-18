import 'package:ahiaa/core/cubits/imagePicker/image_picker.dart';
import 'package:ahiaa/core/dependency/init_dependencies.dart';
import 'package:ahiaa/core/entities/coupon.dart';
import 'package:ahiaa/core/services/storage/storage/storage_cubit.dart';
import 'package:ahiaa/features/shop/brands/domain/entities/brands.dart';
import 'package:ahiaa/features/shop/product/data/datasources/product_remote_data_source.dart';
import 'package:ahiaa/features/shop/product/data/models/product_attributes.dart';
import 'package:ahiaa/features/shop/product/data/models/product_model.dart';
import 'package:ahiaa/features/shop/product/data/models/product_variations.dart';
import 'package:ahiaa/features/shop/product/domain/entities/product.dart';
import 'package:ahiaa/features/shop/product/domain/repository/product_repositories.dart';
import 'package:ahiaa/utils/exceptions/exceptions.dart';
import 'package:ahiaa/utils/exceptions/subabase/server_exceptions.dart';
import 'package:fpdart/fpdart.dart';
import 'package:uuid/uuid.dart';

import '../../../brands/data/models/brandmodel.dart';

class ProductRepoImpl implements ProductRepository {
  final ProductRemoteDataSource _dataSource;

  ProductRepoImpl({required ProductRemoteDataSource dataSource})
    : _dataSource = dataSource;

  @override
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
  }) async {
    try {
      ProductModel product = ProductModel(
        id: const Uuid().v1(),
        stock: stock,
        price: price,
        title: title,
        thumbnail: thumbnail,
        productType: productType,
        canResale: canResale,
        sku: sku,
        salePrice: salePrice,
        date: DateTime.now(),
        isFeatured: isFeatured,
        brand: brand,
        description: description,
        categoryId: categoryId,
        images: images,
        productAttributes: productAttributes,
        productVariations: productVariations,
        resaleAddedAmount: resaleAddedAmount,
        coupon: coupon,
        sellerId: sellerId,
      );

      final imagesUrl = await _dataSource.uploadProductImage(product);
      product = product.copyWith(
        thumbnail: imagesUrl[0],
        images: imagesUrl.sublist(0),
      );

      final uploadedProduct = await _dataSource.uploadProduct(product);
      return right(uploadedProduct);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Products>>> getAllProducts() async {
    try {
      final products = await _dataSource.getAllProducts();
      return right(products);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Products>>> getAllFeaturedProducts() async {
    try {
      final products = await _dataSource.getAllFeaturedProducts();
      return right(products);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Products>>> getAllRecommendedProducts() async {
    try {
      final products = await _dataSource.getAllRecommendedProducts();
      return right(products);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Products>>> getFavoriteProducts(
    List<String> productId,
  ) async {
    try {
      final products = await _dataSource.getFavoriteProducts(productId);
      return right(products);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Products>>> getFeaturedProducts() async {
    try {
      final products = await _dataSource.getFeaturedProducts();
      return right(products);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Products>>> getProductsByBrand({
    required String brandId,
    int limit = -1,
  }) async {
    try {
      final products = await _dataSource.getProductsByBrand(
        brandId: brandId,
        limit: limit,
      );
      return right(products);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Products>>> getRecommendedProducts() async {
    try {
      final products = await _dataSource.getRecommendedProducts();
      return right(products);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
