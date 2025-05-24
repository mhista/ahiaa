import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/dependencies/init_dependencies.dart';
import '../../../../../../core/entities/product.dart';
import '../../../../cart/business_logic/cubit/cart_service.dart';
import '../../../data/models/product_variations.dart';
import '../image_controller_cubits.dart';

part 'product_variation_state.dart';

class VariationCubit extends Cubit<VariationState> {
  VariationCubit() : super(VariationState.initial());

  void onAttributeSelected(
    Products product,
    String attributeName,
    dynamic attributeValue,
  ) {
    final updatedAttributes = Map<String, dynamic>.from(
      state.selectedAttributes,
    );
    updatedAttributes[attributeName] = attributeValue;

    final matchedVariation = product.productVariations!.firstWhere(
      (variation) =>
          _isSameAttributeValues(variation.attributeValues, updatedAttributes),
      orElse: () => ProductVariationModel.empty(),
    );

    // Update image if available
    if (matchedVariation.image!.isNotEmpty) {
      serviceLocator<ProductImageCubit>().setSelectedImage(
        matchedVariation.image!,
      );
    }

    // Update quantity in cart if variation exists
    if (matchedVariation.id.isNotEmpty) {
      final cartController = serviceLocator<CartService>();
      cartController.setItemQuantityToUpdate(
        cartController.getVariationQuantityInCart(
          product.id,
          matchedVariation.id,
        ),
      );
    }

    // Emit new state
    emit(
      state.copyWith(
        selectedAttributes: updatedAttributes,
        selectedVariation: matchedVariation,
        variationStockStatus:
            matchedVariation.stock > 0 ? 'In Stock' : 'Out of Stock',
      ),
    );
  }

  bool _isSameAttributeValues(
    Map<String, dynamic> variationAttributes,
    Map<String, dynamic> selectedAttributes,
  ) {
    if (variationAttributes.length != selectedAttributes.length) return false;

    for (final key in variationAttributes.keys) {
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }
    return true;
  }

  Set<String?> getAttributeAvailabilityInVariation(
    List<ProductVariationModel> variations,
    String attributeName,
  ) {
    return variations
        .where(
          (variation) =>
              variation.attributeValues[attributeName] != null &&
              variation.attributeValues[attributeName]!.isNotEmpty &&
              variation.stock > 0,
        )
        .map((variation) => variation.attributeValues[attributeName])
        .toSet();
  }

  String getVariationPrice(Products product) {
    final variation = state.selectedVariation;
    return (variation.salePrice! > 0
            ? variation.salePrice
            : variation.price! > 0
            ? variation.price
            : product.salePrice! > 0
            ? product.salePrice
            : product.price)
        .toString();
  }

  void resetSelectedAttributes() {
    emit(VariationState.initial());
  }
}
