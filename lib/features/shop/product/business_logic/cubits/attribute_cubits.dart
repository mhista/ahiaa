import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/product_attributes.dart';

class ProductAttributeCubits extends Cubit<List<ProductAttributeModel>?> {
  ProductAttributeCubits() : super([]);

  Future<void> addProductAttribute(String? name, List<dynamic> values) async {
    final currentState = state ?? [];

    final index = currentState.indexWhere((attr) => attr.name == name);

    if (index != -1) {
      // Update existing attribute
      final updatedAttr = ProductAttributeModel(
        name: name,
        values: [...?currentState[index].values, ...values],
      );

      final updatedList = List<ProductAttributeModel>.from(currentState);
      updatedList[index] = updatedAttr;

      emit(updatedList);
    } else {
      // Add new attribute
      final newAttr = ProductAttributeModel(name: name, values: values);
      emit([...currentState, newAttr]);
    }
    debugPrint(currentState.toString());
  }

  void emptyCubit() => emit([]);
}
