import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/common/widgets/appbar/app_bar.dart';
import '../../../../../../core/common/widgets/appbar/searchBar.dart';
import '../../../../../../core/common/widgets/containers/rounded_container.dart';
import '../../../../../../core/common/widgets/icons/circular_icon.dart';
import '../../../../../../core/routes/route_names.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/device/device_utility.dart';
import '../../../../../../utils/helpers/helper_functions.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    this.backgroundColor,
    this.appBarHeight = kToolbarHeight,
  });
  final Color? backgroundColor;
  final double appBarHeight;
  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      backgroundColor: backgroundColor,
      radius: 0,
      child: PAppBar(
        appBarHeight: appBarHeight,
        padding: EdgeInsets.only(bottom: PSizes.sm),
        title: SizedBox(
          height: 45,
          child: KSearchBar(
            radius: 50,
            hasColor: false,
            childrensColor:
                isDark ? PColors.white.withValues(alpha: 0.7) : PColors.black,
            color:
                isDark
                    ? PColors.white.withValues(alpha: 0.3)
                    : PColors.black.withValues(alpha: 0.7),
            useBorder: true,
            hintText: 'Search Ahiaa',

            useSearch: true,
            usePrefixSuffix: true,
            suffixWidget: Icon(Iconsax.microphone, color: PColors.black),

            // isDense: true,
            // isCollapsed: true,
          ),
        ),
        actions: [
          // PCircularIcon(
          //   icon: Iconsax.notification,
          //   backgroundColor: PColors.transparent,
          //   color:
          //       isDark
          //           ? PColors.white.withValues(alpha: 0.7)
          //           : PColors.black.withValues(alpha: 0.7),
          //   width: 40,
          //   height: 40,
          // ),
          PCircularIcon(
            onPressed: () {
              Beamer.of(context).beamToNamed(RouteNames.cart);
              debugPrint(Beamer.of(context).currentPages.first.name.toString());
              debugPrint(Beamer.of(context).currentBeamLocation.toString());

              debugPrint(
                Beamer.of(context).currentConfiguration?.uri.toString(),
              );
            },
            // backgroundColor: PColors.transparent,
            color: PColors.black,
            // isDark
            //     ? PColors.white.withValues(alpha: 0.7)
            //     : PColors.black.withValues(alpha: 0.7),
            icon: Iconsax.camera,
            width: 45,
            height: 45,
            size: 20,
          ),
          SizedBox(width: PSizes.sm),
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(PDeviceUtils.getAppBarHeight() + PSizes.sm);
}
