import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/common/widgets/images/edge_rounded_images.dart';
import '../../../../../../core/dependency/init_dependencies.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../cubit/banners/banner_cubit.dart';
import '../../cubit/palette/color_cubit.dart';
import '../../cubit/palette/palette_cubit.dart';

class PageSlider extends StatelessWidget {
  PageSlider({
    super.key,
  });

  final images = [PImages.agro, PImages.craft2, PImages.craft1];

  @override
  Widget build(BuildContext context) {
    final bannerController = serviceLocator<BannerCubit>();

    return Column(children: [
      CarouselSlider(
        items: images
            .map(
              (banner) => SizedBox(
                child: PRoundedImage(
                  width: double.infinity,
                  imageUrl: banner,
                  isNetworkImage: false,
                  onPressed: () {},
                  fit: BoxFit.cover,
                ),
              ),
            )
            .toList(),
        options: CarouselOptions(
          height: 140,
          autoPlay: true,
          viewportFraction: 0.8,
          onPageChanged: (index, _) async {
            await serviceLocator<PaletteCubit>()
                .updatePalette(images[index])
                .then((v) {
              bannerController.updateIndex(index);
              serviceLocator<ColorCubit>()
                  .updateColor(serviceLocator<PaletteCubit>().state.color);
            });
          },
        ),
      ),
      const SizedBox(
        height: PSizes.spaceBtwItems,
      ),
      // BlocBuilder<BannerCubit, int>(
      //   builder: (context, state) {
      //     return Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         for (int i = 0; i < images.length; i++)
      //           PCircularContainer(
      //             margin: const EdgeInsets.only(right: 10),
      //             width: 20,
      //             height: 4,
      //             backgroundColor: state == i ? PColors.primary : PColors.grey,
      //           ),
      //       ],
      //     );
      //   },
      // ),
    ]);
  }
}
