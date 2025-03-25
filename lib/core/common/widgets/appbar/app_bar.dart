import 'package:ahiaa/core/common/widgets/icons/circular_icon.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class PAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PAppBar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.autoImplyLeading = false,
    this.centerTitle = false,
    this.useCircle = false,

    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
    this.appBarHeight = kToolbarHeight,
    this.padding,
    this.width,
    this.height,
    this.size,
  });

  final Widget? title;
  final bool showBackArrow, autoImplyLeading, centerTitle, useCircle;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final EdgeInsetsGeometry? padding;
  final double appBarHeight;
  final double? width, height, size;

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: PSizes.sm),
      child: AppBar(
        centerTitle: centerTitle,
        backgroundColor: PColors.transparent,
        automaticallyImplyLeading: autoImplyLeading,
        leading:
            showBackArrow
                ? useCircle
                    ? PCircularIcon(
                      icon: Iconsax.arrow_left,
                      onPressed: () => Beamer.of(context).beamBack(),
                      width: width,
                      height: height,
                      color: PColors.dark2,
                      size: size,
                    )
                    : IconButton(
                      onPressed: () => Beamer.of(context).beamBack(),
                      icon: Icon(
                        Iconsax.arrow_left,
                        color: isDark ? PColors.white : PColors.dark,
                      ),
                    )
                : leadingIcon != null
                ? IconButton(
                  onPressed: leadingOnPressed,
                  icon: Icon(leadingIcon),
                )
                : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
