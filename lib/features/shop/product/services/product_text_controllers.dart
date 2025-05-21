import 'package:flutter/material.dart';

class ProductTextControllers {
  final TextEditingController titleController;
  final TextEditingController detailController;
  final TextEditingController priceController;
  final TextEditingController discountController;
  final TextEditingController quantityController;
  final TextEditingController colorNameController;
  final TextEditingController attributeNameController;
  final TextEditingController attributeValueController;

  ProductTextControllers({
    required this.titleController,
    required this.detailController,
    required this.priceController,
    required this.discountController,
    required this.quantityController,
    required this.colorNameController,
    required this.attributeNameController,
    required this.attributeValueController,
  });

  factory ProductTextControllers.create() {
    return ProductTextControllers(
      titleController: TextEditingController(),
      detailController: TextEditingController(),
      priceController: TextEditingController(),
      discountController: TextEditingController(),
      quantityController: TextEditingController(),
      colorNameController: TextEditingController(),
      attributeNameController: TextEditingController(),
      attributeValueController: TextEditingController(),
    );
  }

  // copy with
  ProductTextControllers copyWith({
    TextEditingController? titleController,
    TextEditingController? detailController,
    TextEditingController? priceController,
    TextEditingController? discountController,
    TextEditingController? quantityController,
    TextEditingController? colorNameController,
    TextEditingController? attributeNameController,
    TextEditingController? attributeValueController,
  }) {
    return ProductTextControllers(
      titleController: titleController ?? this.titleController,
      detailController: detailController ?? this.detailController,
      priceController: priceController ?? this.priceController,
      discountController: discountController ?? this.discountController,
      quantityController: quantityController ?? this.quantityController,
      colorNameController: colorNameController ?? this.colorNameController,
      attributeNameController:
          attributeNameController ?? this.attributeNameController,
      attributeValueController:
          attributeValueController ?? this.attributeValueController,
    );
  }

  void dispose() {
    titleController.dispose();
    detailController.dispose();
    priceController.dispose();
    discountController.dispose();
    quantityController.dispose();
    colorNameController.dispose();
    attributeNameController.dispose();
    attributeValueController.dispose();
  }
}
