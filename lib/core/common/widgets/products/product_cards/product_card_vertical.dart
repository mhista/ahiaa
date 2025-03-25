import 'package:ahiaa/core/common/widgets/icons/circular_icon.dart';
import 'package:ahiaa/utils/constants/enums.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'package:ahiaa/utils/constants/colors.dart';
import 'package:ahiaa/utils/constants/sizes.dart';
import 'package:ahiaa/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/image_strings.dart' show PImages;
import '../../../../routes/route_names.dart';
import '../../../buttons/clip_button.dart';
import '../../containers/rounded_container.dart';
import '../../custom_shapes/curved_edges/curved_edge_container.dart';
import '../../icons/favorite_icon.dart' show FavoriteIcon;
import '../../images/edge_rounded_images.dart';
import '../../texts/brand_text_title_with_icon.dart';
import '../../texts/product_title_text.dart';
import '../product_pricing_row.dart';

class PProductCardVertical extends StatelessWidget {
  const PProductCardVertical({super.key, required this.index});
  // final ProductModel product;
  final int index;

  @override
  Widget build(BuildContext context) {
    // final controller = ProductController.instance;
    // final salePercentage =
    //     controller.calculateSalePercentage(product.price, product.salePrice);
    final isDark = PHelperFunctions.isDarkMode(context);
    final isShort = (index % 4 == 1) || (index % 4 == 3);
    final images = [PImages.p1, PImages.p2, PImages.p3, PImages.p4];
    final name = ['Bag', 'After Shave', 'Perfume', 'Headset'];
    // card with side paddings, edges, radius and shadow
    return GestureDetector(
      onTap: () {
        Beamer.of(context).beamToNamed(RouteNames.productDetail);
        debugPrint(Beamer.of(context).currentPages.first.name.toString());
        debugPrint(Beamer.of(context).currentBeamLocation.toString());

        debugPrint(Beamer.of(context).currentConfiguration?.uri.toString());
      },
      // => Get.to(() => ProductDetailScreen(
      //       product: product,
      //     )),
      child: Column(
        //Thumbnail. wishlist button, discount tag
        children: [
          TRoundedContainer(
            height: isShort ? 120 : 220,
            width: 180,
            padding: const EdgeInsets.all(1),
            backgroundColor: isDark ? PColors.black : PColors.white,
            child: Stack(
              children: [
                // THUMBNAIL IMAGE
                Center(
                  child: Stack(
                    children: [
                      PCurvedProductWidget(
                        child: PRoundedImage(
                          borderRadius: PSizes.md,
                          height: 190,
                          width: 190,
                          backgroundColor:
                              isDark ? PColors.black : PColors.white,
                          contentPadding: 0,
                          fit: BoxFit.cover,
                          isNetworkImage: false,
                          imageUrl: images[index],
                          // applyImageRadius: true,
                        ),
                      ),
                      Positioned(
                        right: 15,
                        top: 10,
                        child: PCircularIcon(
                          size: 18,
                          width: 33,
                          height: 33,
                          icon: Icons.shopping_cart_outlined,
                          color: PColors.black,
                          weight: 20,
                          backgroundColor: PColors.white,
                          productId: '1',
                        ),
                      ),

                      // Positioned(
                      //   right: 0,
                      //   bottom: 0,
                      //   child: TRoundedContainer(height: 20, width: 20),
                      // ),
                      ClipButtonButton(index: index),
                    ],
                  ),
                ),

                // if (salePercentage != null)
                // SaleTagWidget(tag: '20', top: 10, left: 5),
              ],
            ),
          ),
          if (isShort) const SizedBox(height: PSizes.spaceBtwItems / 2),
          // Details of product
          Padding(
            padding: const EdgeInsets.only(left: PSizes.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductTitleText(title: name[index], smallSize: false),
                const SizedBox(height: PSizes.xs),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: BrandTitleTextWithVerifiedIcon(
                        title: 'Nike',
                        brandTextSize: TextSizes.medium,
                      ),
                    ),
                    Row(
                      spacing: PSizes.xs,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: const Icon(
                            Iconsax.star5,
                            color: Colors.amber,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          // PricingRow(),
        ],
      ),
    );
  }
}
