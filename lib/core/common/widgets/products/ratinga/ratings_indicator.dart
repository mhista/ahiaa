import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class PRatingBarIndicator extends StatelessWidget {
  const PRatingBarIndicator({super.key, required this.rating});
  final double rating;
  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return RatingBarIndicator(
      rating: rating,
      itemSize: 18,
      unratedColor: PColors.accent.withValues(
        alpha: 0.4,
      ), //isDark ? PColors.grey : PColors.primary,
      itemBuilder:
          (_, __) => Icon(
            Iconsax.star1,
            color: PColors.primary, //isDark ? PColors.primary : PColors.black,
          ),
    );
  }
}
