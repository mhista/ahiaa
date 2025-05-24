import 'package:ahiaa/core/common/widgets/containers/rounded_container.dart';
import 'package:ahiaa/utils/constants/colors.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'package:ahiaa/utils/constants/sizes.dart';

import '../../../../core/common/widgets/appbar/app_bar.dart';
import '../../../../core/dependencies/init_dependencies.dart';
import '../../../../core/routes/route_names.dart';
import '../business_logic/cubit/cart_service.dart';
import 'widgets/cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartService = serviceLocator<CartService>();
    // final cartController = CartController.instance;
    return Scaffold(
      appBar: PAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
        ), //style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          GestureDetector(
            onTap: () {},
            child: TRoundedContainer(
              backgroundColor: PColors.primary.withValues(alpha: 0.1),
              radius: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Clear cart',
                  style: Theme.of(context).textTheme.bodySmall!.apply(
                    fontWeightDelta: 2,
                    fontSizeDelta: 2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body:
      //  Obx(() {
      // final emptyAnimationWidget = AnimationLoaderWidget(
      //   text: 'Whoops! Your Cart is empty!',
      //   animation: PImages.whops,
      //   showAction: true,
      //   actionText: 'Let\'s fill it',
      //   onActionPressed: () => Get.offAll(() => const NavigationMenu()),
      // );
      // if (cartController.cartItems.isEmpty) {
      //   return emptyAnimationWidget;
      // } else {
      const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(PSizes.defaultSpace),
          child: CartItems(),
        ),
      ),

      // }),
      bottomNavigationBar:
      //  cartController.cartItems.isEmpty
      //     ? const SizedBox(
      //         // height: PSizes.defaultSpace,
      //         )
      Padding(
        padding: const EdgeInsets.all(PSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {
            Beamer.of(context).beamToNamed(RouteNames.checkout);
            debugPrint(Beamer.of(context).currentPages.first.name.toString());
            debugPrint(Beamer.of(context).currentBeamLocation.toString());

            debugPrint(Beamer.of(context).currentConfiguration?.uri.toString());
          },
          child: Text('Checkout '),
        ),
      ),
    );
  }
}
