import 'package:ahiaa/core/common/widgets/containers/rounded_container.dart';
import 'package:ahiaa/core/common/widgets/images/circular_images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../shimmer/shimmer.dart';

class PVerticalImageText extends StatelessWidget {
  const PVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor,
    this.backgroundColor,
    this.onTap,
    this.isNetworkImage = true,
    this.fit = BoxFit.fitWidth,
    this.overlayColor,
  });
  final BoxFit? fit;
  final String image, title;
  final Color? textColor;
  final Color? backgroundColor, overlayColor;
  final bool isNetworkImage;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: PSizes.spaceBtwItems / 2),
        child: Column(
          children: [
            TRoundedContainer(
              width: 60,
              height: 60,

              // padding: const EdgeInsets.all(PSizes.sm),
              // radius: 100,
              child: Center(
                child: PCircularImage(
                  imageUrl: image,
                  fit: fit,
                  isNetworkImage: isNetworkImage,
                ),
              ),
            ),
            const SizedBox(height: PSizes.spaceBtwItems / 2),
            SizedBox(
              width: 49,
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.labelMedium!.apply(
                    color: textColor,
                    fontSizeDelta: 0.5,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
