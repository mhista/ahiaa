import 'package:ahiaa/utils/constants/image_strings.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/common/widgets/appbar/app_bar.dart';
import '../../../../../../../core/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../../../core/common/widgets/icons/favorite_icon.dart';
import '../../../../../../../core/common/widgets/images/edge_rounded_images.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../utils/helpers/helper_functions.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
    // required this.product,
  });
  // final ProductModel product;
  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(ImageController());
    // final images = controller.getAllProductImage(product);
    final isDark = PHelperFunctions.isDarkMode(context);
    return PCurvedEdgesWidget(
      child: Container(
        color: isDark ? PColors.darkerGrey : PColors.light,
        child: Stack(
          children: [
            // MAIN LARGE IMAGE
            SizedBox(
              height: 350,
              child: Padding(
                padding: const EdgeInsets.all(PSizes.productImageRadius * 2),
                child: Center(
                  child: //Obx(() {
                  // final image = controller.selectedProductImage.value;
                  GestureDetector(
                    onTap: () {},
                    // controller.showEnlargedImage(image),
                    child: CachedNetworkImage(
                      imageUrl: PImages.craft1,
                      progressIndicatorBuilder:
                          (_, __, progress) => CircularProgressIndicator(
                            value: progress.progress,
                            color: PColors.primary,
                          ),
                    ),
                  ),
                ),
              ),
            ),
            //  IMAGE SLIDER
            Positioned(
              right: 0,
              left: PSizes.spaceBtwSections,
              bottom: 30,
              child: SizedBox(
                height: 75,
                child: ListView.separated(
                  itemCount: 3,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder:
                      (_, index) =>
                      // final imageSelected =
                      //     controller.selectedProductImage.value == images[index];
                      PRoundedImage(
                        // isNetworkImage: true,
                        fit: BoxFit.cover,
                        padding: const EdgeInsets.all(PSizes.sm),
                        border: Border.all(
                          color:
                              //  imageSelected
                              //     ? PColors.primary
                              //     :
                              Colors.transparent,
                        ),
                        width: 75,
                        backgroundColor: isDark ? PColors.dark : PColors.white,
                        imageUrl: PImages.agro,
                        onPressed: () {},
                        // controller.selectedProductImage.value = images[index],
                      ),
                  separatorBuilder: (_, __) => const SizedBox(),
                ),
              ),
            ),
            // APPBAR ICONS
            PAppBar(
              showBackArrow: true,
              actions: [
                Flexible(
                  child: Stack(
                    children: [
                      // FavoriteIcon(top: 0, right: 30, productId: '1'),
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
          ],
        ),
      ),
    );
  }
}
