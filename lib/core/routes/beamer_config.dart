import 'package:ahiaa/core/routes/locations.dart';
import 'package:beamer/beamer.dart';

class DelegateBeamer {
  static final beamerDelegate = BeamerDelegate(
    // initialPath: '/',
    locationBuilder:
        // RoutesLocationBuilder(
        //   routes: {
        //     '/':
        //         (context, state, data) => BlocProvider(
        //           create: (_) => AppStartCubit()..checkAppStart(),
        //           child: AppStartRedirector(),
        //         ),
        //     '/home': (context, state, data) => NavigationMenuLocator(),
        //     '/login': (context, state, data) => LoginScreen(),
        //     '/onboarding': (context, state, data) => OnBoardingScreen(),
        //   },
        // ).call,
        BeamerLocationBuilder(
          beamLocations: BeamerLocations.beamLocations,
        ).call,
    guards: [],
  );
}
