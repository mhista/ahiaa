import 'package:ahiaa/core/common/widgets/containers/rounded_container.dart';
import 'package:ahiaa/core/common/widgets/custom_shapes/curved_edges/curved_edge_container.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/buttons/clip_button.dart'
    show ClipButtonButton;
import '../../../../../../core/common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../../core/common/widgets/images/edge_rounded_images.dart';
import '../../../../../../core/dependency/init_dependencies.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../cubit/banners/banner_cubit.dart';
import '../../cubit/palette/color_cubit.dart';
import '../../cubit/palette/palette_cubit.dart';

class PageSlider extends StatelessWidget {
  const PageSlider({super.key, this.carouselHeight = 150});

  final double carouselHeight;
  @override
  Widget build(BuildContext context) {
    final bannerController = serviceLocator<BannerCubit>();
    final images = bannerController.images;
    return Column(
      children: [
        CarouselSlider(
          items:
              images
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
                              imageUrl: banner,
                              isNetworkImage: false,
                              onPressed: () {},
                              fit: BoxFit.cover,
                            ),
                          ),
                          ClipButtonButton(index: 200),
                          Positioned(
                            bottom: 10,
                            right: 50,
                            left: 50,
                            child: BlocBuilder<BannerCubit, int>(
                              builder: (context, state) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    for (
                                      int i = 0;
                                      i < bannerController.images.length;
                                      i++
                                    )
                                      PCircularContainer(
                                        margin: const EdgeInsets.only(right: 7),
                                        width: 10,
                                        height: 10,
                                        backgroundColor:
                                            state == i
                                                ? PColors.primary
                                                : PColors.grey,
                                      ),
                                  ],
                                );
                              },
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
              bannerController.updateIndex(index);
            },
          ),
        ),
        const SizedBox(height: PSizes.spaceBtwItems),
      ],
    );
  }
}
