import 'package:ahiaa/core/cubits/imagePicker/image_picker.dart';
import 'package:ahiaa/core/dependency/init_dependencies.dart';
import 'package:ahiaa/features/shop/product/data/models/product_model.dart';
import 'package:ahiaa/utils/exceptions/subabase/server_exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/services/storage/storage/storage_cubit.dart';

abstract interface class ProductRemoteDataSource {
  Future<ProductModel> uploadProduct(ProductModel productModel);
  Future<List<String>> uploadProductImage(ProductModel product);
  Future<List<ProductModel>> getAllProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final SupabaseClient supabaseClient;

  ProductRemoteDataSourceImpl({required this.supabaseClient});
  @override
  Future<ProductModel> uploadProduct(ProductModel productModel) async {
    try {
      final product =
          await supabaseClient
              .from('products')
              .insert(productModel.toMap())
              .select();

      return ProductModel.fromMap(product.first);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<String>> uploadProductImage(ProductModel product) async {
    try {
      List<String> imagesUrl = [];
      final images = serviceLocator<ImageCubit>().state;

      for (var image in images) {
        final imageUrl = await serviceLocator<StorageCubit>()
            .uploadImageToSupabase(
              image: image,
              path: 'products/${product.id}',
              bucketId: 'products',
            );
        imagesUrl.add(imageUrl);
      }

      serviceLocator<ImageCubit>().emptyCubit();
      return imagesUrl;
    } catch (e) {
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
}
