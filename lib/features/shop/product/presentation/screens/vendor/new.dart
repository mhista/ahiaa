// import 'package:ahiaa/core/common/widgets/appbar/app_bar.dart';
// import 'package:ahiaa/core/common/widgets/containers/rounded_container.dart';
// import 'package:ahiaa/core/common/widgets/texts/section_heading.dart';
// import 'package:ahiaa/core/dependency/init_dependencies.dart';
// import 'package:ahiaa/features/shop/product/business_logic/bloc/product_bloc.dart';
// import 'package:ahiaa/features/shop/product/business_logic/cubits/attribute_cubits.dart';
// import 'package:ahiaa/features/shop/product/business_logic/cubits/color_cubit.dart';
// import 'package:ahiaa/utils/constants/colors.dart';
// import 'package:ahiaa/utils/constants/enums.dart';
// import 'package:ahiaa/utils/constants/sizes.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_colorpicker/flutter_colorpicker.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// import 'widgets/categegory_sub_select.dart';
// import 'widgets/color_attribute.dart';
// import 'widgets/product_attribute.dart';
// import 'widgets/product_image_upload.dart';
// import 'widgets/product_upload_input.dart';

// class UploadProductScreen extends StatefulWidget {
//   const UploadProductScreen({super.key});

//   @override
//   State<UploadProductScreen> createState() => _UploadProductScreenState();
// }

// class _UploadProductScreenState extends State<UploadProductScreen> {
//   final _formKey = GlobalKey<FormState>();

//   // Controllers
//   final _titleController = TextEditingController();
//   final _detailController = TextEditingController();
//   final _priceController = TextEditingController();
//   final _discountController = TextEditingController();
//   final _quantityController = TextEditingController();
//   final _colorNameController = TextEditingController();
//   final _attributeNameController = TextEditingController();
//   final _attributeValueController = TextEditingController();

//   // State variables
//   Color _selectedColor = Colors.blue;
//   String _categoryId =
//       '1'; // Default value, better to make it nullable and validate

//   @override
//   void dispose() {
//     // Clean up controllers
//     _titleController.dispose();
//     _detailController.dispose();
//     _priceController.dispose();
//     _discountController.dispose();
//     _quantityController.dispose();
//     _colorNameController.dispose();
//     _attributeNameController.dispose();
//     _attributeValueController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const PAppBar(
//         leadingIcon: Icons.cancel,
//         title: Text('Product Upload'),
//       ),
//       body: _buildBody(context),
//     );
//   }

//   Widget _buildBody(BuildContext context) {
//     return SingleChildScrollView(
//       child: Form(
//         key: _formKey,
//         child: Padding(
//           padding: const EdgeInsets.all(PSizes.spaceBtwItems),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Image upload section
//               const ImageUploadWidget(),
//               const SizedBox(height: PSizes.spaceBtwSections),

//               // Product details input section
//               ProductUploadInput(
//                 productTitleController: _titleController,
//                 productDetailController: _detailController,
//                 productPriceController: _priceController,
//                 productDiscountController: _discountController,
//                 productQuantityController: _quantityController,
//               ),
//               const SizedBox(height: PSizes.spaceBtwSections),

//               // Category selection section
//               const CategoryAndSubSelect(),
//               const SizedBox(height: PSizes.spaceBtwSections),

//               // Product attributes section
//               _buildAttributesSection(context),
//               const SizedBox(height: PSizes.spaceBtwSections),

//               // Submit button
//               _buildSubmitButton(),
//               const SizedBox(height: PSizes.spaceBtwSections),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildAttributesSection(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const PSectionHeading(
//           title: 'Product Attributes',
//           showActionButton: false,
//         ),
//         const SizedBox(height: PSizes.spaceBtwItems),

//         // Color attribute
//         _buildColorAttribute(context),
//         const SizedBox(height: PSizes.spaceBtwItems),

//         // Other attributes
//         AttributeSelect(
//           controller: _attributeNameController,
//           controller2: _attributeValueController,
//           hintText: 'E.g (sizes)',
//           hintText2: 'Attributes e.g(xxl)',
//           formHeader: 'Other Attributes (sizes, weight, length, etc)',
//           fieldName: 'Size',
//         ),
//       ],
//     );
//   }

//   Widget _buildColorAttribute(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: ColorAttribute(
//             controller: _colorNameController,
//             hintText: 'Color name e.g. blue',
//             hintText2: '',
//             formHeader: 'Color (click on the add button to choose color)',
//             fieldName: 'Color',
//             isColorField: true,
//             colorWidget: GestureDetector(
//               onTap: () => _showColorPicker(context),
//               child: const TRoundedContainer(
//                 width: 30,
//                 height: 30,
//                 backgroundColor: PColors.transparent,
//                 showBorder: true,
//                 borderColor: PColors.dark,
//                 child: Center(child: Icon(Icons.add)),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   void _showColorPicker(BuildContext context) {
//     showDialog(
//       context: context,
//       builder:
//           (_) => AlertDialog(
//             title: const Text('Pick a Color'),
//             content: SingleChildScrollView(
//               child: MaterialPicker(
//                 pickerColor: _selectedColor,
//                 onColorChanged: (color) {
//                   setState(() {
//                     _selectedColor = color;
//                   });
//                   _handleColorSelected(color);
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ),
//           ),
//     );
//   }

//   void _handleColorSelected(Color color) {
//     debugPrint(color.toString());

//     // Update color attribute
//     serviceLocator<ProductAttributeCubits>().addProductAttribute('color', [
//       color,
//     ]);

//     // Update color picker state
//     serviceLocator<ColorPickerCubit>().addColor(color);
//   }

//   Widget _buildSubmitButton() {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton(
//         onPressed: _uploadProduct,
//         child: const Text('Upload Product'),
//       ),
//     );
//   }

//   void _uploadProduct() {
//     if (!_formKey.currentState!.validate()) {
//       return;
//     }

//     final currentUser = serviceLocator<SupabaseClient>().auth.currentUser;
//     if (currentUser == null) {
//       // Handle unauthenticated user
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text('User not authenticated')));
//       return;
//     }

//     // Parse numeric values safely
//     int? stock;
//     double? price;
//     double? salePrice;

//     try {
//       stock = int.parse(_quantityController.text.trim());
//       price = double.parse(_priceController.text.trim());

//       if (_discountController.text.isNotEmpty) {
//         salePrice = double.parse(_discountController.text.trim());
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Please enter valid numbers for price and quantity'),
//         ),
//       );
//       return;
//     }

//     // Dispatch product upload event
//     serviceLocator<ProductBloc>().add(
//       ProductUpload(
//         sellerId: currentUser.id,
//         stock: stock!,
//         price: price!,
//         salePrice: salePrice,
//         title: _titleController.text.trim(),
//         description: _detailController.text.trim(),
//         categoryId: _categoryId,
//         productType: ProductType.single.name,
//         // Optional fields
//         sku: null,
//         isFeatured: false,
//         brand: null,
//         canResale: null,
//         resaleAddedAmount: null,
//         coupon: null,
//       ),
//     );
//   }

//   // Method to update category ID (to be called from CategoryAndSubSelect widget)
//   void updateCategoryId(String id) {
//     setState(() {
//       _categoryId = id;
//     });
//   }
// }
