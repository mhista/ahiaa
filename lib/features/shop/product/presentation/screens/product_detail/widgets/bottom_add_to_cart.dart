import 'package:flutter/material.dart';

import 'package:ahiaa/utils/constants/colors.dart';
import 'package:ahiaa/utils/constants/sizes.dart';
import 'package:ahiaa/utils/helpers/helper_functions.dart';

import '../../../../../../../core/common/widgets/products/cart/add_remove_button.dart';

// import '../../models/product_model.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});
  // final ProductModel product;
  @override
  Widget build(BuildContext context) {
    // final cartController = CartController.instance;
    // cartController.updateAlreadyAddedProductInCart(product);
    final isDark = PHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: PSizes.spaceBtwSections,
        vertical: PSizes.defaultSpace / 2,
      ),
      decoration: BoxDecoration(
        color: isDark ? PColors.darkerGrey : PColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(PSizes.cardRadiusLg),
          topRight: Radius.circular(PSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ProductAddAndRemove(
                width: 40,
                height: 40,
                addColor: PColors.white,
                addBgColor: PColors.black,
                minusColor: PColors.white,
                minusBgColor: PColors.darkGrey,
                text: '1',
                addOnPressed: () {},
                // () =>
                //     cartController.productQuantityInCart.value += 1,
                minusOnPressed: () {},
                //  () =>
                //     cartController.productQuantityInCart.value < 1
                //         ? null
                //         : cartController.productQuantityInCart.value -= 1,
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(PSizes.md),
              backgroundColor: PColors.black,
              side: const BorderSide(color: PColors.black),
            ),
            onPressed: () {},
            //  cartController.productQuantityInCart < 1
            //     ? null
            //     : () => cartController.addToCart(product),
            child: const Text('Add To Cart'),
          ),
        ],
      ),
    );
  }
}
