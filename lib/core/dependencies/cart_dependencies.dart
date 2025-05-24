import 'package:ahiaa/core/dependencies/init_dependencies.dart';
import 'package:ahiaa/features/shop/cart/business_logic/bloc/cart_bloc.dart';

import '../../features/shop/cart/business_logic/cubit/cart_service.dart';

void initCartDependencies() {
  serviceLocator
    ..registerLazySingleton(() => CartBloc())
    ..registerLazySingleton(() => CartService());
}
