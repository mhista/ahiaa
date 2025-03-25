import 'package:flutter/material.dart';

import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/device/device_utility.dart';
import '../../../../../../../utils/helpers/helper_functions.dart';

class RatingProgressIndicator extends StatelessWidget {
  const RatingProgressIndicator({
    super.key,
    required this.text,
    required this.value,
  });
  final String text;
  final double value;
  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
        ),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: PDeviceUtils.getScreenWidth(context) * 0.5,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 8,
              backgroundColor: PColors.accent.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(7),
              valueColor: AlwaysStoppedAnimation(
                isDark ? PColors.primary : PColors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
