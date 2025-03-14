import 'package:ahiaa/core/dependency/init_dependencies.dart';
import 'package:ahiaa/features/shop/brands/data/datasource/brand_dart_source.dart';
import 'package:ahiaa/features/shop/brands/domain/repository/brand_repository.dart';
import 'package:ahiaa/features/shop/brands/domain/usecases/upload_brands.dart';

import '../../features/shop/brands/data/repository/brandRepoImpl.dart'
    show BrandRepoImpl;
import '../../features/shop/brands/domain/usecases/get_all_brands.dart';
import '../../features/shop/brands/presentation/bloc/brand_bloc.dart';

void initBrandDependencies() {
  serviceLocator
    ..registerFactory<BrandDataSource>(
      () => BrandDataSourceImpl(supabaseClient: serviceLocator()),
    )
    ..registerFactory<BrandRepository>(
      () => BrandRepoImpl(dataSource: serviceLocator()),
    )
    ..registerFactory(() => UploadBrands(repository: serviceLocator()))
    ..registerFactory(() => GetAllBrands(brandRepo: serviceLocator()))
    ..registerLazySingleton(
      () => BrandBloc(
        uploadBrands: serviceLocator(),
        getAllBrands: serviceLocator(),
      ),
    );
}
