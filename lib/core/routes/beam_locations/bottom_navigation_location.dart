import 'package:ahiaa/features/shop/home/presentation/cubit/navigation/navigation_menu.dart';
import 'package:ahiaa/features/shop/home/presentation/screens/home.dart';
import 'package:ahiaa/core/routes/route_names.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../../features/shop/discover/presentation/screens/discover.dart';
import '../../../features/personalization/presentation/personalisation.dart';
import '../../../features/support/presentation/support.dart';

class NavigationMenuLocator extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final location = state.uri.path;
    switch (location) {
      // case RouteNames.home:
      //   return [
      //     BeamPage(
      //       title: 'Home',
      //       child: NavigationMenu(),
      //     ),
      //   ];
      case RouteNames.discover:
        return [
          BeamPage(
            title: 'Discover',
            child: DiscoverScreen(),
          ),
        ];
      case RouteNames.support:
        return [
          BeamPage(
            title: 'Support',
            child: SupportScreen(),
          ),
        ];
      case RouteNames.personalization:
        return [
          BeamPage(
            title: 'Personalization',
            child: PersonalizationScreen(),
          ),
        ];
      default:
        return [
          BeamPage(
            title: 'Home',
            child: NavigationMenu(),
          ),
        ];
    }
  }

  @override
  List<Pattern> get pathPatterns => [
        RouteNames.home,
        RouteNames.discover,
        RouteNames.support,
        RouteNames.personalization
      ];
}
