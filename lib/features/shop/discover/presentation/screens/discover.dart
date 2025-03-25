import 'package:ahiaa/core/common/widgets/icons/circular_icon.dart';
import 'package:ahiaa/core/common/widgets/layouts/staggered_layout.dart';
import 'package:ahiaa/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/common/widgets/appbar/app_bar.dart';
import '../../../../../core/common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../home/presentation/screens/widgets/home_appbar.dart';
import 'widgets/search_widget.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: PAppBar(
        showBackArrow: false,
        // useCircle: true,
        // width: 40,
        // height: 40,
        // size: 20,
        actions: [
          PCircularIcon(
            icon: Iconsax.shopping_cart,
            height: 40,
            width: 40,
            size: 20,
            color: PColors.dark2,
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          spacing: PSizes.spaceBtwItems,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomeAppBar(),
            SearchWidgets(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: PSizes.spaceBtwItems,
              ),
              child: Column(
                spacing: PSizes.spaceBtwItems,

                children: [
                  PSectionHeading(
                    title: 'Top Selling',
                    onPressed: () {},
                    spacing: PSizes.md,
                  ),
                  StaggeredProductLayout(itemCount: 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
