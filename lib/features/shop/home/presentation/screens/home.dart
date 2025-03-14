import 'package:ahiaa/core/common/widgets/layouts/gid_layout.dart';
import 'package:ahiaa/core/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ahiaa/core/common/widgets/texts/section_heading.dart';
import 'package:ahiaa/core/dependency/init_dependencies.dart';
import 'package:ahiaa/features/shop/home/presentation/cubit/palette/color_cubit.dart';
import 'package:ahiaa/features/shop/store/presentation/cubit/scroller/scroll_cubit.dart';
import 'package:ahiaa/utils/constants/sizes.dart';
import 'package:ahiaa/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/brands/brand_showcase1.dart';
import '../../../../../core/common/widgets/containers/rounded_container.dart';
import '../../../../../core/common/widgets/list_tiles/category_tiles.dart';
import '../../../../../core/common/widgets/products/product_cards/product_card.dart';
import '../../../../../utils/constants/colors.dart';
import 'widgets/home_appbar.dart';
import 'widgets/page_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        body: NestedScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          headerSliverBuilder: (_, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                scrolledUnderElevation: 2,
                // backgroundColor: PColors.transparent,
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                stretch: false,
                expandedHeight: 0,
                toolbarHeight: kToolbarHeight + 55,
                collapsedHeight: kToolbarHeight + 55,
                flexibleSpace: // APP BAR
                    Column(
                  // spacing: PSizes.sm,
                  children: [
                    HomeAppBar(),
                    CategoryGrid(),
                    Material(
                      color: !isDark ? PColors.white : PColors.black,
                      child: Divider(
                        thickness: 0.5,
                        endIndent: 5,
                        indent: 5,
                        color:
                            !isDark
                                ? PColors.dark.withValues(alpha: 0.1)
                                : PColors.light.withValues(alpha: 0.1),
                      ),
                    ),
                    // CATEGORIES
                  ],
                ),
              ),
            ];
          },
          body:
          // GRID LAYOUT
          TabBarView(
            physics: AlwaysScrollableScrollPhysics(),
            children: [
              // CATEGORIES
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: PSizes.spaceBtwItems,
                ),
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  children: [
                    Column(
                      spacing: PSizes.spaceBtwItems,

                      children: [
                        PSectionHeading(
                          title: 'Popular Products',
                          onPressed: () {},
                        ),
                        GridLayout(
                          itemCount: 4,

                          // mainAxisExtent: 270,
                          itemBuilder: (_, index) => PProductCardVertical(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],

            // controller: serviceLocator<ScrollCubit>().state,
          ),
        ),
      ),
    );
  }
}
