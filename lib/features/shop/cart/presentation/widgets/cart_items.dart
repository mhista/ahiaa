import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../../core/common/widgets/products/cart/add_remove_button.dart';
import '../../../../core/common/widgets/products/cart/cart_item.dart'
    show CartItem;
import '../../../../core/common/widgets/texts/product_price_text.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key, this.showAddRemoveButton = true});
  final bool showAddRemoveButton;
  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    // final cartController = CartController.instance;
    return
    //  Obx(() {
    // return
    ListView.separated(
      itemCount: 2, //cartController.cartItems.length,
      shrinkWrap: true,
      itemBuilder: (_, index) {
        // final item = cartController.cartItems[index];
        return Column(
          children: [
            CartItem(),
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
                        width: 32,
                        height: 32,
                        addColor: PColors.white,
                        addBgColor: PColors.primary,
                        minusColor: isDark ? PColors.white : PColors.black,
                        minusBgColor:
                            isDark ? PColors.darkerGrey : PColors.light,
                        text: '5', //item.quantity.toString(),
                        addOnPressed: () {},
                        // =>
                        //  cartController.addItemToCart(item),
                        minusOnPressed: () {},
                        // =>
                        // cartController.removeItemFromCart(item),
                      ),
                    ],
                  ),
                  // PRODUCT TOTAL PRICE
                  ProductPriceText(
                    price:
                        '100', // (item.price * item.quantity).toStringAsFixed(1),
                  ),
                ],
              ),
          ],
        );
      },
      separatorBuilder:
          (_, __) => const SizedBox(height: PSizes.spaceBtwSections),
    );
  }
}
