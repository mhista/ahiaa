part of 'category_bloc.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryUploadSuccess extends CategoryState {}

class CategoryFailure extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoriesFetchSuccess extends CategoryState {}
