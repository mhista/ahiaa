import 'package:ahiaa/core/common/widgets/appbar/app_bar.dart';
import 'package:ahiaa/core/common/widgets/containers/rounded_container.dart';
import 'package:ahiaa/core/common/widgets/fields/custom_textfield.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/widgets/images/circular_images.dart';
import '../../../../core/common/widgets/images/edge_rounded_images.dart';
import '../../../../core/common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import 'widgets/product_attribute.dart';

class UploadProductScreen extends StatelessWidget {
  const UploadProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productTitleController = TextEditingController();
    final productDetailController = TextEditingController();
    final sizeController = TextEditingController();
    return Scaffold(
      appBar: PAppBar(leadingIcon: Icons.cancel, title: Text('Product Upload')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.spaceBtwItems),
          child: Column(
            spacing: PSizes.spaceBtwSections,
            children: [
              // IMAGE UPLOADS
              TRoundedContainer(
                child: Column(
                  spacing: PSizes.spaceBtwItems,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PSectionHeading(
                      title: 'Product Images',
                      showActionButton: false,
                    ),
                    Wrap(
                      alignment: WrapAlignment.start,
                      spacing: PSizes.spaceBtwItems / 2,
                      runSpacing: PSizes.spaceBtwItems / 2,
                      children: [
                        PRoundedImage(
                          imageUrl: PImages.p1,
                          width: 55,
                          height: 65,
                          borderRadius: 10,
                        ),

                        TRoundedContainer(
                          backgroundColor: PColors.accent.withValues(
                            alpha: 0.1,
                          ),
                          width: 55,
                          height: 65,
                          radius: 10,
                          child: SizedBox(
                            child: PRoundedImage(
                              width: 25,
                              height: 20,
                              borderRadius: 10,
                              imageUrl: PImages.defaultMultiImageIcon,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // TITLE AND DESCRIPTION
              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: PSizes.spaceBtwItems / 1.4,

                    children: [
                      Text(
                        'Title',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      TextFieldForm(
                        controller: productTitleController,
                        fieldName: 'Title',
                        hintText: 'Enter Product Title',
                      ),
                      // DESCRIPTION
                      Text(
                        'Description',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      TextFieldForm(
                        controller: productDetailController,
                        fieldName: 'Title',
                        hintText: 'Enter Product Description',
                        minLines: 4,
                      ),
                    ],
                  ),
                ],
              ),

              // CATEGORY SELECT
              Column(
                spacing: PSizes.spaceBtwItems,

                children: [
                  PSectionHeading(
                    title: 'Categorization',
                    showActionButton: false,
                  ),

                  TRoundedContainer(
                    showBorder: true,
                    padding: EdgeInsets.symmetric(vertical: PSizes.sm),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: PSizes.spaceBtwItems / 2,

                          children: [
                            PCircularImage(
                              imageUrl: PImages.p1,
                              height: 50,
                              width: 50,
                              fit: BoxFit.fitWidth,
                            ),
                            Text(
                              'Fashion and accessories',
                              style: Theme.of(
                                context,
                              ).textTheme.titleMedium!.apply(
                                fontWeightDelta: -1,
                                color: PColors.accent.withValues(alpha: 0.9),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          spacing: PSizes.spaceBtwItems / 2,

                          children: [
                            Text(
                              'Edit',
                              style: Theme.of(
                                context,
                              ).textTheme.titleMedium!.apply(
                                fontWeightDelta: -1,
                                color: PColors.accent.withValues(alpha: 0.9),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: PColors.accent.withValues(alpha: 0.9),
                              size: 20,
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                      ],
                    ),
                  ),

                  TRoundedContainer(
                    showBorder: true,
                    padding: EdgeInsets.all(PSizes.spaceBtwSections),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: PSizes.spaceBtwItems / 2,

                          children: [
                            Text(
                              'Sub Categories',
                              style: Theme.of(
                                context,
                              ).textTheme.titleMedium!.apply(
                                fontWeightDelta: -1,
                                color: PColors.accent.withValues(alpha: 0.9),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          spacing: PSizes.spaceBtwItems / 2,

                          children: [
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: PColors.accent.withValues(alpha: 0.9),
                              size: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // PRODUCT ATTRIBUTE
              Column(
                spacing: PSizes.spaceBtwItems,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  PSectionHeading(
                    title: 'Product Attributes',
                    showActionButton: false,
                  ),
                  Column(
                    spacing: PSizes.spaceBtwItems,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   'Color',
                      //   style: Theme.of(context).textTheme.headlineSmall,
                      // ),
                      Row(
                        children: [
                          Expanded(
                            child: AttributeSelect(
                              controller: sizeController,
                              hintText: 'Color name e.g. blue',
                              hintText2: '',
                              formHeader:
                                  'Color (click on the add button to choose color)',
                              fieldName: 'Color',
                              isColorField: true,
                              colorWidget: TRoundedContainer(
                                width: 30,
                                height: 30,
                                backgroundColor: PColors.transparent,
                                showBorder: true,
                                borderColor: PColors.dark,
                                child: Center(child: Icon(Icons.add)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  AttributeSelect(
                    controller: sizeController,
                    hintText: 'Size e.g(40, 45)',
                    hintText2: 'Attribute e.g(xl, l)',
                    formHeader: 'Size',
                    fieldName: 'Size',
                  ),

                  // TODO:  ADD SPECIAL ADDONS, AND OTHER ATTRIBUTES
                ],
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Upload Product'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
