import 'package:flutter/material.dart';

import 'package:ahiaa/utils/constants/enums.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../core/common/widgets/containers/rounded_container.dart';
import '../../../../../../../core/common/widgets/images/circular_images.dart';
import '../../../../../../../core/common/widgets/texts/brand_text_title_with_icon.dart';
import '../../../../../../../core/common/widgets/texts/product_price_text.dart';
import '../../../../../../../core/common/widgets/texts/product_title_text.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../utils/helpers/helper_functions.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});
  // final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    // final controller = ProductController.instance;
    // final salesPercentage =
    //     controller.calculateSalePercentage(product.price, product.salePrice);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: PSizes.spaceBtwItems / 1.5,
      children: [
        // TITLE
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProductTitleText(title: 'Prod'),
            Row(
              // RATING
              children: [
                const Icon(Iconsax.star5, color: Colors.amber, size: 24),
                const SizedBox(width: PSizes.spaceBtwItems / 2),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '5.0 ',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const TextSpan(text: '(199)'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        // PRICE AND SALE PRICE
        Row(
          spacing: PSizes.spaceBtwItems / 2,
          children: [
            TRoundedContainer(
              radius: PSizes.sm,
              backgroundColor: PColors.secondary.withValues(alpha: 0.8),
              padding: const EdgeInsets.symmetric(
                horizontal: PSizes.sm,
                vertical: PSizes.xs,
              ),
              child: Text(
                '- 10%',
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.apply(color: PColors.light),
              ),
            ),
            // PRICE
            // if (product.productType == ProductType.single.name &&
            //     product.salePrice! > 0)
            Text(
              '\$${200}',
              style: Theme.of(context).textTheme.headlineSmall!.apply(
                decoration: TextDecoration.lineThrough,
                fontWeightDelta: -2,
              ),
            ),
            // if (product.productType == ProductType.single.name &&
            //     product.salePrice! > 0)
            ProductPriceText(price: '100', isLarge: true),
          ],
        ),

        // STOCK STATUS
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            // const ProductTitleText(title: 'Status:'),
            // const SizedBox(width: PSizes.spaceBtwItems / 1.5),
            PCircularImage(
              isNetworkImage: true,
              imageUrl: 'Nike',
              // product.brand != null ? product.brand!.image : '',
              width: 32,
              height: 32,
              overLayColor: isDark ? PColors.white : PColors.dark,
            ),
            Flexible(
              child: BrandTitleTextWithVerifiedIcon(
                title: 'Nike',
                //  product.brand != null ? product.brand!.name : '',
                brandTextSize: TextSizes.medium,
              ),
            ),

            Text(
              // controller.getStockStatus(product.stock),
              'In Stock',
              style: Theme.of(context).textTheme.titleMedium!,
            ),
          ],
        ),
      ],
    );
  }
}
