import 'package:ahiaa/core/common/widgets/containers/rounded_container.dart';
import 'package:ahiaa/features/shop/product/presentation/screens/product_detail/widgets/bottom_add_to_cart.dart';
import 'package:ahiaa/features/shop/product/presentation/screens/product_detail/widgets/product_meta_data.dart'
    show ProductMetaData;
import 'package:ahiaa/features/shop/product/presentation/screens/product_detail/widgets/rating_and_share.dart';
import 'package:ahiaa/utils/constants/colors.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:ahiaa/utils/constants/sizes.dart';

import '../../../../../../core/common/widgets/appbar/app_bar.dart';
import '../../../../../../core/common/widgets/icons/favorite_icon.dart';
import '../../../../../../core/common/widgets/layouts/staggered_layout.dart';
import '../../../../../../core/common/widgets/texts/read_more_text.dart';
import '../../../../../../core/common/widgets/texts/section_heading.dart';
import '../../../../../../core/dependencies/init_dependencies.dart';
import '../../../../../../core/entities/product.dart';
import '../../../../../../core/routes/route_names.dart';
import '../../../services/product_services.dart';
import '../product_review/widgets/product_detail_review_card.dart'
    show ProductDetailReviewCard;
import 'widgets/product_attributes.dart';
import 'widgets/product_image_slider.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});
  final Products product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PAppBar(
        showBackArrow: true,
        actions: [
          Flexible(
            child: Stack(
              children: [
                FavoriteIcon(
                  top: 0,
                  right: 40,
                  productId: '1',
                  backgrondColor: PColors.transparent,
                  useOutline: true,
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_horiz_outlined,
                      size: PSizes.iconMd,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // PRODUCT IMAGE SLIDER
            ProductImageSlider(product: product),

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
                  ProductMetaData(product: product),
                  const SizedBox(height: PSizes.spaceBtwSections),

                  // DESCRIPTION
                  const PSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(height: PSizes.spaceBtwItems),
                  PReadMoreText(text: product.description),
                  // REVIEWS
                  // ATTRIBUTES
                  // if (product.productType == ProductType.variable.name)
                  ProductAttributes(product: product),
                  // if (product.productType == ProductType.variable.name)
                  const SizedBox(height: PSizes.spaceBtwSections),
                  // CHECKOUT BUTTON
                  SizedBox(
                    // height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: PColors.primary,
                      ),
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
                      StaggeredProductLayout(
                        itemCount:
                            serviceLocator<ProductServices>()
                                .brandProducts
                                .length,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAddToCart(product: product),
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
        backgroundColor: PColors.accent.withValues(alpha: 0.1),
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
