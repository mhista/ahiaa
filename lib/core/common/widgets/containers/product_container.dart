import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../icons/favorite_icon.dart';
import '../images/edge_rounded_images.dart';
import '../layouts/gid_layout.dart';
import '../products/product_cards/product_card.dart';
import 'rounded_container.dart';

class HomeProductContainer extends StatelessWidget {
  const HomeProductContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridLayout(
        vAxisSpacing: 8,
        hAxisSpacing: 0,
        mainAxisExtent: 170,
        itemCount: 4,
        itemBuilder: (context, index) {
          return ProductContainer();
        });
  }
}
