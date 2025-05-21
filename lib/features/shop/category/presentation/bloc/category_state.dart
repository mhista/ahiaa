part of 'category_bloc.dart';

/// Abstract base class for all Category states.
///
/// It extends [Equatable] for easy comparison of states.
@immutable
abstract class CategoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

/// State emitted when any category-related operation is loading.
class CategoryLoading extends CategoryState {}

/// Initial state when the CategoryBloc is first created.
class CategoryInitial extends CategoryState {}

/// State emitted when a category is successfully uploaded.
class CategoryUploadSuccess extends CategoryState {
  final Category categoryModel;

  CategoryUploadSuccess({required this.categoryModel});

  @override
  List<Object?> get props => [categoryModel];
}

/// State emitted when a category operation fails.
class CategoryFailure extends CategoryState {
  final String message;

  CategoryFailure({required this.message});

  @override
  List<Object?> get props => [message];
}

/// State emitted when categories are successfully fetched.
class CategoriesLoaded extends CategoryState {
  final List<Category> parentCategories;
  final List<Category> subCategories;
  final bool isLoadingCategories;

  CategoriesLoaded({
    required this.parentCategories,
    required this.subCategories,
    required this.isLoadingCategories,
  });

  @override
  List<Object?> get props => [
    parentCategories,
    subCategories,
    isLoadingCategories,
  ];
}
