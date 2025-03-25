import 'package:flutter/material.dart';

class ProductTitleText extends StatelessWidget {
  const ProductTitleText({
    super.key,
    required this.title,
    this.smallSize = false,
    this.maxLines = 2,
    this.textAlign = TextAlign.left,
  });

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:
          smallSize
              ? Theme.of(context).textTheme.bodyLarge!.apply(fontSizeDelta: 2)
              : Theme.of(context).textTheme.headlineMedium!.apply(
                fontWeightDelta: -2,
                fontSizeDelta: -2,
              ),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
