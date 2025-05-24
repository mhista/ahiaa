import 'package:ahiaa/core/common/widgets/icons/circular_icon.dart';
import 'package:ahiaa/utils/constants/enums.dart';
import 'package:ahiaa/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

import '../../../../../features/shop/cart/data/models/cart_model.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../images/edge_rounded_images.dart';
import '../../texts/brand_text_title_with_icon.dart';
import '../../texts/product_title_text.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItem});
  final CartItemModel cartItem;
  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return Row(
      children: [
        // IMAGE
        PRoundedImage(
          isNetworkImage: true,
          imageType: ImageType.network,
          image: cartItem.image,
          width: 60,
          height: 60,
          padding: PSizes.md,
          backgroundColor: isDark ? PColors.darkerGrey : PColors.light,
        ),
        const SizedBox(width: PSizes.spaceBtwItems),

        // TITLE , PRICE, SIZE
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BrandTitleTextWithVerifiedIcon(
                title: cartItem.brandName ?? 'Nike',
              ), //cartItem.brandName ?? ''),
              Flexible(
                child: ProductTitleText(title: cartItem.title, maxLines: 1),
              ),
              // /ATTRIBUTES

              // Text.rich(
              //   TextSpan(
              //     children: (cartItem.selectedVariation ?? {})
              //         .entries
              //         .map(
              //           (e) => TextSpan(
              //             children: [
              //               TextSpan(
              //                 text: e.key,
              //                 style: Theme.of(context).textTheme.bodySmall,
              //               ),
              //               TextSpan(
              //                 text: e.value,
              //                 style: Theme.of(context).textTheme.bodyLarge,
              //               ),
              //             ],
              //           ),
              //         )
              //         .toList(),
              //   ),
              // ),
            ],
          ),
        ),
        Row(
          spacing: PSizes.sm,
          children: [
            PCircularIcon(
              icon: Icons.share,
              size: PSizes.md,
              width: 40,
              height: 40,
            ),
            PCircularIcon(
              icon: Icons.delete,
              size: PSizes.md,
              width: 40,
              height: 40,
              color: PColors.warning,
            ),
          ],
        ),
      ],
    );
  }
}
