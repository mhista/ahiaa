import 'package:ahiaa/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../containers/rounded_container.dart';
import '../images/edge_rounded_images.dart';

class BrandInfoWidget extends StatelessWidget {
  const BrandInfoWidget({
    super.key,
    required this.onBrandImageTapped,
    required this.onFollowTapped,
    this.usesBrandImage = true,
    this.appBarScrolled = false,
    this.storeColor,
    this.removeBgImage = false,
  });

  final VoidCallback onBrandImageTapped, onFollowTapped;
  final bool usesBrandImage, appBarScrolled, removeBgImage;
  final Color? storeColor;

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      backgroundColor:
          appBarScrolled
              ? isDark
                  ? PColors.black
                  : PColors.white
              : PColors.transparent,
      radius: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // BRAND IMAGE
              if (appBarScrolled)
                GestureDetector(
                  onTap: onBrandImageTapped,
                  child: TRoundedContainer(
                    // elevation: 2,
                    width: 60,
                    height: 50,
                    child: PRoundedImage(
                      backgroundColor: PColors.transparent,
                      imageUrl: PImages.p1,
                      contentPadding: 0,
                      // fit: BoxFit.cover,
                    ),
                  ),
                ),
              // BRAND IMAGE
              if (usesBrandImage && !removeBgImage)
                GestureDetector(
                  onTap: onBrandImageTapped,
                  child: TRoundedContainer(
                    // elevation: 2,
                    width: 70,
                    height: 60,
                    child: PRoundedImage(
                      contentPadding: 0,
                      backgroundColor: storeColor ?? PColors.transparent,

                      imageUrl: PImages.p1,
                      // fit: BoxFit.cover,
                    ),
                  ),
                ),
              SizedBox(width: PSizes.xs),
              // BRAND NAME AND RATING
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: GestureDetector(
                      onTap: onBrandImageTapped,
                      child: Text(
                        'Agro Market',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium!.apply(color: storeColor),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '4.3',
                        style: Theme.of(context).textTheme.labelSmall!.apply(
                          fontWeightDelta: 2,
                          color: storeColor,
                        ),
                      ),
                      Icon(Iconsax.star1, size: 13, color: storeColor),
                      Text(
                        ' (300k)',
                        style: Theme.of(context).textTheme.labelSmall!.apply(
                          fontWeightDelta: 2,
                          color: storeColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(width: PSizes.spaceBtwItems),
          Row(
            children: [
              GestureDetector(
                onTap: onFollowTapped,
                child: TRoundedContainer(
                  radius: 5,
                  padding: EdgeInsets.symmetric(
                    vertical: PSizes.xs,
                    horizontal: PSizes.md,
                  ),
                  backgroundColor:
                      removeBgImage
                          ? PColors.transparent.withOpacity(0.4)
                          : usesBrandImage
                          ? isDark
                              ? PColors.dark
                              : PColors.light
                          : PColors.transparent.withOpacity(0.1),
                  child: Text(
                    'Follow',
                    style: Theme.of(context).textTheme.labelSmall!.apply(
                      fontWeightDelta: 2,
                      fontSizeDelta: 3,
                      color: storeColor,
                    ),
                  ),
                ),
              ),
              SizedBox(width: PSizes.sm),
              if (!usesBrandImage || appBarScrolled || removeBgImage)
                GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.search, size: 27, color: storeColor),
                ),
              SizedBox(width: PSizes.sm),
              GestureDetector(
                onTap: () {},
                child: Icon(Icons.more_horiz, size: 27, color: storeColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
