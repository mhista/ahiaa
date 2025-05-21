import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../shimmer.dart';

class CategoryTileShimmer extends StatelessWidget {
  const CategoryTileShimmer({super.key, this.itemCount = 6});
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (_, __) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: const Stack(
            children: [
              // IMAGE
              PShimmerEffect(height: 70, width: double.infinity),
              Positioned(
                top: 10,
                left: 10,
                child: PShimmerEffect(height: 20, width: 130),
              ),
              Positioned(
                top: 40,
                left: 10,
                child: PShimmerEffect(height: 15, width: 80),
              ),
              Positioned(
                top: 20,
                right: 10,
                child: PShimmerEffect(height: 20, width: 20),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemCount: itemCount,
      shrinkWrap: true,
    );
  }
}
