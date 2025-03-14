import 'package:ahiaa/core/common/widgets/appbar/tapBar.dart';
import 'package:ahiaa/core/common/widgets/containers/rounded_container.dart';
import 'package:ahiaa/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../layouts/list_layout.dart';
import '../texts/category_text.dart';

class CategoryGrid extends StatelessWidget implements PreferredSizeWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return SizedBox(
      // height: 30,
      child: PTabBar(
        tabs: [Text('AgroProduce')],
        useIndicator: false,
        labelColor:
            isDark
                ? PColors.light.withValues(alpha: 0.4)
                : PColors.dark.withValues(alpha: 0.4),
        backGroundColor: !isDark ? PColors.white : PColors.black,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(PDeviceUtils.getAppBarHeight());
}
