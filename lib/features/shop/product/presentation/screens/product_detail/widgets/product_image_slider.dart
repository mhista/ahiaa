import 'package:ahiaa/core/common/widgets/images/circular_images.dart';
import 'package:ahiaa/features/shop/home/presentation/screens/widgets/page_slider.dart';
import 'package:ahiaa/utils/constants/image_strings.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/common/widgets/appbar/app_bar.dart';
import '../../../../../../../core/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../../../core/common/widgets/icons/favorite_icon.dart';
import '../../../../../../../core/common/widgets/images/edge_rounded_images.dart';
import '../../../../../../../core/entities/product.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../utils/helpers/helper_functions.dart';
import 'product_banner.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({super.key, required this.product});
  final Products product;
  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(ImageController());
    // final images = controller.getAllProductImage(product);
    final isDark = PHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ProductPageSlider(carouselHeight: 200, product: product),
        ),
        SizedBox(
          height: 60,
          child: ListView.separated(
            padding: EdgeInsets.only(left: PSizes.spaceBtwItems),
            itemCount: product.images.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder:
                (_, index) =>
                // final imageSelected =
                //     controller.selectedProductImage.value == images[index];
                GestureDetector(
                  onTap: () {},
                  child: PCircularImage(
                    isNetworkImage: true,
                    fit: BoxFit.cover,
                    height: 60,
                    width: 60,
                    backgroundColor: isDark ? PColors.dark : PColors.white,
                    imageUrl: product.images[index],
                    // controller.selectedProductImage.value = images[index],
                  ),
                ),
            separatorBuilder: (_, __) => const SizedBox(width: 2),
          ),
        ),

        // APPBAR ICONS
        SizedBox(height: PSizes.spaceBtwItems),
      ],
    );
  }
}
