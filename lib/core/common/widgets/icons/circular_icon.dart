import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class PCircularIcon extends StatelessWidget {
  // Custom circular icon with a backgrund

  // properties
  //Container [width, height and backgroundColor]
  // Icon [size, color and onPressed]
  const PCircularIcon({
    super.key,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.width,
    this.height,
    this.onPressed,
    this.size = PSizes.lg,
    this.animate = true,
    this.productId,
    this.weight,
  });

  final IconData icon;
  final Color? color, backgroundColor;

  final double? width, height, size, weight;
  final VoidCallback? onPressed;
  final bool animate;
  final String? productId;

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color:
            backgroundColor ??
            (isDark
                ? PColors.dark.withValues(alpha: 0.9)
                : PColors.accent.withValues(alpha: 0.1)),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: IconButton(
          onPressed: onPressed,
          padding: EdgeInsets.zero,
          alignment: Alignment.center,
          icon: Center(
            child: Icon(icon, color: color, size: size, weight: weight),
          ),
        ),
      ),
    );
  }
}
