part of 'category_bloc.dart';

@immutable
abstract class CategoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryUploadSuccess extends CategoryState {
  final Category categoryModel;

  CategoryUploadSuccess({required this.categoryModel});
}

class CategoryFailure extends CategoryState {
  final String message;

  CategoryFailure({required this.message});
}

class CategoryLoading extends CategoryState {}

class CategoriesFetchSuccess extends CategoryState {
  final List<Category> categories;

  CategoriesFetchSuccess({required this.categories});

  @override
  List<Object?> get props => [categories];
}

class ParentCategoriesFetched extends CategoryState {
  final List<Category> categories;

  ParentCategoriesFetched({required this.categories});

  @override
  List<Object?> get props => [categories];
}

class SubCategoriesFetchSuccess extends CategoryState {
  final List<Category> categories;

  SubCategoriesFetchSuccess({required this.categories});

  @override
  List<Object?> get props => [categories];
}
