import 'package:ahiaa/core/common/loaders/loaders.dart';
import 'package:ahiaa/core/common/widgets/containers/rounded_container.dart';
import 'package:ahiaa/core/common/widgets/icons/circular_icon.dart';
import 'package:ahiaa/core/entities/product.dart';
import 'package:ahiaa/features/shop/cart/business_logic/bloc/cart_bloc.dart';
import 'package:ahiaa/features/shop/cart/business_logic/cubit/cart_service.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'package:ahiaa/utils/constants/colors.dart';
import 'package:ahiaa/utils/constants/sizes.dart';
import 'package:ahiaa/utils/helpers/helper_functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../core/common/widgets/products/cart/add_remove_button.dart';
import '../../../../../../../core/dependencies/init_dependencies.dart';
import '../../../../../../../core/routes/route_names.dart';
import '../../../../../cart/business_logic/cubit/cart_service.dart';

// import '../../models/product_model.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key, required this.product});
  final Products product;
  @override
  Widget build(BuildContext context) {
    final cartBloc = serviceLocator<CartBloc>();
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
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ProductAddAndRemove(
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
                addColor: PColors.white,
                addBgColor:
                    // serviceLocator<CartService>().itemQuantityInCart ==
                    //         product.stock
                    //     ? PColors.darkGrey
                    //     :
                    PColors.primary,
                minusColor: PColors.white,
                minusBgColor: PColors.darkGrey,
                addOnPressed: () {
                  if (product.stock <=
                      serviceLocator<CartService>().itemQuantityToUpdate) {
                    return;
                  }
                  cartBloc.add(UpdateCartItemCount(isIncrease: true));
                },
                minusOnPressed:
                    () => cartBloc.add(UpdateCartItemCount(isIncrease: false)),
              ),
            ],
          ),
          Row(
            spacing: PSizes.spaceBtwItems,
            children: [
              Icon(Iconsax.message),
              BlocConsumer<CartBloc, CartState>(
                listener: (context, state) {
                  if (state is CartError) {
                    PLoaders.errorSnackBar(
                      context: context,
                      message: state.message,
                    );
                  }
                  if (state is CartSuccess) {
                    PLoaders.customToast(
                      context: context,
                      message: state.message,
                    );
                  }
                },
                builder: (context, state) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: PSizes.sm - 3,
                        horizontal: PSizes.sm + 2,
                      ),
                      backgroundColor:
                          (state is CartItemCountUpdated &&
                                  state.itemCount <= 0)
                              ? PColors.primary.withValues(alpha: 0.9)
                              : PColors.primary,
                      elevation: 0,
                      // side: const BorderSide(color: PColors.black),
                    ),
                    onPressed: () {
                      if (state is CartList && state.list.isNotEmpty) {
                        Beamer.of(context).beamToNamed(RouteNames.cart);
                      } else if (state is CartItemCountUpdated &&
                          state.itemCount > 0) {
                        cartBloc.add(AddToCart(product, state.itemCount));
                      } else if ((state is CartItemCountUpdated &&
                          state.itemCount <= 0)) {
                        Beamer.of(context).beamToNamed(RouteNames.cart);
                      }
                    },
                    child: Row(
                      spacing: PSizes.sm,
                      children: [
                        Text(
                          ((state is CartList && state.list.isNotEmpty))
                              ? 'Cart'
                              : 'Add',
                        ),
                        TRoundedContainer(
                          height: 35,
                          width: 35,
                          backgroundColor: PColors.light,
                          child: Icon(
                            Icons.arrow_outward_outlined,
                            color:
                                (state is CartItemCountUpdated &&
                                        state.itemCount <= 0)
                                    ? PColors.primary.withValues(alpha: 0.9)
                                    : PColors.primary,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
