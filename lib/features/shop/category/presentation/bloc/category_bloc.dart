import 'dart:async';
import 'package:ahiaa/core/dependency/init_dependencies.dart';
import 'package:ahiaa/core/usecases/usecase.dart';
import 'package:ahiaa/features/shop/category/domain/usecases/get_parent_categories.dart';
import 'package:ahiaa/features/shop/category/domain/usecases/upload_categories.dart';
import 'package:ahiaa/features/shop/category/services/category_services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/category_model.dart';
import '../../domain/entities/category.dart';
import '../../domain/usecases/get_all_categories.dart';
import '../../domain/usecases/get_sub_categories.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetAllCategories _getAllCategories;
  final GetSubCategories _getSubCategories;
  final UploadCategories _uploadCategories;
  final GetParentCategories _getParentCategories;

  CategoryBloc({
    required GetAllCategories getAllCategories,
    required GetSubCategories getSubCategories,
    required UploadCategories uploadCategories,
    required GetParentCategories getParentCategories,
  }) : _getAllCategories = getAllCategories,
       _getSubCategories = getSubCategories,
       _uploadCategories = uploadCategories,
       _getParentCategories = getParentCategories,
       super(CategoryInitial()) {
    // Set up event handlers
    on<CategoryUpload>(_uploadCategory);
    on<GetSubCategory>(_getSubCategory);
    on<GetAllCategory>(_getAllCategory);
    on<GetAllParentCategories>(_getAllParentCategories);

    // Trigger initial event to get parent categories
    add(GetAllParentCategories());
  }

  Future<void> _uploadCategory(
    CategoryUpload event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoading());
    final result = await _uploadCategories(
      CategoryParams(
        id: event.id,
        name: event.name,
        image: event.image,
        parentId: event.parentId,
        isFeatured: event.isFeatured,
      ),
    );
    result.fold(
      (failure) => emit(CategoryFailure(message: failure.message)),
      (category) => emit(CategoryUploadSuccess(categoryModel: category)),
    );
  }

  Future<void> _getSubCategory(
    GetSubCategory event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoading());
    final result = await _getSubCategories(
      SubCatParams(categoryID: event.categoryId),
    );
    result.fold(
      (failure) => emit(CategoryFailure(message: failure.message)),
      (category) => emit(CategoriesFetchSuccess(categories: category)),
    );
  }

  Future<void> _getAllCategory(
    GetAllCategory event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoading());
    final result = await _getAllCategories(NoParams());
    result.fold(
      (failure) => emit(CategoryFailure(message: failure.message)),
      (category) => emit(CategoriesFetchSuccess(categories: category)),
    );
  }

  Future<void> _getAllParentCategories(
    GetAllParentCategories event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoading());
    final result = await _getParentCategories(NoParams());
    result.fold((failure) => emit(CategoryFailure(message: failure.message)), (
      categories,
    ) {
      serviceLocator<CategoryService>().updateParentCategories(categories);
      emit(ParentCategoriesFetched(categories: categories));
    });
  }
}
