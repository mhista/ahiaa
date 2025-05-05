import 'package:ahiaa/utils/constants/enums.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/common/widgets/containers/rounded_container.dart';
import '../../../../../../core/common/widgets/images/edge_rounded_images.dart';
import '../../../../../../core/dependency/init_dependencies.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../home/presentation/cubit/palette/color_cubit.dart';
import '../../../../home/presentation/cubit/palette/palette_cubit.dart';

class ShopImage extends StatefulWidget {
  const ShopImage({super.key});

  @override
  State<ShopImage> createState() => _ShopImageState();
}

class _ShopImageState extends State<ShopImage> {
  @override
  void initState() {
    _initBgColor();
    super.initState();
  }

  void _initBgColor() async {
    await serviceLocator<PaletteCubit>().updatePalette(PImages.p1).then((v) {
      serviceLocator<ColorCubit>().updateColor(
        serviceLocator<PaletteCubit>().state.color,
      );
      serviceLocator<AppBarColorCubit>().updateColor(
        serviceLocator<PaletteCubit>().state.bodyTextColor,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      radius: 0,
      backgroundColor: PColors.transparent,
      height: 350,
      width: double.infinity,
      child: PRoundedImage(
        imageType: ImageType.asset,
        borderRadius: 0,
        image: PImages.p1,
        // contentPadding: 0,
      ),
    );
  }
}
