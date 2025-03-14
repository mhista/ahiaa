import 'package:ahiaa/core/dependency/init_dependencies.dart';
import 'package:ahiaa/features/shop/product/data/datasources/product_remote_data_source.dart';
import 'package:ahiaa/features/shop/product/data/repository/product_repo_impl.dart';
import 'package:ahiaa/features/shop/product/domain/repository/product_repositories.dart';
import 'package:ahiaa/features/shop/product/domain/usecase/get_all_products.dart';
import 'package:ahiaa/features/shop/product/domain/usecase/upload_product.dart';
import 'package:ahiaa/features/shop/product/presentation/bloc/product_bloc.dart';

void initProductDependencies() {
  serviceLocator
    ..registerFactory<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(supabaseClient: serviceLocator()),
    )
    ..registerFactory<ProductRepository>(
      () => ProductRepoImpl(dataSource: serviceLocator()),
    )
    ..registerFactory(() => UploadProduct(productRepo: serviceLocator()))
    ..registerFactory(() => GetAllProducts(productRepo: serviceLocator()))
    ..registerLazySingleton(
      () => ProductBloc(
        uploadProduct: serviceLocator(),
        getAllProducts: serviceLocator(),
      ),
    );
}
