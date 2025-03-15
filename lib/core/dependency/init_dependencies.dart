import 'package:ahiaa/core/cubits/imagePicker/image_picker.dart';
import 'package:ahiaa/core/cubits/user/user_cubit.dart';
import 'package:ahiaa/core/dependency/banner_dependencies.dart';
import 'package:ahiaa/core/dependency/brand_dependencies.dart';
import 'package:ahiaa/core/dependency/category_dependencies.dart';
import 'package:ahiaa/core/dependency/product_dependencies.dart';
import 'package:ahiaa/core/services/storage/storage/storage_cubit.dart';
import 'package:ahiaa/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:ahiaa/features/auth/data/repository/auth_repository_impl.dart';
import 'package:ahiaa/features/auth/domain/usecases/current_user.dart';
import 'package:ahiaa/features/auth/domain/usecases/login.dart';
import 'package:ahiaa/features/auth/domain/usecases/signup.dart';
import 'package:ahiaa/features/auth/domain/repository/auth_repository.dart';
import 'package:ahiaa/features/shop/home/presentation/cubit/navigation/navigation_cubit.dart';
import 'package:ahiaa/features/shop/home/presentation/cubit/palette/palette_cubit.dart';
import 'package:ahiaa/features/shop/store/presentation/cubit/scroller/shop_scroller.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/shop/home/presentation/cubit/banners/banner_cubit.dart';
import '../../features/shop/home/presentation/cubit/palette/color_cubit.dart';
import '../../features/shop/store/presentation/cubit/scroller/scroll_cubit.dart';
import '../../features/shop/store/presentation/cubit/expand_cubit.dart';
import '../../utils/secrets/app_secret.dart';

// register factory in getit registers a new instance everytime it is called
// register singleton in getit registers the same instance every time it is called
final serviceLocator = GetIt.instance;
Future<void> initDepenedencies() async {
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnon,
  );
  // create a new
  serviceLocator.registerLazySingleton(() => supabase.client);
  _initAuth();
  await _initCubits();
  // other dependencies
  initProductDependencies();
  initBrandDependencies();
  initBannerDependencies();
  initCategoryDependencies();
}

// initialize authentication

void _initAuth() {
  // serviceLocator.registerSingleton<AuthService>(() => AuthService());
  // register authentication datasource
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceSupabaseImp(
        supabaseClient:
            serviceLocator(), //pass in type if necessary serviceLocator<SupabaseClient>()
      ),
    )
    // register authentication repository
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(remoteDataSource: serviceLocator()),
    )
    // register user signup
    ..registerFactory(() => UserSignUp(authRepository: serviceLocator()))
    // register user sign in
    ..registerFactory(() => UserLogin(authRepository: serviceLocator()))
    // register current user
    ..registerFactory(() => CurrentUser(authRepository: serviceLocator()))
    // register auth bloc
    ..registerLazySingleton(
      () => AuthBloc(
        userSignUp: serviceLocator(),
        userLogin: serviceLocator(),
        currentUser: serviceLocator(),
        userCubit: serviceLocator(),
      ),
    );
}

Future<void> _initCubits() async {
  // initialize user cubits
  _initUserCubits();
  // initialize home cubits
  _initHomeCubits();
  // register palette cubit
  _initPaletteCubits();
  // register color cubit
  _initColorCubits();
  // register storage cubit
  _initStorageCubits();
  // register store cubit
  _initStoreCubits();
  // register scroll cubit
  _initScrollCubits();
}

// initialize user cubits
void _initUserCubits() {
  serviceLocator.registerLazySingleton(() => UserCubit());
}

// initialize home cubit
void _initHomeCubits() {
  // register navigation service
  serviceLocator
    ..registerLazySingleton(() => NavigationCubit())
    // register banner cubit
    ..registerLazySingleton(() => BannerCubit());
}

// register color cubit
void _initColorCubits() {
  serviceLocator
    ..registerLazySingleton(() => ColorCubit())
    ..registerLazySingleton(() => AppBarColorCubit());
}

// register palette service
void _initPaletteCubits() {
  serviceLocator.registerCachedFactory(() => PaletteCubit());
}

void _initStorageCubits() {
  serviceLocator.registerCachedFactory(() => StorageCubit());
  serviceLocator.registerCachedFactory(() => ImageCubit());
}

void _initStoreCubits() {
  serviceLocator.registerLazySingleton(() => ExpandCubit());
  serviceLocator.registerLazySingleton(() => StopStartScroll());
}

// initialize Scroll cubit
void _initScrollCubits() {
  // register navigation service
  serviceLocator
    ..registerLazySingleton(() => ScrollCubit())
    ..registerLazySingleton(() => ScrollCubit2());
}
