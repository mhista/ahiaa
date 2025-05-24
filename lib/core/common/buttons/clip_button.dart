import 'package:ahiaa/core/common/widgets/containers/rounded_container.dart'
    show TRoundedContainer;
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../entities/product.dart';

class ClipButtonButton extends StatelessWidget {
  const ClipButtonButton({super.key, required this.index, this.product});

  final int index;
  final Products? product;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: GestureDetector(
        onTap: () {},

        child: TRoundedContainer(
          elevation: 0.4,
          radius: 20,
          backgroundColor: PColors.secondary,
          height: 32,
          width: 56,
          child: Center(
            child: Text(
              '\$${product?.price}',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.apply(color: Colors.white),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ),
      ),
    );
  }
}
