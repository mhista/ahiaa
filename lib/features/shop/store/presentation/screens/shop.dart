import 'package:ahiaa/core/common/widgets/containers/product_container.dart';
import 'package:ahiaa/core/common/widgets/containers/rounded_container.dart';
import 'package:ahiaa/core/common/widgets/layouts/gid_layout.dart';
import 'package:ahiaa/core/dependencies/init_dependencies.dart';
import 'package:ahiaa/features/shop/home/presentation/cubit/palette/color_cubit.dart';
import 'package:ahiaa/utils/helpers/helper_functions.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/appbar/shop_appbar.dart';
import '../../../../../core/common/widgets/containers/gradiant_bg_container.dart';
import '../../../../../core/common/widgets/products/product_cards/product_card.dart';
import '../../../../../utils/constants/colors.dart';
import '../cubit/scroller/scroll_cubit.dart';
import '../cubit/expand_cubit.dart';
import '../cubit/scroller/shop_scroller.dart';
import 'widgets/shop_bg_image.dart';
import 'widgets/tab_bar_children.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          // if (context.mounted) {
          serviceLocator<ExpandCubit>().makeTrue(false);
          serviceLocator<StopStartScroll>().makeTrue(true);
          Beamer.of(context).beamBack();
          // }
        },
        child: Scaffold(
          // backgroundColor: PColors.transparent,
          body: CustomScrollView(
            controller: serviceLocator<ScrollCubit>().state,
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: PColors.transparent,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.dark,
                ),
                pinned: true,
                floating: false,
                expandedHeight: 350,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      ShopImage(),
                      BlocBuilder<ColorCubit, Color>(
                        builder: (context, state) {
                          return Container(
                            // height: 350,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: AlignmentDirectional.topCenter,
                                end: AlignmentDirectional.bottomCenter,
                                colors: [
                                  PColors.transparent,
                                  serviceLocator<ColorCubit>().state
                                      .withOpacity(0.1),
                                  serviceLocator<ColorCubit>().state
                                      .withOpacity(0.7),
                                  serviceLocator<ColorCubit>().state
                                      .withOpacity(0.9),
                                  serviceLocator<ColorCubit>().state,
                                ],
                              ),
                            ),
                            // backgroundColor: PColors.transparent,
                          );
                        },
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: BlocBuilder<ExpandCubit, bool>(
                          builder: (context, state) {
                            return AnimatedOpacity(
                              opacity:
                                  serviceLocator<ExpandCubit>().state ? 0 : 1,
                              duration: Duration(milliseconds: 500),
                              child: Text(
                                'Agro Market',
                                style: Theme.of(
                                  context,
                                ).textTheme.displayMedium!.apply(
                                  fontWeightDelta: 3,
                                  fontSizeDelta: 2,
                                  color: PColors.grey.withOpacity(0.8),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // bottom:
              ),
              SliverFillRemaining(
                child: AnimatedPageSlide(
                  child: TRoundedContainer(
                    backgroundColor: PColors.transparent,
                    child: Column(
                      children: [
                        // ShopAppBar(
                        //   storeColor: PColors.grey,
                        // ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              ShopTabBarChildren(),
                              ShopTabBarChildren(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // body: TRoundedContainer()),
  // );
}
