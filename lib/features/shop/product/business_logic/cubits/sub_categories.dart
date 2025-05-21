import 'package:flutter_bloc/flutter_bloc.dart';

class ProductSubCategoryCubit extends Cubit<Set<String?>> {
  ProductSubCategoryCubit() : super({});

  Future<void> addSubcategoryId(String? subCategoryId) async {
    emit({...state, subCategoryId});

    // return [...state];
  }

  void removeSubcategoryId(String? subCategoryId) async {
    emit({...state}..remove(subCategoryId));
  }

  void emptyCubit() => emit({});
}

// controls the check box
class SubCategoryCheckboxCubit extends Cubit<int?> {
  SubCategoryCheckboxCubit() : super(1);

  void addParentId(int? parentId) => emit(parentId);
}
