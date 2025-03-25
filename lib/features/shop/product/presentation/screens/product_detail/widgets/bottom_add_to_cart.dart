import 'package:ahiaa/core/common/widgets/containers/rounded_container.dart';
import 'package:ahiaa/core/common/widgets/icons/circular_icon.dart';
import 'package:flutter/material.dart';

import 'package:ahiaa/utils/constants/colors.dart';
import 'package:ahiaa/utils/constants/sizes.dart';
import 'package:ahiaa/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

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
        // color: isDark ? PColors.darkerGrey : PColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(PSizes.cardRadiusLg),
          topRight: Radius.circular(PSizes.cardRadiusLg),
        ),
        //   boxShadow: [
        //     BoxShadow(
        //       color: PColors.primary.withValues(alpha: 0.08),
        //       blurRadius: 30,
        //       offset: Offset(15, 15),
        //       spreadRadius: 40,
        //     ),
        //   ],
        // ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ProductAddAndRemove(
                width: 30,
                height: 30,
                addColor: PColors.white,
                addBgColor: PColors.primary,
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
          Row(
            spacing: PSizes.spaceBtwItems,
            children: [
              Icon(Iconsax.message),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: PSizes.sm - 3,
                    horizontal: PSizes.sm + 2,
                  ),
                  backgroundColor: PColors.primary,
                  elevation: 0,
                  // side: const BorderSide(color: PColors.black),
                ),
                onPressed: () {},
                //  cartController.productQuantityInCart < 1
                //     ? null
                //     : () => cartController.addToCart(product),
                child: Row(
                  spacing: PSizes.sm,
                  children: [
                    const Text('Buy'),
                    TRoundedContainer(
                      height: 35,
                      width: 35,
                      backgroundColor: PColors.light,
                      child: Icon(
                        Icons.arrow_outward_outlined,
                        color: PColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
