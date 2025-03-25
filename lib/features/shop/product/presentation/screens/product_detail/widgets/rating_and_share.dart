import 'package:ahiaa/core/common/widgets/icons/favorite_icon.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../utils/constants/sizes.dart';

class RatingAndShare extends StatelessWidget {
  const RatingAndShare({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // SHARE BUTTON
        // Row(
        //   children: [
        //     FavoriteIcon(productId: '1'),
        //     IconButton(
        //       onPressed: () {},
        //       icon: const Icon(Icons.share, size: PSizes.iconMd),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
