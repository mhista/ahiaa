import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../containers/rounded_container.dart';
import '../../icons/favorite_icon.dart';
import '../../images/edge_rounded_images.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    super.key,
    this.height = 130,
    this.width = 145,
  });

  final double height, width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              TRoundedContainer(
                height: height,
                width: width,
                child: PRoundedImage(
                  contentPadding: 0,
                  fit: BoxFit.cover,
                  imageUrl: PImages.craft2,
                ),
              ),
              Positioned(
                  left: 15,
                  top: 5,
                  child: TRoundedContainer(
                    radius: 5,
                    backgroundColor: Colors.black.withOpacity(0.8),
                    width: 55,
                    height: 20,
                    padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                    child: Text(
                      '+8k sold',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .apply(color: PColors.white, fontWeightDelta: 2),
                    ),
                  )),
              FavoriteIcon(
                size: 18,
                width: 35,
                height: 35,
                right: 15,
                bottom: 10,
                color: PColors.white,
                weight: 20,
                backgrondColor: PColors.dark.withOpacity(0.5),
                productId: '',
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: PSizes.sm + 2),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Item Name',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .apply(fontSizeDelta: -2, fontWeightDelta: -1)),
                    Row(
                      children: [
                        Text(
                          '\$300',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .apply(fontSizeDelta: 1, fontWeightDelta: 2),
                        ),
                        SizedBox(
                          width: PSizes.xs,
                        ),
                        Text(
                          '\$300',
                          style: Theme.of(context).textTheme.labelSmall!.apply(
                                fontSizeDelta: 1,
                                fontWeightDelta: 0,
                                decoration: TextDecoration.lineThrough,
                              ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
