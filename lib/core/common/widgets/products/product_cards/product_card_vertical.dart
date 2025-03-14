import 'package:ahiaa/utils/constants/enums.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'package:ahiaa/utils/constants/colors.dart';
import 'package:ahiaa/utils/constants/sizes.dart';
import 'package:ahiaa/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/image_strings.dart' show PImages;
import '../../../../routes/route_names.dart';
import '../../containers/rounded_container.dart';
import '../../icons/favorite_icon.dart' show FavoriteIcon;
import '../../images/edge_rounded_images.dart';
import '../../texts/brand_text_title_with_icon.dart';
import '../../texts/product_title_text.dart';
import '../product_pricing_row.dart';
import 'sale_tag.dart';

class PProductCardVertical extends StatelessWidget {
  const PProductCardVertical({super.key});
  // final ProductModel product;

  @override
  Widget build(BuildContext context) {
    // final controller = ProductController.instance;
    // final salePercentage =
    //     controller.calculateSalePercentage(product.price, product.salePrice);
    final isDark = PHelperFunctions.isDarkMode(context);
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
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          // boxShadow: [PShadowStyle.verticalProductShadow],
          // borderRadius: BorderRadius.circular(PSizes.productImageRadius),
          color: isDark ? PColors.darkerGrey : PColors.white,
        ),
        child: Column(
          //Thumbnail. wishlist button, discount tag
          children: [
            TRoundedContainer(
              height: 160,
              width: 175,
              padding: const EdgeInsets.all(1),
              backgroundColor: isDark ? PColors.black : PColors.white,
              child: Stack(
                children: [
                  // THUMBNAIL IMAGE
                  Center(
                    child: PRoundedImage(
                      borderRadius: PSizes.md,
                      height: 150,
                      width: 180,
                      backgroundColor: isDark ? PColors.black : PColors.white,
                      contentPadding: 0,
                      fit: BoxFit.cover,
                      isNetworkImage: false,
                      imageUrl: PImages.craft2,
                      // applyImageRadius: true,
                    ),
                  ),
                  // if (salePercentage != null)
                  SaleTagWidget(tag: '20', top: 10, left: 5),
                  FavoriteIcon(
                    size: 20,
                    width: 35,
                    height: 35,
                    right: 15,
                    bottom: 10,
                    color: PColors.white,
                    weight: 20,
                    backgrondColor: PColors.dark.withValues(alpha: 0.8),
                    productId: '1',
                  ),
                ],
              ),
            ),
            const SizedBox(height: PSizes.spaceBtwItems / 2),
            // Details of product
            Padding(
              padding: const EdgeInsets.only(left: PSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(title: 'item Name', smallSize: true),
                  const SizedBox(height: PSizes.xs),
                  BrandTitleTextWithVerifiedIcon(
                    title: 'Nike',
                    brandTextSize: null,
                  ),
                ],
              ),
            ),
            PricingRow(),
          ],
        ),
      ),
    );
  }
}
