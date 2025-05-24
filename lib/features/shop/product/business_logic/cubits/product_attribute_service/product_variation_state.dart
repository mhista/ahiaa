part of 'product_variation_cubit.dart';

class VariationState extends Equatable {
  final Map<String, dynamic> selectedAttributes;
  final String variationStockStatus;
  final ProductVariationModel selectedVariation;

  const VariationState({
    required this.selectedAttributes,
    required this.variationStockStatus,
    required this.selectedVariation,
  });

  factory VariationState.initial() => VariationState(
    selectedAttributes: {},
    variationStockStatus: '',
    selectedVariation: ProductVariationModel.empty(),
  );

  VariationState copyWith({
    Map<String, dynamic>? selectedAttributes,
    String? variationStockStatus,
    ProductVariationModel? selectedVariation,
  }) {
    return VariationState(
      selectedAttributes: selectedAttributes ?? this.selectedAttributes,
      variationStockStatus: variationStockStatus ?? this.variationStockStatus,
      selectedVariation: selectedVariation ?? this.selectedVariation,
    );
  }

  @override
  List<Object?> get props => [
    selectedAttributes,
    variationStockStatus,
    selectedVariation,
  ];
}
