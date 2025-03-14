import 'package:ahiaa/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:ahiaa/utils/constants/sizes.dart';

import '../../../../../utils/constants/colors.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius = PSizes.iconMd,
    this.backgroundColor,
    this.borderColor = PColors.borderPrimary,
    this.child,
    this.margin,
    this.padding,
    this.showBorder = false,
    this.gradient,
    this.shadow,
    this.elevation = 0,
    this.useContainerGradient = false,
    this.useGlass = false,
    this.intensity = 0,
    this.borderWidth = 1,
    this.gradientColor = PColors.primary,
  });
  final double? width, height;
  final double radius, borderWidth;
  final Color borderColor, gradientColor;
  final Color? backgroundColor;
  final Widget? child;
  final EdgeInsetsGeometry? margin, padding;
  final bool showBorder, useContainerGradient, useGlass;
  final Gradient? gradient;
  final List<BoxShadow>? shadow;
  final double elevation, intensity;

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return Material(
      type: MaterialType.canvas,
      borderRadius: BorderRadius.circular(radius),
      elevation: elevation,
      color: backgroundColor,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
            gradient: useContainerGradient
                ? gradient ??
                    LinearGradient(
                        begin: AlignmentDirectional.topCenter,
                        end: AlignmentDirectional.bottomCenter,
                        colors: [
                          gradientColor.withOpacity(0.8 + intensity),
                          gradientColor.withOpacity(0.6 + intensity),
                          gradientColor.withOpacity(0.2 + intensity),
                          isDark
                              ? PColors.black.withOpacity(0.3)
                              : PColors.white.withOpacity(0.3),
                          isDark
                              ? PColors.black.withOpacity(0.6)
                              : PColors.white.withOpacity(0.6),
                          isDark ? PColors.black : PColors.white
                        ])
                : null,
            borderRadius: BorderRadius.circular(radius),
            color: backgroundColor ?? (isDark ? PColors.black : PColors.white),
            border: showBorder
                ? Border.all(color: borderColor, width: borderWidth)
                : null,
            boxShadow: shadow),
        child: child,
      ),
    );
  }
}
