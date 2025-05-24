import 'package:ahiaa/core/dependencies/init_dependencies.dart';
import 'package:ahiaa/features/auth/presentation/onboarding/onboarding.dart';
import 'package:ahiaa/features/auth/presentation/signup/signup.dart';
import 'package:ahiaa/features/shop/home/presentation/cubit/navigation/navigation_menu.dart';
import 'package:ahiaa/features/shop/store/presentation/screens/shop.dart';
import 'package:ahiaa/core/routes/route_names.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app.dart';
import '../../../features/auth/presentation/login/login.dart';
import '../../cubits/appstart/appstart_cubit.dart';

class AuthLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      if (state.uri.path == '/onboarding')
        const BeamPage(
          key: ValueKey('onboarding'),
          title: 'onboarding',
          child: OnBoardingScreen(),
        ),
      if (state.uri.path == '/')
        const BeamPage(
          key: ValueKey('appRedirect'),
          title: 'appRedirect',
          child: AppStartRedirector(),
        ),
      if (state.uri.path == '/login')
        const BeamPage(
          key: ValueKey('login'),
          title: 'Login',
          child: LoginScreen(),
        ),
      if (state.uri.path == '/signup')
        const BeamPage(
          key: ValueKey('signup'),
          title: 'Signup',
          child: SignupScreen(),
        ),
    ];
    return pages;
  }

  @override
  List<Pattern> get pathPatterns => [
    '/',
    RouteNames.onBoardinig,
    RouteNames.sigin,
    RouteNames.signup,
  ];
}
