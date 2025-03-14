import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class PAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PAppBar(
      {super.key,
      this.title,
      this.showBackArrow = false,
      this.autoImplyLeading = false,
      this.centerTitle = false,
      this.leadingIcon,
      this.actions,
      this.leadingOnPressed,
      this.padding});

  final Widget? title;
  final bool showBackArrow, autoImplyLeading, centerTitle;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: PSizes.sm),
      child: AppBar(
        centerTitle: centerTitle,
        backgroundColor: PColors.transparent,
        automaticallyImplyLeading: autoImplyLeading,
        leading: showBackArrow
            ? IconButton(
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
  Size get preferredSize => Size.fromHeight(PDeviceUtils.getAppBarHeight());
}
