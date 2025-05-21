import 'package:ahiaa/core/dependency/init_dependencies.dart';
import 'package:ahiaa/features/shop/product/data/datasources/product_remote_data_source.dart';
import 'package:ahiaa/features/shop/product/data/repository/product_repo_impl.dart';
import 'package:ahiaa/features/shop/product/domain/repository/product_repositories.dart';
import 'package:ahiaa/features/shop/product/domain/usecase/get_all_products.dart';
import 'package:ahiaa/features/shop/product/domain/usecase/get_products_by_brand.dart';
import 'package:ahiaa/features/shop/product/domain/usecase/upload_product.dart';
import 'package:ahiaa/features/shop/product/business_logic/bloc/product_bloc.dart';

import '../../features/shop/product/business_logic/cubits/attribute_cubits.dart';
import '../../features/shop/product/business_logic/cubits/sub_categories.dart'
    show ProductSubCategoryCubit, SubCategoryCheckboxCubit;
import '../../features/shop/product/business_logic/cubits/variation_cubit.dart';
import '../../features/shop/product/domain/usecase/get_featured_products.dart';
import '../../features/shop/product/services/product_text_controllers.dart';

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
    ..registerFactory(() => GetProductsByBrand(productRepo: serviceLocator()))
    ..registerFactory(() => GetFeaturedProducts(productRepo: serviceLocator()))
    ..registerLazySingleton(() => ProductAttributeCubits())
    ..registerLazySingleton(() => ProductVariationCubit())
    ..registerLazySingleton(() => ProductSubCategoryCubit())
    ..registerLazySingleton(() => SubCategoryCheckboxCubit())
    ..registerLazySingleton(
      () => ProductBloc(
        uploadProduct: serviceLocator(),
        getAllProducts: serviceLocator(),
        getProductsByBrand: serviceLocator(),
        getFeaturedProducts: serviceLocator(),
      ),
    )
    ..registerLazySingleton<ProductTextControllers>(
      () => ProductTextControllers.create(),
    );
}
