import 'package:ahiaa/core/dependencies/init_dependencies.dart';
import 'package:ahiaa/features/shop/home/presentation/screens/home.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/routes/route_names.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/helpers/helper_functions.dart';
import '../../../../discover/presentation/screens/discover.dart';
import '../../../../../personalization/presentation/personalisation.dart';
import '../../../../../support/presentation/support.dart';
import '../../../../product/presentation/screens/vendor/upload_product.dart';
import 'navigation_cubit.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  List<List> get screenIcons {
    return [
      [Icons.home_outlined, Icons.home_rounded, 'Home'],
      [Iconsax.search_normal, Iconsax.search_normal, 'Search'],
      [Iconsax.add_circle, Iconsax.add_circle5, 'sell'],
      [Iconsax.heart, Iconsax.heart5, 'Wishlist'],
      [Iconsax.user, Icons.person_rounded, 'Account'],
    ];
  }

  List<String> get labels {
    return [
      RouteNames.home,
      RouteNames.discover,
      RouteNames.sell,
      RouteNames.favourites,
      RouteNames.personalization,
    ];
  }

  List<Widget> get screens {
    return [
      HomeScreen(),
      const DiscoverScreen(),
      const UploadProductScreen(),
      const SupportScreen(),
      ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: BlocBuilder<NavigationCubit, int>(
        builder: (context, state) {
          return NavigationBar(
            backgroundColor: isDark ? PColors.dark : PColors.white,
            surfaceTintColor: PColors.transparent,
            indicatorColor: PColors.transparent,
            labelTextStyle: WidgetStateProperty.all(
              TextStyle(fontWeight: FontWeight.w500),
            ),
            selectedIndex: serviceLocator<NavigationCubit>().state,
            onDestinationSelected: (index) {
              serviceLocator<NavigationCubit>().updateIndex(index);
            },
            destinations:
                screenIcons
                    .map(
                      (e) => NavigationDestination(
                        icon: Icon(
                          screenIcons[state].first == e.first ? e[1] : e[0],
                          // size: size.width,
                          color:
                              screenIcons[state] == e
                                  ? PColors.primary
                                  : Colors.black,
                        ),
                        label: e[2],
                      ),
                    )
                    .toList(),
          );
        },
      ),

      body: BlocBuilder<NavigationCubit, int>(
        builder: (context, state) => screens[state],
      ),
    );
  }
}
