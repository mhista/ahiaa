import 'package:flutter/material.dart';

import 'package:ahiaa/core/common/widgets/appbar/searchBar.dart';
import 'package:ahiaa/core/common/widgets/containers/rounded_container.dart';
import 'package:ahiaa/core/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ahiaa/core/common/widgets/icons/circular_icon.dart';
import 'package:ahiaa/core/common/widgets/images/edge_rounded_images.dart';
import 'package:ahiaa/utils/constants/image_strings.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class SearchWidgetListTile extends StatelessWidget {
  const SearchWidgetListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: PSizes.spaceBtwItems / 2,

      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // IMAGE AND DESCRIPTION
            Row(
              spacing: PSizes.spaceBtwItems / 2,

              children: [
                PRoundedImage(
                  imageUrl: PImages.p1,
                  height: 45,
                  width: 40,
                  borderRadius: 10,
                  fit: BoxFit.fitWidth,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: PSizes.xs - 2,
                  children: [
                    Text(
                      'Tops and T-Shirts',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall!.apply(fontWeightDelta: -2),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      spacing: PSizes.xs,
                      children: [
                        TRoundedContainer(
                          height: 7,
                          width: 7,
                          backgroundColor: PColors.secondary,
                        ),
                        Text(
                          '99+ collection',
                          style: Theme.of(
                            context,
                          ).textTheme.labelSmall!.apply(fontWeightDelta: -1),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            PCircularIcon(
              icon: EvaIcons.diagonal_arrow_left_up,
              backgroundColor: PColors.transparent,
              color: PColors.dark2.withValues(alpha: 0.7),
              weight: 0.2,
            ),
          ],
        ),
        Divider(thickness: 0.3, color: PColors.accent.withValues(alpha: 0.3)),
      ],
    );
  }
}
