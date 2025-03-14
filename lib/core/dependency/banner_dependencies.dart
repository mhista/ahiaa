import 'package:ahiaa/core/dependency/init_dependencies.dart';
import 'package:ahiaa/features/shop/banner/data/datasource/banner_data_source.dart';
import 'package:ahiaa/features/shop/banner/domain/repository/banner_repository.dart';
import 'package:ahiaa/features/shop/banner/domain/usecases/getAllBanners.dart';
import 'package:ahiaa/features/shop/banner/presentation/bloc/banner_bloc.dart';

import '../../features/shop/banner/data/repository/banner_repo_impl.dart';

void initBannerDependencies() {
  serviceLocator
    ..registerFactory<BannerDataSource>(
      () => BannerRemoteDataSource(supabaseClient: serviceLocator()),
    )
    ..registerFactory<BannerRepository>(
      () => BannerRepoImpl(bannerDataSource: serviceLocator()),
    )
    // ..registerFactory(() => UploadBrands(repository: serviceLocator()))
    ..registerFactory(() => GetAllBanners(repository: serviceLocator()))
    ..registerLazySingleton(() => BannerBloc(getAllBanners: serviceLocator()));
}
