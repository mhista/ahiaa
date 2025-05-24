import 'package:ahiaa/core/common/widgets/products/cart/add_remove_button.dart';
import 'package:flutter/material.dart';

import 'package:ahiaa/utils/constants/colors.dart';
import 'package:ahiaa/utils/constants/sizes.dart';
import 'package:ahiaa/utils/helpers/helper_functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/common/widgets/containers/rounded_container.dart';
import '../../../../../../../core/common/widgets/list_tiles/variation_tile.dart';
import '../../../../../../../core/dependencies/init_dependencies.dart';
import '../../../../../../../core/entities/product.dart' show Products;
import '../../../../../cart/business_logic/bloc/cart_bloc.dart';
import '../../../../../cart/business_logic/cubit/cart_service.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key, required this.product});

  final Products product;
  @override
  Widget build(BuildContext context) {
    final cartBloc = serviceLocator<CartBloc>();

    final isDark = PHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        // SELECTED ATTRIBUTE PRICING
        // if (controller.selectedVariation.value.id.isNotEmpty)
        TRoundedContainer(
          padding: const EdgeInsets.symmetric(vertical: PSizes.md),
          child: Column(
            spacing: PSizes.sm,
            children: [
              if (product.productAttributes != null)
                Column(
                  spacing: PSizes.sm,

                  children:
                      product.productAttributes!
                          .map(
                            (attribute) => VariationWithText(
                              title: attribute.name ?? '',
                              subtitle: attribute.values?.first,
                              onPressed: () {},
                            ),
                          )
                          .toList(),
                ),

              VariationTile(
                title: 'Quantity',
                trailing: GestureDetector(
                  onTap: () {},
                  child: ProductAddAndRemove(
                    valueWidget: BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        if (state is CartItemCountUpdated) {
                          return Text(
                            state.itemCount.toString(),
                            style: Theme.of(context).textTheme.titleSmall,
                          );
                        }
                        return Text(
                          '0',
                          style: Theme.of(context).textTheme.titleSmall,
                        );
                      },
                    ),
                    width: 30,
                    height: 30,
                    addColor: !isDark ? PColors.black : PColors.white,
                    addBgColor: PColors.transparent,
                    minusColor: !isDark ? PColors.darkGrey : PColors.grey,
                    minusBgColor: PColors.transparent,
                    addOnPressed: () {
                      if (product.stock <=
                          serviceLocator<CartService>().itemQuantityToUpdate) {
                        return;
                      }
                      cartBloc.add(UpdateCartItemCount(isIncrease: true));
                    },
                    minusOnPressed:
                        () => cartBloc.add(
                          UpdateCartItemCount(isIncrease: false),
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class VariationWithText extends StatelessWidget {
  const VariationWithText({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });

  final String title, subtitle;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return VariationTile(
      title: title,
      trailing: GestureDetector(
        onTap: onPressed,
        child: Row(
          spacing: PSizes.xs + 2,
          children: [
            Text(
              subtitle,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.apply(fontWeightDelta: 2),
            ),
            Column(
              children: [
                Icon(Icons.keyboard_arrow_up_outlined, size: 15, weight: 3),
                Icon(Icons.keyboard_arrow_down_outlined, size: 15, weight: 5),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
