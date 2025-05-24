import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/helpers/helper_functions.dart';
import '../../../../../core/common/widgets/products/cart/add_remove_button.dart';
import '../../../../../core/common/widgets/products/cart/cart_item.dart'
    show CartItem;
import '../../../../../core/common/widgets/texts/product_price_text.dart';
import '../../../../../core/dependencies/init_dependencies.dart';
import '../../business_logic/bloc/cart_bloc.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key, this.showAddRemoveButton = true});
  final bool showAddRemoveButton;
  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return
    //  Obx(() {
    // return
    BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        debugPrint('CartItems state: $state');

        final list = state as CartList;

        return ListView.separated(
          itemCount: list.list.length, //cartController.cartItems.length,
          shrinkWrap: true,
          itemBuilder: (_, index) {
            final item = list.list[index];
            return Column(
              children: [
                CartItem(cartItem: item),
                if (showAddRemoveButton)
                  const SizedBox(height: PSizes.spaceBtwItems),

                // ADD AND REMOVE BUTTONS
                if (showAddRemoveButton)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // extra space
                          const SizedBox(width: 89),
                          // ADD REMOVE BUTTON
                          ProductAddAndRemove(
                            valueWidget: BlocBuilder<CartBloc, CartState>(
                              builder: (context, state) {
                                if (state is CartList) {
                                  return Text(
                                    item.quantity.toString(),
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  );
                                }
                                return Text(
                                  '0',
                                  style: Theme.of(context).textTheme.titleSmall,
                                );
                              },
                            ),
                            width: 32,
                            height: 32,
                            addColor: PColors.white,
                            addBgColor: PColors.primary,
                            minusColor: isDark ? PColors.white : PColors.black,
                            minusBgColor:
                                isDark ? PColors.darkerGrey : PColors.light,
                            addOnPressed:
                                () => serviceLocator<CartBloc>().add(
                                  AddItem(item),
                                ),
                            // =>
                            //  cartController.addItemToCart(item),
                            minusOnPressed:
                                () => serviceLocator<CartBloc>().add(
                                  RemoveItem(item),
                                ),
                            // =>
                            // cartController.removeItemFromCart(item),
                          ),
                        ],
                      ),
                      // PRODUCT TOTAL PRICE
                      ProductPriceText(
                        price: (item.price * item.quantity).toStringAsFixed(1),
                      ),
                    ],
                  ),
              ],
            );
          },
          separatorBuilder:
              (_, __) => const SizedBox(height: PSizes.spaceBtwSections),
        );
      },
    );
  }
}
