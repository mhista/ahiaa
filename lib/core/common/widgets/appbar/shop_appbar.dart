import 'package:ahiaa/core/common/widgets/appbar/tapBar.dart';
import 'package:ahiaa/core/common/widgets/containers/rounded_container.dart';
import 'package:ahiaa/utils/constants/sizes.dart';
import 'package:ahiaa/utils/device/device_utility.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../features/shop/store/presentation/cubit/expand_cubit.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../dependency/init_dependencies.dart';
import '../brands/brand_heading.dart';

class ShopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ShopAppBar({
    super.key,
    this.storeColor,
  });
  final Color? storeColor;

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        Stack(
          children: [
            BlocBuilder<ExpandCubit, bool>(builder: (context, state) {
              return serviceLocator<ExpandCubit>().state
                  ? FadeInDown(
                      child: TRoundedContainer(
                        // height: 100,
                        radius: 0,
                        backgroundColor: isDark ? PColors.black : PColors.white,
                      ),
                    )
                  : SizedBox.shrink();
            }),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: PSizes.buttonWidth),
              child: BlocBuilder<ExpandCubit, bool>(
                builder: (context, state) {
                  return serviceLocator<ExpandCubit>().state
                      ? FadeInDown(
                          child: Container(
                            margin: const EdgeInsets.only(top: kToolbarHeight),
                            child: BrandInfoWidget(
                              usesBrandImage: false,
                              appBarScrolled: true,
                              onBrandImageTapped: () {},
                              onFollowTapped: () {},
                            ),
                          ),
                        )
                      : SizedBox(
                          child: BrandInfoWidget(
                            removeBgImage: true,
                            storeColor: storeColor,
                            usesBrandImage: true,
                            onBrandImageTapped: () {},
                            onFollowTapped: () {},
                          ),
                        );
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: PSizes.spaceBtwSections,
        ),
        BlocBuilder<ExpandCubit, bool>(builder: (context, state) {
          return PTabBar(
              labelColor: serviceLocator<ExpandCubit>().state
                  ? isDark
                      ? PColors.light
                      : PColors.dark
                  : storeColor,
              unSelectedLabelColor: serviceLocator<ExpandCubit>().state
                  ? isDark
                      ? PColors.light.withOpacity(0.4)
                      : PColors.dark.withOpacity(0.4)
                  : storeColor!.withOpacity(0.4),
              backGroundColor: PColors.transparent,
              useIndicator: false,
              tabs: [
                Text('Natural fruits'),
                Text('Organic fruits'),
              ]);
        })
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(PDeviceUtils.getAppBarHeight());
}
