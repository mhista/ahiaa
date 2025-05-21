import 'package:ahiaa/core/cubits/imagePicker/image_picker.dart';
import 'package:ahiaa/core/dependency/init_dependencies.dart';
import 'package:ahiaa/features/shop/product/data/models/product_model.dart';
import 'package:ahiaa/utils/exceptions/subabase/server_exceptions.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/services/storage/storage/storage_cubit.dart';

abstract interface class ProductRemoteDataSource {
  Future<ProductModel> uploadProduct(ProductModel productModel);
  Future<List<String>> uploadProductImage(ProductModel product);
  Future<List<ProductModel>> getAllProducts();
  Future<List<ProductModel>> getProductsByBrand({
    required String brandId,
    int limit = -1,
  });
  Future<List<ProductModel>> getFeaturedProducts();
  Future<List<ProductModel>> getAllFeaturedProducts();
  Future<List<ProductModel>> getRecommendedProducts();
  Future<List<ProductModel>> getAllRecommendedProducts();
  // Future<List<ProductModel>> fetchProductsByQuery(Query query);
  Future<List<ProductModel>> getFavoriteProducts(List<String> productId);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final SupabaseClient supabaseClient;

  ProductRemoteDataSourceImpl({required this.supabaseClient});
  @override
  Future<ProductModel> uploadProduct(ProductModel productModel) async {
    debugPrint('uploading product');
    debugPrint(productModel.toString());
    try {
      final product =
          await supabaseClient
              .from('products')
              .insert(productModel.toMap())
              .select();

      return ProductModel.fromMap(product.first);
    } on ServerException catch (e) {
      debugPrint(e.toString());

      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<String>> uploadProductImage(ProductModel product) async {
    try {
      List<String> imagesUrl = [];
      final images = serviceLocator<ImageCubit>().state;

      for (var image in images) {
        final imageUrl = await serviceLocator<StorageCubit>().uploadImageToSupabase(
          image: image,
          path:
              'products/${product.sellerId}/${product.id}/${image.path.split('/').last}',
          bucketId: 'products',
        );
        imagesUrl.add(imageUrl);
      }

      // debugPrint('uploaded product image');
      return imagesUrl;
    } on ServerException catch (e) {
      debugPrint(e.toString());

      throw ServerException(e.toString());
    } on StorageException catch (e) {
      debugPrint(e.toString());

      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final products = await supabaseClient
          .from('products')
          .select('*, profiles (*)'); //profile(name)
      return products
          .map(
            (product) => ProductModel.fromMap(
              product,
            ).copyWith(user: product['profiles']),
          )
          .toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final products = await supabaseClient
          .from('products')
          .select('*, profiles (*)')
          .eq('is_featured', true); //profile(name)
      return products
          .map(
            (product) => ProductModel.fromMap(
              product,
            ).copyWith(user: product['profiles']),
          )
          .toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<ProductModel>> getAllRecommendedProducts() {
    // TODO: implement getAllRecommendedProducts
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> getFavoriteProducts(List<String> productId) {
    // TODO: implement getFavoriteProducts
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final products = await supabaseClient
          .from('products')
          .select('*, profiles (*)')
          .eq('is_featured', true)
          .limit(4); //profile(name)
      return products
          .map(
            (product) => ProductModel.fromMap(
              product,
            ).copyWith(user: product['profiles']),
          )
          .toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<ProductModel>> getProductsByBrand({
    required String brandId,
    int limit = -1,
  }) async {
    try {
      final products =
          limit == -1
              ? await supabaseClient
                  .from('products')
                  .select('*, profiles (*)')
                  .eq('brand->>id', brandId)
              : await supabaseClient
                  .from('products')
                  .select('*, profiles (*)')
                  .eq('brand->>id', brandId)
                  .limit(limit); //profile(name)
      return products
          .map(
            (product) => ProductModel.fromMap(
              product,
            ).copyWith(user: product['profiles']),
          )
          .toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<ProductModel>> getRecommendedProducts() {
    // TODO: implement getRecommendedProducts
    throw UnimplementedError();
  }
}
