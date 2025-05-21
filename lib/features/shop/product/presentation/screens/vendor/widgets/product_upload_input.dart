import 'package:ahiaa/utils/constants/sizes.dart';
import 'package:ahiaa/utils/validators/validation.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/common/widgets/fields/custom_textfield.dart';

class ProductUploadInput extends StatelessWidget {
  const ProductUploadInput({
    super.key,
    required this.productPriceController,
    required this.productDiscountController,
    required this.productTitleController,
    required this.productQuantityController,
    required this.productDetailController,
  });

  final TextEditingController productPriceController;
  final TextEditingController productDiscountController;
  final TextEditingController productTitleController;
  final TextEditingController productQuantityController;
  final TextEditingController productDetailController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: PSizes.spaceBtwItems / 1.4,

          children: [
            Row(
              spacing: PSizes.spaceBtwItems / 1.4,

              children: [
                // main price
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        'Price',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      TextFieldForm(
                        canDispose: false,
                        controller: productPriceController,
                        fieldName: 'Price',
                        hintText: 'Enter Product Price',
                        validator:
                            (value) =>
                                PValidator.validateEmptyText('Price', value),
                      ),
                    ],
                  ),
                ),

                // discount price
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        'Discount price',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      TextFieldForm(
                        canDispose: false,
                        controller: productDiscountController,
                        fieldName: 'Discount price',
                        hintText: 'leave blank if none',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              spacing: PSizes.spaceBtwItems / 1.4,

              children: [
                // main price
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        'Title',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      TextFieldForm(
                        canDispose: false,
                        controller: productTitleController,
                        fieldName: 'Title',
                        hintText: 'Enter Product Title',
                        validator:
                            (value) =>
                                PValidator.validateEmptyText('Title', value),
                      ),
                    ],
                  ),
                ),

                // discount price
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        'quantity',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      TextFieldForm(
                        canDispose: false,
                        controller: productQuantityController,
                        fieldName: 'quantity',
                        hintText: 'enter quantity',
                        validator:
                            (value) =>
                                PValidator.validateEmptyText('Quantity', value),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Text(
            //       'Title',
            //       style: Theme.of(context).textTheme.headlineSmall,
            //     ),
            //     TextFieldForm(
            // canDispose: false,
            //       controller: productTitleController,
            //       fieldName: 'Title',
            //       hintText: 'Enter Product Title',
            //     ),
            //   ],
            // ),
            // DESCRIPTION
            Text(
              'Description',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            TextFieldForm(
              canDispose: false,
              controller: productDetailController,
              fieldName: 'Title',
              hintText: 'Enter Product Description',
              minLines: 4,
              validator:
                  (value) => PValidator.validateEmptyText(
                    'Product Description',
                    value,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
