import 'package:ahiaa/features/auth/presentation/login/login.dart';
import 'package:ahiaa/features/auth/presentation/signup/signup.dart';
import 'package:ahiaa/core/routes/beamer_config.dart';
import 'package:ahiaa/core/routes/locations.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      routerDelegate: DelegateBeamer.beamerDelegate,
      routeInformationParser: BeamerParser(),
      backButtonDispatcher:
          BeamerBackButtonDispatcher(delegate: DelegateBeamer.beamerDelegate),
    );
  }
}
