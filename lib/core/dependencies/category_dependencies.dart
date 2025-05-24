import 'package:ahiaa/features/shop/category/data/datasource/category_data_source.dart';
import 'package:ahiaa/features/shop/category/data/repository/category_repo_impl.dart';
import 'package:ahiaa/features/shop/category/domain/repository/category_repository.dart';
import 'package:ahiaa/features/shop/category/domain/usecases/get_parent_categories.dart';

import 'package:ahiaa/features/shop/category/domain/usecases/upload_categories.dart';
import 'package:ahiaa/features/shop/category/presentation/bloc/category_bloc.dart';

import '../../features/shop/category/domain/usecases/get_all_categories.dart';
import '../../features/shop/category/domain/usecases/get_sub_categories.dart';
import '../../features/shop/category/services/category_services.dart';
import 'init_dependencies.dart';

void initCategoryDependencies() {
  serviceLocator
    ..registerFactory<CategoryDataSource>(
      () => CategoryDataSourceImpl(supabaseClient: serviceLocator()),
    )
    ..registerFactory<CategoryRepository>(
      () => CategoryRepoImpl(categoryDataSource: serviceLocator()),
    )
    ..registerFactory(() => UploadCategories(categoryRepo: serviceLocator()))
    ..registerFactory(() => GetAllCategories(categoryRepo: serviceLocator()))
    ..registerFactory(() => GetSubCategories(categoryRepo: serviceLocator()))
    ..registerFactory(() => GetParentCategories(categoryRepo: serviceLocator()))
    ..registerLazySingleton(
      () => CategoryBloc(
        uploadCategories: serviceLocator(),
        getAllCategories: serviceLocator(),
        getSubCategories: serviceLocator(),
        getParentCategories: serviceLocator(),
      ),
    )
    ..registerLazySingleton<CategoryService>(() => CategoryService());
}
