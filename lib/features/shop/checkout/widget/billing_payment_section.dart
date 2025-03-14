import 'package:ahiaa/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

import 'package:ahiaa/utils/constants/colors.dart';
import 'package:ahiaa/utils/constants/sizes.dart';
import 'package:ahiaa/utils/helpers/helper_functions.dart';

import '../../../../core/common/widgets/containers/rounded_container.dart';
import '../../../../core/common/widgets/texts/section_heading.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    // final controller = CheckoutController.instance;
    return Column(
      children: [
        PSectionHeading(
          title: 'Payment Method',
          showActionButton: true,
          buttonTitle: 'Change',
          onPressed: () {}, // => controller.selectPaymentModel(context),
        ),
        const SizedBox(height: PSizes.spaceBtwItems / 2),
        Row(
          children: [
            // Obx(() {
            // return
            TRoundedContainer(
              width: 60,
              height: 60,
              backgroundColor: isDark ? PColors.light : PColors.white,
              padding: const EdgeInsets.all(PSizes.md),
              child: Image(
                image: AssetImage(
                  PImages.paypal, //controller.selectedPaymentModel.value.image,
                ),
                fit: BoxFit.contain,
              ),
            ),
            // }),
            const SizedBox(width: PSizes.spaceBtwItems / 2),
            Text(
              'paypal', //controller.selectedPaymentModel.value.name,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ],
    );
  }
}
