import 'package:ahiaa/core/cubits/appstart/appstart_cubit.dart';
import 'package:ahiaa/features/auth/presentation/login/login.dart';
import 'package:ahiaa/features/auth/presentation/signup/signup.dart';
import 'package:ahiaa/core/routes/beamer_config.dart';
import 'package:ahiaa/core/routes/locations.dart';
import 'package:ahiaa/utils/constants/colors.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      routerDelegate: DelegateBeamer.beamerDelegate,
      routeInformationParser: BeamerParser(),
      backButtonDispatcher: BeamerBackButtonDispatcher(
        delegate: DelegateBeamer.beamerDelegate,
      ),
    );
  }
}

class AppStartRedirector extends StatelessWidget {
  const AppStartRedirector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppStartCubit, AppStartState>(
      listener: (context, state) {
        if (state is AppStartNavigate) {
          Beamer.of(
            context,
          ).beamToReplacementNamed(state.route, stacked: false);
        }
      },
      child: Scaffold(
        body: Center(
          child: Center(
            child: CircularProgressIndicator(color: PColors.primary),
          ),
        ),
      ),
    );
  }
}
