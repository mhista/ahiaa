import 'package:ahiaa/core/common/widgets/containers/rounded_container.dart';
import 'package:ahiaa/core/common/widgets/custom_shapes/curved_edges/curved_edge_container.dart';
import 'package:ahiaa/utils/constants/enums.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/common/buttons/clip_button.dart';
import '../../../../../../../core/common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../../../core/common/widgets/images/edge_rounded_images.dart';
import '../../../../../../../core/entities/product.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';

class ProductPageSlider extends StatelessWidget {
  const ProductPageSlider({
    super.key,
    this.carouselHeight = 150,
    required this.product,
  });

  final double carouselHeight;
  final Products product;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items:
              product.images
                  .map(
                    (banner) => TRoundedContainer(
                      // height: 140,
                      child: Stack(
                        children: [
                          PCurvedProductWidget(
                            child: PRoundedImage(
                              height: carouselHeight,
                              borderRadius: PSizes.md,
                              width: double.infinity,
                              image: banner,
                              imageType: ImageType.network,
                              isNetworkImage: true,
                              onPressed: () {},
                              fit: BoxFit.cover,
                            ),
                          ),
                          ClipButtonButton(index: 200, product: product),
                          Positioned(
                            bottom: 10,
                            right: 50,
                            left: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (int i = 0; i < product.images.length; i++)
                                  PCircularContainer(
                                    margin: const EdgeInsets.only(right: 7),
                                    width: 10,
                                    height: 10,
                                    backgroundColor:
                                        product.images.indexOf(banner) == i
                                            ? PColors.primary
                                            : PColors.grey,
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
          options: CarouselOptions(
            height: carouselHeight,
            autoPlay: true,
            viewportFraction: 1,
            onPageChanged: (index, _) {
              // bannerController.updateIndex(index);
            },
          ),
        ),
        const SizedBox(height: PSizes.spaceBtwItems),
      ],
    );
  }
}
