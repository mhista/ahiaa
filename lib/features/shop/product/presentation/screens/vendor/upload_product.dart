import 'package:ahiaa/core/common/widgets/appbar/app_bar.dart';
import 'package:ahiaa/core/common/widgets/containers/rounded_container.dart';
import 'package:ahiaa/core/common/widgets/texts/section_heading.dart';
import 'package:ahiaa/core/dependency/init_dependencies.dart';
import 'package:ahiaa/features/shop/product/business_logic/bloc/product_bloc.dart';
import 'package:ahiaa/features/shop/product/business_logic/cubits/attribute_cubits.dart';
import 'package:ahiaa/features/shop/product/business_logic/cubits/color_cubit.dart';
import 'package:ahiaa/features/shop/product/business_logic/cubits/sub_categories.dart';
import 'package:ahiaa/utils/constants/colors.dart';
import 'package:ahiaa/utils/constants/enums.dart';
import 'package:ahiaa/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../../utils/helpers/color_serializer.dart';
import '../../../services/product_text_controllers.dart';
import 'widgets/categegory_sub_select.dart';
import 'widgets/color_attribute.dart';
import 'widgets/product_attribute.dart';
import 'widgets/product_image_upload.dart';
import 'widgets/product_upload_input.dart';

class UploadProductScreen extends StatefulWidget {
  const UploadProductScreen({super.key});

  @override
  State<UploadProductScreen> createState() => _UploadProductScreenState();
}

class _UploadProductScreenState extends State<UploadProductScreen> {
  final _formKey = GlobalKey<FormState>();

  final _productTextControllers = serviceLocator<ProductTextControllers>();
  // Controllers

  // State variables
  Color _selectedColor = Colors.blue;

  @override
  void dispose() {
    // Clean up controllers

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PAppBar(
        leadingIcon: Icons.cancel,
        title: Text('Product Upload'),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(PSizes.spaceBtwItems),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image upload section
              const ImageUploadWidget(),
              const SizedBox(height: PSizes.spaceBtwSections),

              // Product details input section
              ProductUploadInput(
                productTitleController: _productTextControllers.titleController,
                productDetailController:
                    _productTextControllers.detailController,
                productPriceController: _productTextControllers.priceController,
                productDiscountController:
                    _productTextControllers.discountController,
                productQuantityController:
                    _productTextControllers.quantityController,
              ),
              const SizedBox(height: PSizes.spaceBtwSections),

              // Category selection section
              const CategoryAndSubSelect(),
              const SizedBox(height: PSizes.spaceBtwSections),

              // Product attributes section
              _buildAttributesSection(context),
              const SizedBox(height: PSizes.spaceBtwSections),

              // Submit button
              _buildSubmitButton(),
              const SizedBox(height: PSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAttributesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PSectionHeading(
          title: 'Product Attributes',
          showActionButton: false,
        ),
        const SizedBox(height: PSizes.spaceBtwItems),

        // Color attribute
        _buildColorAttribute(context),
        const SizedBox(height: PSizes.spaceBtwItems),

        // Other attributes
        AttributeSelect(
          controller: _productTextControllers.attributeNameController,
          controller2: _productTextControllers.attributeValueController,
          hintText: 'E.g (sizes)',
          hintText2: 'Attributes e.g(xxl)',
          formHeader: 'Other Attributes (sizes, weight, length, etc)',
          fieldName: 'Size',
        ),
      ],
    );
  }

  Widget _buildColorAttribute(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ColorAttribute(
            controller: _productTextControllers.colorNameController,
            hintText: 'Color name e.g. blue',
            hintText2: '',
            formHeader: 'Color (click on the add button to choose color)',
            fieldName: 'Color',
            isColorField: true,
            colorWidget: GestureDetector(
              onTap: () => _showColorPicker(context),
              child: const TRoundedContainer(
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
    );
  }

  void _showColorPicker(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('Pick a Color'),
            content: SingleChildScrollView(
              child: MaterialPicker(
                pickerColor: _selectedColor,
                onColorChanged: (color) {
                  setState(() {
                    _selectedColor = color;
                  });
                  _handleColorSelected(color);
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
    );
  }

  void _handleColorSelected(Color color) {
    debugPrint(color.toString());

    // Update color attribute
    serviceLocator<ProductAttributeCubits>().addProductAttribute('color', [
      ColorSerializer.colorToHex(color),
    ]);

    // Update color picker state
    serviceLocator<ColorPickerCubit>().addColor(color);
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _uploadProduct,
        child: const Text('Upload Product'),
      ),
    );
  }

  void _uploadProduct() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final currentUser =
        serviceLocator<SupabaseClient>().auth.currentSession!.user.id;
    debugPrint(currentUser);
    // if (currentUser == null) {
    //   // Handle unauthenticated user
    //   ScaffoldMessenger.of(
    //     context,
    //   ).showSnackBar(const SnackBar(content: Text('User not authenticated')));
    //   return;
    // }

    // Parse numeric values safely
    int? stock;
    double? price;
    double? salePrice;

    try {
      stock = int.parse(_productTextControllers.quantityController.text.trim());
      price = double.parse(_productTextControllers.priceController.text.trim());

      if (_productTextControllers.discountController.text.isNotEmpty) {
        salePrice = double.parse(
          _productTextControllers.discountController.text.trim(),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter valid numbers for price and quantity'),
        ),
      );
      return;
    }

    // Dispatch product upload event
    serviceLocator<ProductBloc>().add(
      ProductUpload(
        sellerId: currentUser,
        stock: stock,
        price: price,
        salePrice: salePrice,
        title: _productTextControllers.titleController.text.trim(),
        description: _productTextControllers.detailController.text.trim(),
        categoryId:
            serviceLocator<SubCategoryCheckboxCubit>()
                .state!, //updates the products category id depending on the subcategories selected. check the sub_cat_checkbox.dart, in the category feature
        productType: ProductType.single.name,
        // Optional fields
        sku: null,
        isFeatured: false,
        brand: null,
        canResale: false,
        resaleAddedAmount: 0.0,
        coupon: null,
      ),
    );
  }
}
