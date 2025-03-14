import 'package:flutter/material.dart';
import 'package:ahiaa/utils/constants/colors.dart';

class PShadowStyle {
  static final verticalProductShadow = BoxShadow(
    color: PColors.darkerGrey.withValues(alpha: 0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

  static final horizontalProductShadow = BoxShadow(
    color: PColors.darkerGrey.withValues(alpha: 0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}
