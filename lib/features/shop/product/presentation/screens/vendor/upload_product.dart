import 'dart:io';

import 'package:ahiaa/core/common/widgets/appbar/app_bar.dart';
import 'package:ahiaa/core/common/widgets/containers/rounded_container.dart';
import 'package:ahiaa/core/common/widgets/fields/custom_textfield.dart';
import 'package:ahiaa/core/cubits/imagePicker/image_picker.dart';
import 'package:ahiaa/core/cubits/user/user_cubit.dart';
import 'package:ahiaa/core/dependency/init_dependencies.dart';
import 'package:ahiaa/features/shop/product/business_logic/bloc/product_bloc.dart';
import 'package:ahiaa/features/shop/product/business_logic/cubits/attribute_cubits.dart';
import 'package:ahiaa/features/shop/product/business_logic/cubits/color_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../../core/common/widgets/images/circular_images.dart';
import '../../../../../../core/common/widgets/images/edge_rounded_images.dart';
import '../../../../../../core/common/widgets/texts/section_heading.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/enums.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import 'widgets/color_attribute.dart';
import 'widgets/product_attribute.dart';

class UploadProductScreen extends StatelessWidget {
  const UploadProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productTitleController = TextEditingController();
    final productDetailController = TextEditingController();
    final productPriceController = TextEditingController();
    final productDiscountController = TextEditingController();
    final productQuantityController = TextEditingController();

    final controller1 = TextEditingController();
    final controller2 = TextEditingController();

    Color selectedColor = Colors.blue;
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
                        BlocBuilder<ImageCubit, List<File>>(
                          builder: (context, state) {
                            return Wrap(
                              alignment: WrapAlignment.start,
                              spacing: PSizes.spaceBtwItems / 2,
                              runSpacing: PSizes.spaceBtwItems / 2,
                              children:
                                  state
                                      .map(
                                        (file) => PRoundedImage(
                                          imageType: ImageType.file,
                                          file: file,
                                          width: 55,
                                          height: 65,
                                          borderRadius: 10,
                                        ),
                                      )
                                      .toList(),
                            );
                          },
                        ),

                        GestureDetector(
                          onTap: () => serviceLocator<ImageCubit>().pickImage(),
                          child: TRoundedContainer(
                            backgroundColor: PColors.accent.withValues(
                              alpha: 0.1,
                            ),
                            width: 55,
                            height: 65,
                            radius: 10,
                            child: SizedBox(
                              child: TRoundedContainer(
                                backgroundColor: PColors.transparent,
                                child: Icon(Icons.add_a_photo_outlined),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // INPUT DETAILS
              Column(
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
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                TextFieldForm(
                                  controller: productPriceController,
                                  fieldName: 'Price',
                                  hintText: 'Enter Product Price',
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
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                TextFieldForm(
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
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                TextFieldForm(
                                  controller: productTitleController,
                                  fieldName: 'Title',
                                  hintText: 'Enter Product Title',
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
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                TextFieldForm(
                                  controller: productQuantityController,
                                  fieldName: 'quantity',
                                  hintText: 'enter quantity',
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
                            child: ColorAttribute(
                              controller: controller1,
                              hintText: 'Color name e.g. blue',
                              hintText2: '',
                              formHeader:
                                  'Color (click on the add button to choose color)',
                              fieldName: 'Color',
                              isColorField: true,
                              colorWidget: GestureDetector(
                                onTap:
                                    () => showDialog(
                                      context: context,
                                      builder:
                                          (_) => AlertDialog(
                                            title: Text('Pick a Color'),
                                            content: SingleChildScrollView(
                                              child: MaterialPicker(
                                                pickerColor: selectedColor,
                                                onColorChanged: (color) {
                                                  selectedColor = color;
                                                  debugPrint(color.toString());
                                                  serviceLocator<
                                                        ColorPickerCubit
                                                      >()
                                                      .addColor(color);
                                                  serviceLocator<
                                                        ProductAttributeCubits
                                                      >()
                                                      .addProductAttribute(
                                                        'color',
                                                        [color],
                                                      );
                                                  Navigator.of(context).pop();
                                                },
                                                // showLabel: true,
                                                // pickerAreaHeightPercent: 0.8,
                                              ),
                                            ),
                                          ),
                                    ),
                                child: TRoundedContainer(
                                  width: 30,
                                  height: 30,
                                  backgroundColor: PColors.transparent,
                                  showBorder: true,
                                  borderColor: PColors.dark,
                                  child: Center(child: Icon(Icons.add)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  AttributeSelect(
                    controller: controller1,
                    hintText: 'E.g (Size)',
                    hintText2: 'Attributes e.g(l, xl, xxl)',
                    formHeader:
                        'Other Attributes (Click apply, to save each attribute)',
                    fieldName: 'Size',
                    controller2: controller2,
                  ),

                  // TODO:  ADD SPECIAL ADDONS, AND OTHER ATTRIBUTES
                ],
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:
                      () => uploadProduct(
                        sellerId:
                            serviceLocator<SupabaseClient>()
                                .auth
                                .currentSession!
                                .user
                                .id,
                        stock: productQuantityController,
                        price: productPriceController,
                        salePrice: productDiscountController,
                        title: productTitleController,
                        description: productDetailController,
                        categoryId: '1',
                        productType: ProductType.single,
                        // canResale: canResale,
                        // resaleAddedAmount: resaleAddedAmount,
                        // coupon: coupon,
                      ),
                  child: Text('Upload Product'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void uploadProduct({
    required sellerId,
    required stock,
    required price,
    salePrice,
    required title,
    isFeatured,
    brand,
    required description,
    required categoryId,
    required productType,
    canResale,
    resaleAddedAmount,
    coupon,
    sku,
  }) {
    return serviceLocator<ProductBloc>().add(
      ProductUpload(
        sellerId: serviceLocator<SupabaseClient>().auth.currentUser!.id,
        stock: stock,
        sku: sku,
        price: price,
        salePrice: salePrice,
        title: title,
        isFeatured: isFeatured,
        brand: brand,
        description: description,
        categoryId: categoryId,
        productType: productType,
        canResale: canResale,
        resaleAddedAmount: resaleAddedAmount,
        coupon: coupon,
      ),
    );
  }
}
