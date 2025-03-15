import 'dart:async';

import 'package:ahiaa/features/shop/category/domain/usecases/upload_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetAllCategories _getAllCategories;
  final GetSubCategories _getSubCategories;
  final UploadCategories _uploadCategories;

  CategoryBloc({
    required GetAllCategories getAllCategories,
    required GetSubCategories getSubCategories,
    required UploadCategories uploadCategories,
  }) : _getAllCategories = getAllCategories,
       _getSubCategories = getSubCategories,
       _uploadCategories = uploadCategories,
       super(CategoryInitial());

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    // TODO: implement mapEventToState
  }
}
