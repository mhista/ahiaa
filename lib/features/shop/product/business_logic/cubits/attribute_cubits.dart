import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/product_attributes.dart';

class ProductAttributeCubits extends Cubit<List<ProductAttributeModel>?> {
  ProductAttributeCubits() : super([]);

  Future<void> addProductAttribute(String? name, List<dynamic> values) async {
    name = name?.trim().toLowerCase();
    final currentState = state ?? [];

    final index = currentState.indexWhere((attr) => attr.name == name);
    if (index != -1) {
      // debugPrint(currentState[index].toString());

      // Update existing attribute
      final updatedAttr = ProductAttributeModel(
        name: name,
        values: [...?currentState[index].values?..addAll(values)],
      );
      debugPrint('Updated Attribute: $updatedAttr');
      final updatedList = List<ProductAttributeModel>.from(currentState);
      debugPrint('Updated List: $updatedList');
      updatedList[index] = updatedAttr;

      emit(updatedList);
    } else {
      // Add new attribute
      final newAttr = ProductAttributeModel(name: name, values: values);
      debugPrint('New Attribute: $newAttr');
      emit(List<ProductAttributeModel>.from(currentState)..add(newAttr));
      debugPrint('Updated List: ${[...currentState, newAttr]}');
    }
  }

  void emptyCubit() => emit([]);
}
