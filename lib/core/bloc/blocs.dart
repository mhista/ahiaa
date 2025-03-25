import 'package:ahiaa/core/cubits/appstart/appstart_cubit.dart';
import 'package:ahiaa/core/cubits/imagePicker/image_picker.dart';
import 'package:ahiaa/core/services/storage/storage/storage_cubit.dart';
import 'package:ahiaa/features/shop/banner/presentation/bloc/banner_bloc.dart';
import 'package:ahiaa/features/shop/brands/presentation/bloc/brand_bloc.dart';
import 'package:ahiaa/features/shop/category/presentation/bloc/category_bloc.dart';
import 'package:ahiaa/features/shop/product/presentation/bloc/product_bloc.dart';
import 'package:ahiaa/features/shop/store/presentation/cubit/scroller/scroll_cubit.dart';
import 'package:ahiaa/features/shop/store/presentation/cubit/scroller/shop_scroller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/shop/store/presentation/cubit/expand_cubit.dart';
import '../cubits/navigation/navigation_cubit.dart';
import '../cubits/user/user_cubit.dart';
import '../dependency/init_dependencies.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/shop/home/presentation/cubit/banners/banner_cubit.dart';
import '../../features/shop/home/presentation/cubit/navigation/navigation_cubit.dart';
import '../../features/shop/home/presentation/cubit/palette/color_cubit.dart';
import '../../features/shop/home/presentation/cubit/palette/palette_cubit.dart';

class AllBlocsProvider {
  static final multiblocprovider = [
    BlocProvider<AppStartCubit>(
      create: (_) => serviceLocator<AppStartCubit>()..checkAppStart(),
    ),

    BlocProvider<AuthBloc>(create: (_) => serviceLocator<AuthBloc>()),
    BlocProvider<ProductBloc>(create: (_) => serviceLocator<ProductBloc>()),
    BlocProvider<BrandBloc>(create: (_) => serviceLocator<BrandBloc>()),
    BlocProvider<BannerBloc>(create: (_) => serviceLocator<BannerBloc>()),
    BlocProvider<CategoryBloc>(create: (_) => serviceLocator<CategoryBloc>()),

    // cubits
    BlocProvider<NavigationCubit>(
      create: (_) => serviceLocator<NavigationCubit>(),
    ),

    // ONBOARDING CUBIT
    BlocProvider<OnboardingCubit>(
      create: (_) => serviceLocator<OnboardingCubit>(),
    ),

    BlocProvider<PaletteCubit>(create: (_) => serviceLocator<PaletteCubit>()),
    BlocProvider<BannerCubit>(create: (_) => serviceLocator<BannerCubit>()),
    // color cubit
    BlocProvider<ColorCubit>(create: (_) => serviceLocator<ColorCubit>()),
    BlocProvider<AppBarColorCubit>(
      create: (_) => serviceLocator<AppBarColorCubit>(),
    ),
    // scroll cubit
    BlocProvider<ScrollCubit>(create: (_) => serviceLocator<ScrollCubit>()),
    BlocProvider<ScrollCubit2>(create: (_) => serviceLocator<ScrollCubit2>()),
    // user cubit
    BlocProvider<UserCubit>(create: (_) => serviceLocator<UserCubit>()),
    // storage cubit
    BlocProvider<StorageCubit>(create: (_) => serviceLocator<StorageCubit>()),
    // image picker cubit
    BlocProvider<ImageCubit>(create: (_) => serviceLocator<ImageCubit>()),
    //  store cubit
    BlocProvider<ExpandCubit>(create: (_) => serviceLocator<ExpandCubit>()),
    BlocProvider<StopStartScroll>(
      create: (_) => serviceLocator<StopStartScroll>(),
    ),
  ];
}
