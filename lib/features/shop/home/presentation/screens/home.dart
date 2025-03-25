import 'package:ahiaa/core/common/widgets/containers/rounded_container.dart';
import 'package:ahiaa/core/common/widgets/icons/circular_icon.dart'
    show PCircularIcon;
import 'package:ahiaa/core/common/widgets/images/circular_images.dart'
    show PCircularImage;
import 'package:ahiaa/core/common/widgets/images/edge_rounded_images.dart'
    show PRoundedImage;
import 'package:ahiaa/core/common/widgets/layouts/gid_layout.dart';
import 'package:ahiaa/core/common/widgets/layouts/staggered_layout.dart';
import 'package:ahiaa/core/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ahiaa/core/common/widgets/texts/section_heading.dart';
import 'package:ahiaa/features/shop/home/presentation/screens/widgets/home_categories.dart';
import 'package:ahiaa/utils/constants/image_strings.dart' show PImages;
import 'package:ahiaa/utils/constants/sizes.dart';
import 'package:ahiaa/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/common/widgets/list_tiles/category_tiles.dart';
import '../../../../../utils/constants/colors.dart';
import 'widgets/home_appbar.dart';
import 'widgets/page_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final isDark = PHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        body: NestedScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          headerSliverBuilder: (_, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                scrolledUnderElevation: 2,
                backgroundColor: PColors.white,
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                stretch: false,
                expandedHeight: 0,

                toolbarHeight: kToolbarHeight + 10,
                collapsedHeight: kToolbarHeight + 10,
                flexibleSpace: // APP BAR
                    Column(
                  mainAxisSize: MainAxisSize.min,
                  // spacing: PSizes.sm,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: kToolbarHeight - 10,
                        left: PSizes.spaceBtwItems,
                        right: PSizes.spaceBtwItems,
                        bottom: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: PCircularImage(
                              imageUrl: PImages.appLogo,
                              height: 45,
                              width: 45,
                              backgroundColor: PColors.transparent,
                            ),
                          ),
                          // Text(
                          //   'Ahiaa',
                          //   style: Theme.of(context).textTheme.headlineMedium!
                          //       .apply(fontWeightDelta: -2, fontSizeDelta: -2),
                          // ),
                          PCircularIcon(
                            height: 45,
                            width: 45,
                            icon: Iconsax.shopping_cart,
                            color: PColors.black,
                          ),
                        ],
                      ),
                    ),

                    // HomeAppBar(appBarHeight: PSizes.spaceBtwItems),
                  ],
                ),
                bottom: HomeAppBar(),
              ),
            ];
          },
          body:
          // GRID LAYOUT
          Column(
            children: [
              CategoryGrid(),
              SizedBox(height: PSizes.spaceBtwItems),
              // TODO : Each Tab is a category from the main categories of men, women, children, sports etc. and each tab has its own sub categories too
              Expanded(
                child: TabBarView(
                  physics: AlwaysScrollableScrollPhysics(),
                  children: [
                    // CATEGORIES
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: PSizes.spaceBtwItems,
                      ),
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        // shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        child: Column(
                          children: [
                            // BANNER
                            PageSlider(),
                            // POPULAR PRODUCTS

                            // PRODUCT SPECIFIC CATEGROIES
                            PHomeCategories(),
                            Column(
                              spacing: PSizes.spaceBtwItems,

                              children: [
                                PSectionHeading(
                                  title: 'Popular Products',
                                  onPressed: () {},
                                  spacing: PSizes.md,
                                ),
                                StaggeredProductLayout(itemCount: 4),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],

                  // controller: serviceLocator<ScrollCubit>().state,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
