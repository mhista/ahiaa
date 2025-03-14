import 'package:flutter/material.dart';

import 'package:ahiaa/utils/constants/colors.dart';
import 'package:ahiaa/utils/constants/image_strings.dart';
import 'package:ahiaa/utils/constants/sizes.dart';
import 'package:ahiaa/utils/helpers/helper_functions.dart';

import '../../../../../../../core/common/widgets/containers/rounded_container.dart';
import '../../../../../../../core/common/widgets/products/ratinga/ratings_indicator.dart';
import '../../../../../../../core/common/widgets/texts/read_more_text.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(PImages.appLogo),
                ),
                const SizedBox(width: PSizes.spaceBtwItems),
                Text('John Deo', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        // REVIEW
        Row(
          children: [
            const PRatingBarIndicator(rating: 4),
            const SizedBox(width: PSizes.spaceBtwItems),
            Text('01 Nov, 2023', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: PSizes.spaceBtwItems),
        const PReadMoreText(
          text:
              'lorem lipsum dolore sicyut uiwh  uihdidcuihdc uihwidkncidc uidhidcnuic uihdneui uiedheuide uiieudejkkdnie eined euidbe ceh ecuincuic  uice cuecbie uuci  ciu ecue euc euc wecuy dcc   wuybeyuee ',
        ),
        const SizedBox(height: PSizes.spaceBtwItems),

        // COMPANY REVIEW
        TRoundedContainer(
          backgroundColor: isDark ? PColors.darkerGrey : PColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(PSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'PickAfrika',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '02 Nov, 2023',
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
        const SizedBox(height: PSizes.spaceBtwSections),
      ],
    );
  }
}
