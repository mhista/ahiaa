import 'package:ahiaa/core/common/widgets/containers/rounded_container.dart';
import 'package:ahiaa/utils/constants/sizes.dart';
import 'package:ahiaa/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class PSectionHeading extends StatelessWidget {
  const PSectionHeading({
    super.key,
    this.textColor,
    this.showActionButton = true,
    required this.title,
    this.buttonTitle = 'View all',
    this.onPressed,
    this.spacing = 0,
  });
  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.only(top: spacing),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: PSizes.spaceBtwItems,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium!.apply(
              fontWeightDelta: -2,
              fontSizeDelta: -2,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (showActionButton)
            GestureDetector(
              onTap: onPressed,
              child: TRoundedContainer(
                backgroundColor:
                    isDark
                        ? PColors.dark
                        : PColors.accent.withValues(alpha: 0.1),
                radius: 100,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 18,
                    weight: 100,
                  ),
                ),
              ),
            ),
          // TextButton(
          //   onPressed: onPressed,
          //   child: Text(
          //     buttonTitle,
          //     style: TextTheme.of(context).bodyMedium!.apply(
          //       color: PColors.buttonPrimary.withValues(alpha: 0.8),
          //       fontWeightDelta: 2,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
