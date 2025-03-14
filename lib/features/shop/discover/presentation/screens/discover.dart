import 'package:ahiaa/core/common/widgets/appbar/searchBar.dart';
import 'package:ahiaa/core/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ahiaa/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: KSearchBar(
        isCollapsed: true,
        isDense: true,
        useMargin: true,
        radius: 50,
        hasColor: false,
        childrensColor:
            isDark
                ? PColors.white.withValues(alpha: 0.7)
                : PColors.black.withValues(alpha: 0.7),
        color:
            isDark
                ? PColors.white.withValues(alpha: 0.3)
                : PColors.black.withValues(alpha: 0.7),
        useBorder: true,
        hintText: 'Search Categories',

        useSearch: true,
        margin: EdgeInsets.only(
          left: PSizes.spaceBtwItems,
          right: PSizes.spaceBtwItems,
          top: kToolbarHeight,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ]
          
        ),
      ),
    );
  }
}
