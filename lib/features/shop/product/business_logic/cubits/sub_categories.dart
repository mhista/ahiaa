import 'package:flutter_bloc/flutter_bloc.dart';

class ProductSubCategoryCubit extends Cubit<List<String>> {
  ProductSubCategoryCubit() : super([]);

  Future<void> addProductAttribute(String subCategory) async {
    emit([...state, subCategory]);

    // return [...state];
  }

  void emptyCubit() => emit([]);
}
