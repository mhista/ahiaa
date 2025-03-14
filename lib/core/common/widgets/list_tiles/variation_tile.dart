import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart' show PHelperFunctions;

class VariationTile extends StatelessWidget {
  const VariationTile({
    super.key,
    required this.title,
    this.trailing,
    this.onTap,
    this.addSubtitle = true,
    this.addSpacing = false,
  });
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool addSubtitle;
  final bool addSpacing;
  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return Column(
      spacing: PSizes.spaceBtwItems / 2,
      children: [
        Divider(
          thickness: 0.5,

          color:
              !isDark
                  ? PColors.dark.withValues(alpha: 0.5)
                  : PColors.light.withValues(alpha: 0.5),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.apply(fontWeightDelta: -1),
            ),
            Row(children: [if (trailing != null) trailing!]),
          ],
        ),
      ],
    );
  }
}
