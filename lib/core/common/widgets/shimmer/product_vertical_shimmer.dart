import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';
import '../layouts/gid_layout.dart';
import 'shimmer.dart';

class VerticalProductShimmer extends StatelessWidget {
  const VerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridLayout(
        itemCount: itemCount,
        itemBuilder: (_, __) => const SizedBox(
              width: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // IMAGE
                  PShimmerEffect(height: 180, width: 180),
                  SizedBox(
                    height: PSizes.spaceBtwItems,
                  ),
                  // TEXT
                  PShimmerEffect(width: 110, height: 15),
                  SizedBox(
                    height: PSizes.spaceBtwItems / 2,
                  ),
                  PShimmerEffect(width: 180, height: 15),
                ],
              ),
            ));
  }
}
