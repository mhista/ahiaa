import 'package:ahiaa/features/shop/cart/business_logic/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../icons/circular_icon.dart';

class ProductAddAndRemove extends StatelessWidget {
  const ProductAddAndRemove({
    super.key,
    required this.width,
    required this.height,
    this.size,
    this.spaceBetween = PSizes.spaceBtwItems,
    required this.addColor,
    required this.addBgColor,
    required this.minusColor,
    required this.minusBgColor,
    required this.addOnPressed,
    required this.minusOnPressed,
    required this.valueWidget,
  });
  final double width, height;
  final double? size, spaceBetween;
  final Color addColor, addBgColor;
  final Color minusColor, minusBgColor;
  final VoidCallback? addOnPressed;
  final VoidCallback? minusOnPressed;
  final Widget valueWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        PCircularIcon(
          icon: Iconsax.minus,
          height: height,
          width: width,
          size: PSizes.md,
          color: minusColor,
          backgroundColor: minusBgColor,
          onPressed: minusOnPressed,
        ),
        SizedBox(width: spaceBetween),
        valueWidget,
        SizedBox(width: spaceBetween),
        PCircularIcon(
          icon: Iconsax.add,
          height: height,
          width: width,
          size: PSizes.md,
          color: addColor,
          backgroundColor: addBgColor,
          onPressed: addOnPressed,
        ),
      ],
    );
  }
}
