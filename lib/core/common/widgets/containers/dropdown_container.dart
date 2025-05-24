import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import 'rounded_container.dart';

class DropDownContainer extends StatelessWidget {
  const DropDownContainer({
    super.key,
    required this.isDark,
    required this.dropDownTexts,
  });

  final bool isDark;
  final List dropDownTexts;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      width: 100,
      // padding: EdgeInsets.all(0),
      useContainerGradient: false,
      // backgroundColor: isDark ? PColors.dark : PColors.light,
      height: 30,
      radius: 16,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: CustomDropdown(
          // expandedHeaderPadding: EdgeInsets.all(0),
          closedHeaderPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          decoration: CustomDropdownDecoration(
            closedFillColor:
                isDark ? PColors.black : PColors.white.withOpacity(0.5),
            expandedFillColor: isDark ? PColors.black : PColors.white,
            // closedBorderRadius: BorderRadius.circular(16),
            // closedBorder: Border.all(width: ),
            closedSuffixIcon: const Icon(Icons.keyboard_arrow_down, size: 14),
            hintStyle: Theme.of(
              context,
            ).textTheme.labelSmall!.apply(fontSizeDelta: -1),
            listItemStyle: Theme.of(
              context,
            ).textTheme.labelSmall!.apply(fontSizeDelta: -1),
            headerStyle: Theme.of(
              context,
            ).textTheme.labelSmall!.apply(fontSizeDelta: -1),
          ),
          items: dropDownTexts,
          hintText: dropDownTexts[0],
          initialItem: dropDownTexts[0],
          onChanged: (value) {},
        ),
      ),
    );
  }
}
