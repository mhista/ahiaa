import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import 'circular_icon.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({
    super.key,
    this.top,
    this.right,
    this.left,
    this.bottom,
    this.backgrondColor,
    required this.productId,
    this.width,
    this.height,
    this.size,
    this.color,
    this.weight,
    this.useOutline = false
  });
  final double? top, right, left, bottom, width, height, size, weight;
  final Color? backgrondColor, color;
  final String productId;
  final bool useOutline;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: PCircularIcon(
        backgroundColor: backgrondColor,
        width: width,
        height: height,
        size: size,
        color: color,
        onPressed: () {},
        icon: useOutline? Iconsax.heart:Iconsax.heart5,
        weight: weight,
      ),
    );
  }
}
