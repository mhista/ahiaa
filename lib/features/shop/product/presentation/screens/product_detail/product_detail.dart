import 'package:ahiaa/core/common/widgets/containers/rounded_container.dart';
import 'package:ahiaa/features/shop/product/presentation/screens/product_detail/widgets/bottom_add_to_cart.dart';
import 'package:ahiaa/features/shop/product/presentation/screens/product_detail/widgets/product_meta_data.dart'
    show ProductMetaData;
import 'package:ahiaa/features/shop/product/presentation/screens/product_detail/widgets/rating_and_share.dart';
import 'package:ahiaa/utils/constants/colors.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:ahiaa/utils/constants/enums.dart';
import 'package:ahiaa/utils/constants/sizes.dart';

import '../../../../../../core/common/widgets/layouts/gid_layout.dart'
    show GridLayout;
import '../../../../../../core/common/widgets/products/product_cards/product_card_vertical.dart'
    show PProductCardVertical;
import '../../../../../../core/common/widgets/texts/read_more_text.dart';
import '../../../../../../core/common/widgets/texts/section_heading.dart';
import '../../../../../../core/routes/route_names.dart';
import '../../../data/models/product_model.dart';
import '../product_review/widgets/product_detail_review_card.dart'
    show ProductDetailReviewCard;
import 'widgets/product_attributes.dart';
import 'widgets/product_image_slider.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});
  // final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // PRODUCT IMAGE SLIDER
            ProductImageSlider(),

            // PRODUCT DETAILS
            Padding(
              padding: const EdgeInsets.only(
                right: PSizes.spaceBtwSections,
                left: PSizes.spaceBtwSections,
                bottom: PSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  // RATING AND SHAER BUTTON
                  const RatingAndShare(),

                  // PRICE , TITLE, STOCK, BRAND
                  ProductMetaData(),
                  const SizedBox(height: PSizes.spaceBtwSections),

                  // DESCRIPTION
                  const PSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(height: PSizes.spaceBtwItems),
                  Center(
                    child: PReadMoreText(
                      text:
                          'Lorem ipsum dolor sit amet,  adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                    ),
                  ),
                  // REVIEWS
                  // ATTRIBUTES
                  // if (product.productType == ProductType.variable.name)
                  ProductAttributes(),
                  // if (product.productType == ProductType.variable.name)
                  const SizedBox(height: PSizes.spaceBtwSections),
                  // CHECKOUT BUTTON
                  SizedBox(
                    // height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () {},
                      child: const Text('Checkout'),
                    ),
                  ),
                  const SizedBox(height: PSizes.spaceBtwSections),

                  const Divider(),
                  const SizedBox(height: PSizes.spaceBtwSections),
                  RefundShippingPolicy(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const PSectionHeading(
                        title: 'Reviews (123)',
                        showActionButton: false,
                      ),
                      IconButton(
                        onPressed: () {
                          Beamer.of(
                            context,
                          ).beamToNamed(RouteNames.productReviews);
                          debugPrint(
                            Beamer.of(
                              context,
                            ).currentPages.first.name.toString(),
                          );
                          debugPrint(
                            Beamer.of(context).currentBeamLocation.toString(),
                          );

                          debugPrint(
                            Beamer.of(
                              context,
                            ).currentConfiguration?.uri.toString(),
                          );
                        },
                        // =>
                        icon: const Icon(Iconsax.arrow_right_3, size: 18),
                      ),
                    ],
                  ),
                  ProductDetailReviewCard(),
                  const SizedBox(height: PSizes.spaceBtwSections),

                  Column(
                    spacing: PSizes.spaceBtwSections,
                    children: [
                      PSectionHeading(title: "More from John's store"),
                      GridLayout(
                        itemCount: 4,

                        // mainAxisExtent: 270,
                        itemBuilder: (_, index) => PProductCardVertical(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAddToCart(
        // product: product,
      ),
    );
  }
}

class RefundShippingPolicy extends StatelessWidget {
  const RefundShippingPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: PSizes.spaceBtwItems,
      children: [
        Row(
          spacing: PSizes.spaceBtwItems,

          children: [
            Expanded(
              child: RefundShippingPolicyContainer(
                title: 'Refund Policy',
                onPressed: () {},
              ),
            ),
            Expanded(
              child: RefundShippingPolicyContainer(
                title: 'Shipping Policy',
                onPressed: () {},
              ),
            ),
          ],
        ),
        RefundShippingPolicyContainer(title: 'Visit Store', onPressed: () {}),
      ],
    );
  }
}

class RefundShippingPolicyContainer extends StatelessWidget {
  const RefundShippingPolicyContainer({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: TRoundedContainer(
        borderWidth: 0.1,
        // showBorder: true,
        radius: 12,
        backgroundColor: PColors.light,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(fontSizeDelta: -1),
          ),
        ),
      ),
    );
  }
}
