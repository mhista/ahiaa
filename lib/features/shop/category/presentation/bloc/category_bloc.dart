// ignore: dangling_library_doc_comments
/// Bloc responsible for managing category-related events and states.
///
/// Handles these events:
/// - [CategoryUpload]: Uploads a new category.
/// - [GetSubCategory]: Fetches subcategories for a given category.
/// - [GetAllCategory]: Fetches all categories.
/// - [GetAllParentCategories]: Fetches all parent categories.
///
/// Emits these states:
/// - [CategoryInitial]
/// - [CategoryLoading]
/// - [CategoryFailure]
/// - [CategoryUploadSuccess]
/// - [CategoriesFetchSuccess]
/// - [ParentCategoriesFetched]
///
/// Relies on these use cases:
/// - [GetAllCategories]
/// - [GetSubCategories]
/// - [UploadCategories]
/// - [GetParentCategories]

import 'dart:async';
import 'package:ahiaa/core/usecases/usecase.dart';
import 'package:ahiaa/features/shop/category/domain/usecases/get_parent_categories.dart';
import 'package:ahiaa/features/shop/category/domain/usecases/upload_categories.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/dependencies/init_dependencies.dart';
import '../../domain/entities/category.dart';
import '../../domain/usecases/get_all_categories.dart';
import '../../domain/usecases/get_sub_categories.dart';
import '../../services/category_services.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetAllCategories _getAllCategories;
  final GetSubCategories _getSubCategories;
  final UploadCategories _uploadCategories;
  final GetParentCategories _getParentCategories;

  /// Initializes the Bloc with required use cases.
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
    // Register event handlers
    on<CategoryUpload>(_uploadCategory);
    on<GetSubCategory>(_getSubCategory);
    on<GetAllCategory>(_getAllCategory);
    on<GetAllParentCategories>(_getAllParentCategories);
  }

  /// Handles uploading a new category
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
        productCounts: event.productCounts,
      ),
    );

    result.fold(
      (failure) => emit(CategoryFailure(message: failure.message)),
      (category) => emit(CategoryUploadSuccess(categoryModel: category)),
    );
  }

  /// Handles fetching subcategories for a given category
  Future<void> _getSubCategory(
    GetSubCategory event,
    Emitter<CategoryState> emit,
  ) async {
    debugPrint('Fetching subcategories for categoryId: ${event.categoryId}');
    emit(CategoryLoading());

    final result = await _getSubCategories(
      SubCatParams(categoryID: event.categoryId ?? 1),
    );
    final subCategories = serviceLocator<CategoryService>().subCategories;

    result.fold((failure) => emit(CategoryFailure(message: failure.message)), (
      categories,
    ) {
      if (subCategories != categories) {
        // Update shared service with subcategories for external access
        serviceLocator<CategoryService>().updateSubCategories(categories);
      }

      emit(
        CategoriesLoaded(
          parentCategories: serviceLocator<CategoryService>().parentCategories,
          subCategories: categories,
          isLoadingCategories: false,
        ),
      );
    });
  }

  /// Handles fetching all categories
  Future<void> _getAllCategory(
    GetAllCategory event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoading());

    final result = await _getAllCategories(NoParams());

    result.fold((failure) => emit(CategoryFailure(message: failure.message)), (
      categories,
    ) {
      debugPrint('Fetched all categories: $categories');
      emit(
        CategoriesLoaded(
          parentCategories: [],
          subCategories: categories,
          isLoadingCategories: false,
        ),
      );
    });
  }

  /// Handles fetching all parent categories
  Future<void> _getAllParentCategories(
    GetAllParentCategories event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoading());

    final result = await _getParentCategories(NoParams());
    final parentCategories = serviceLocator<CategoryService>().parentCategories;

    result.fold((failure) => emit(CategoryFailure(message: failure.message)), (
      categories,
    ) {
      if (parentCategories != categories) {
        // Update shared service with parent categories for external access
        serviceLocator<CategoryService>().updateParentCategories(categories);
      }

      emit(
        CategoriesLoaded(
          parentCategories: categories,
          subCategories: serviceLocator<CategoryService>().subCategories,
          isLoadingCategories: false,
        ),
      );
    });
  }
}
