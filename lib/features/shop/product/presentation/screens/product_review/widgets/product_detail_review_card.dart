import 'package:flutter/material.dart';

import '../../../../../../../core/common/widgets/containers/rounded_container.dart';
import '../../../../../../../core/common/widgets/products/ratinga/ratings_indicator.dart';
import '../../../../../../../core/common/widgets/texts/read_more_text.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../utils/helpers/helper_functions.dart';
import 'overall_progress_rating.dart';

class ProductDetailReviewCard extends StatelessWidget {
  const ProductDetailReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: PSizes.sm,
      children: [
        const OverallProductRating(),
        const PRatingBarIndicator(rating: 3.5),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text('11,300', style: Theme.of(context).textTheme.bodySmall),
        ),
        TRoundedContainer(
          backgroundColor: PColors.accent.withValues(alpha: 0.1),
          child: Padding(
            padding: const EdgeInsets.all(PSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'John Deo',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '02 Nov, 2024',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: PSizes.spaceBtwItems),
                const PReadMoreText(
                  text:
                      'lorem lipsum dolore sicyut uiwh  uihdidcuihdc uihwidkncidc uidhidcnuic uihdneui uiedheuide uiieudejkkdnie eined euidbe ceh ecuincuic  uice cuecbie uuci  ciu ecue euc euc wecuy dcc   wuybeyuee ',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
