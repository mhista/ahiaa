import 'package:ahiaa/features/shop/product/presentation/screens/product_detail/widgets/rating_and_share.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../texts/product_price_text.dart';
import 'product_cards/add_to_cart_container.dart';

class PricingRow extends StatelessWidget {
  const PricingRow({
    super.key,
    // required this.product,
    // required this.controller,
    this.isRow = false,
  });

  // final ProductModel product;
  // final ProductController controller;
  final bool isRow;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // PRICE
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                !isRow
                    ? [
                      // if (product.productType == ProductType.single.name &&
                      //     product.salePrice! > 0)
                      // Padding(
                      //   padding: const EdgeInsets.only(left: PSizes.sm),
                      //   child: Text(
                      //     '200',
                      //     style: Theme.of(context).textTheme.labelMedium!.apply(
                      //       decoration: TextDecoration.lineThrough,
                      //     ),
                      //   ),
                      // ),
                      // PRICE, SHOW SALE PRICE AS MAIN PRICE IF SALE EXIST
                      Padding(
                        padding: const EdgeInsets.only(left: PSizes.sm),
                        child: ProductPriceText(
                          price: '200',
                          // controller.getProductPrice(product),
                        ),
                      ),
                    ]
                    : [
                      ProductPriceText(
                        price: '100',
                        // controller.getProductPrice(product),
                      ),
                    ],
          ),
        ),
        // ADD TO CAT BUTTON
        // AddToCartContainer(
        //   // product: product,
        // ),
        Row(
          spacing: PSizes.xs,
          children: [
            const Icon(Iconsax.star5, color: Colors.amber, size: 22),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '5.0 ',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
