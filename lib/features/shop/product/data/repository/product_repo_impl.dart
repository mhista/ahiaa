import 'package:ahiaa/core/dependency/init_dependencies.dart';
import 'package:ahiaa/core/entities/coupon.dart';
import 'package:ahiaa/features/shop/product/business_logic/cubits/sub_categories.dart';
import 'package:ahiaa/features/shop/product/business_logic/cubits/variation_cubit.dart';
import 'package:ahiaa/features/shop/product/data/datasources/product_remote_data_source.dart';
import 'package:ahiaa/features/shop/product/data/models/product_model.dart';
import 'package:ahiaa/core/entities/product.dart';
import 'package:ahiaa/features/shop/product/domain/repository/product_repositories.dart';
import 'package:ahiaa/utils/exceptions/exceptions.dart';
import 'package:ahiaa/utils/exceptions/subabase/server_exceptions.dart';
import 'package:fpdart/fpdart.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/cubits/imagePicker/image_picker.dart';
import '../../../brands/data/models/brandmodel.dart';
import '../../business_logic/cubits/attribute_cubits.dart';

class ProductRepoImpl implements ProductRepository {
  final ProductRemoteDataSource _dataSource;

  ProductRepoImpl({required ProductRemoteDataSource dataSource})
    : _dataSource = dataSource;

  @override
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
  }) async {
    final productAttribute = serviceLocator<ProductAttributeCubits>();
    final productVariation = serviceLocator<ProductVariationCubit>();
    final subCategories = serviceLocator<ProductSubCategoryCubit>();

    try {
      ProductModel product = ProductModel(
        id: const Uuid().v1(),
        stock: stock,
        price: price,
        title: title,
        thumbnail: '',
        productType: productType,
        canResale: canResale,
        sku: sku,
        salePrice: salePrice,
        date: DateTime.now(),
        isFeatured: isFeatured,
        brand: brand,
        description: description,
        categoryId: categoryId,
        images: [],
        productAttributes: productAttribute.state,
        productVariations:
            productVariation.state!.isEmpty ? null : productVariation.state,
        resaleAddedAmount: resaleAddedAmount,
        coupon: coupon,
        sellerId: sellerId,
        subCategories: subCategories.state.toList(),
      );
      // debugPrint('Product images: ${product.toString()}');

      final imagesUrl = await _dataSource.uploadProductImage(product);
      final productModel = product.copyWith(
        thumbnail: imagesUrl[0],
        images: imagesUrl.length > 1 ? imagesUrl.sublist(1) : [imagesUrl[0]],
      );

      final uploadedProduct = await _dataSource.uploadProduct(productModel);
      // empty the cubits
      productAttribute.emptyCubit();
      productVariation.emptyCubit();
      subCategories.emptyCubit();
      serviceLocator<ImageCubit>().emptyCubit();

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
