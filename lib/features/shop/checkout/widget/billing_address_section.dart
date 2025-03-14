import 'package:flutter/material.dart';

import 'package:ahiaa/utils/constants/sizes.dart';

import '../../../../core/common/widgets/texts/section_heading.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = AddressController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PSectionHeading(
          title: 'Shipping Address',
          showActionButton: true,
          buttonTitle: 'Change',
          onPressed: () {}, //=> controller.selectNewAddressPopup(context),
        ),
        const SizedBox(height: PSizes.spaceBtwItems / 2),
        // controller.selectedAddress.value.id.isNotEmpty
        //     ? Obx(() {
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'address', //controller.selectedAddress.value.name,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: PSizes.spaceBtwItems / 2),
            Row(
              children: [
                const Icon(Icons.phone, color: Colors.grey, size: 16),
                const SizedBox(width: PSizes.spaceBtwItems),
                Text(
                  ' phone number', // controller.selectedAddress.value.formattedPhoneNo,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: PSizes.spaceBtwItems / 2),
            Row(
              children: [
                const Icon(
                  Icons.location_history,
                  color: Colors.grey,
                  size: 16,
                ),
                const SizedBox(width: PSizes.spaceBtwItems),
                Text(
                  'street', // controller.selectedAddress.value.street,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
        // : Text(
        //     'Select Address',
        //     style: Theme.of(context).textTheme.bodyMedium,
        //   ),
      ],
    );
  }
}
