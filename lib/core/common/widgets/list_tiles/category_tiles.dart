import 'package:flutter/material.dart';

import 'package:ahiaa/core/common/widgets/appbar/tapBar.dart';
import 'package:ahiaa/core/common/widgets/containers/rounded_container.dart';
import 'package:ahiaa/utils/constants/sizes.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class CategoryGrid extends StatelessWidget implements PreferredSizeWidget {
  const CategoryGrid({super.key, this.isSelected = true});
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return SizedBox(
      // height: 30,
      child: PTabBar(
        tabs: [
          TRoundedContainer(
            radius: PSizes.md + 6,
            backgroundColor:
                isSelected ? PColors.primary.withValues(alpha: 0.02) : null,
            showBorder: isSelected ? false : true,
            padding: EdgeInsets.symmetric(
              vertical: PSizes.sm - 2,
              horizontal: PSizes.sm + 2,
            ),
            child: Text(
              'All Product',
              style: Theme.of(context).textTheme.titleMedium!.apply(
                color:
                    isSelected ? PColors.primary.withValues(alpha: 0.6) : null,
              ),
            ),
          ),
        ],
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
