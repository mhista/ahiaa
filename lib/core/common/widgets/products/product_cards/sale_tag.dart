import 'package:ahiaa/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../containers/rounded_container.dart';

class SaleTagWidget extends StatelessWidget {
  const SaleTagWidget({
    super.key,
    this.top,
    this.right,
    this.left,
    this.bottom,
    this.backgrondColor = Colors.black,
    this.tag = '',
  });
  final double? top, right, left, bottom;
  final Color backgrondColor;
  final String? tag;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: TRoundedContainer(
        radius: PSizes.sm,
        backgroundColor: backgrondColor.withValues(alpha: 0.8),
        padding: const EdgeInsets.symmetric(
          horizontal: PSizes.sm,
          vertical: PSizes.xs,
        ),
        child: Text(
          '- $tag%',
          style: Theme.of(
            context,
          ).textTheme.labelLarge!.apply(color: PColors.light),
        ),
      ),
    );
  }
}
