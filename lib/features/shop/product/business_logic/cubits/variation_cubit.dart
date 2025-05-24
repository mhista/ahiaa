import 'package:ahiaa/features/shop/product/data/models/product_attributes.dart';
import 'package:ahiaa/features/shop/product/data/models/product_variations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductVariationCubit extends Cubit<List<ProductVariationModel>?> {
  ProductVariationCubit() : super([]);

  Future<void> addProductVariation(ProductVariationModel variation) async {
    emit([...?state, variation]);

    // return [...state];
  }

  void emptyCubit() => emit([]);
}
