import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class ProductPriceText extends StatelessWidget {
  const ProductPriceText({
    super.key,
    required this.price,
    this.isLarge = false,
    this.lineThrough = false,
    this.currencySign = '\$',
    this.maxLines = 1,
  });
  final bool isLarge, lineThrough;
  final String currencySign, price;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style:
          isLarge
              ? Theme.of(context).textTheme.headlineMedium!.apply(
                decoration: lineThrough ? TextDecoration.lineThrough : null,
                color: PColors.accent.withValues(alpha: 0.7),
              )
              : Theme.of(context).textTheme.headlineSmall!.apply(
                decoration: lineThrough ? TextDecoration.lineThrough : null,
              ),
    );
  }
}
