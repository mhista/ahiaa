import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class PTabBar extends StatelessWidget implements PreferredSizeWidget {
  const PTabBar({
    super.key,
    required this.tabs,
    this.useIndicator = true,
    this.labelColor,
    this.unSelectedLabelColor,
    this.backGroundColor,
  });
  final List<Widget> tabs;

  // to add the background color to tabs, wrap with material widget.
  final bool useIndicator;
  final Color? labelColor, unSelectedLabelColor, backGroundColor;

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return Material(
      color: backGroundColor ?? (isDark ? PColors.black : PColors.white),
      child: TabBar(
        indicator: UnderlineTabIndicator(
          borderSide:
              useIndicator
                  ? BorderSide(width: 2.0, color: PColors.primary)
                  : BorderSide.none,
        ),
        dividerColor: useIndicator ? PColors.primary : PColors.transparent,
        tabs: tabs,
        tabAlignment: TabAlignment.start,
        labelStyle: TextTheme.of(context).headlineSmall!.apply(
          color: labelColor ?? (isDark ? PColors.white : PColors.dark),
        ),
        unselectedLabelStyle: TextTheme.of(
          context,
        ).headlineSmall!.apply(color: unSelectedLabelColor ?? PColors.darkGrey),
        isScrollable: true,

        padding: const EdgeInsets.only(right: 0),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(PDeviceUtils.getAppBarHeight());
}
