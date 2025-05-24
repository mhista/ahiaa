import 'package:flutter/material.dart';
import 'package:ahiaa/utils/constants/sizes.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../utils/helpers/pricing_calculator.dart';
import '../../../core/common/loaders/loaders.dart';
import '../../../core/common/widgets/appbar/app_bar.dart';
import '../../../core/common/widgets/containers/rounded_container.dart';
import '../../../core/dependencies/init_dependencies.dart';
import '../cart/business_logic/bloc/cart_bloc.dart';
import '../cart/presentation/widgets/cart_items.dart';
import 'widget/billing_address_section.dart';
import 'widget/billing_amount_section.dart';
import 'widget/billing_payment_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    final cartService = serviceLocator<CartBloc>().state as CartList;
    final subTotal = cartService.totalPrice;
    final itemCount = cartService.totalItems;
    final total = PPricingCalculator.calculateTotalPrice(
      subTotal,
      'Nigeria',
      itemCount,
    );

    return Scaffold(
      appBar: PAppBar(
        showBackArrow: true,
        title: Text(
          'Checkout',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.defaultSpace - 4.0),
          child: Column(
            children: [
              const CartItems(showAddRemoveButton: false),
              const SizedBox(height: PSizes.spaceBtwSections),

              // COUPON FIELD
              // const CouponCodeField(),
              // const SizedBox(height: PSizes.spaceBtwSections),

              // BILLING SECTION
              TRoundedContainer(
                padding: const EdgeInsets.all(PSizes.md),
                showBorder: true,
                backgroundColor: isDark ? PColors.black : PColors.white,
                child: const Column(
                  children: [
                    // pricing
                    BillingAmountSection(),
                    // divider
                    Divider(),
                    SizedBox(height: PSizes.spaceBtwItems),
                    // payment methods
                    BillingPaymentSection(),
                    SizedBox(height: PSizes.spaceBtwItems),
                    // address
                    BillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // CHECKOUT BUTTON
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(PSizes.defaultSpace),
        child: ElevatedButton(
          onPressed:
              subTotal > 0
                  ? () {} //=> orderController.processOrder(total)
                  : PLoaders.errorSnackBar(
                    context: context,
                    title: 'Empty Cart',
                    message: 'Add items in the cart in order to proceed',
                  ),
          child: Text('Checkout \$$total'),
        ),
      ),
    );
  }
}
