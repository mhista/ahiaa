part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductUploadSuccess extends ProductState {}

class ProductsGetSuccess extends ProductState {
  final List<Products> products;

  ProductsGetSuccess({required this.products});
}

class ProductFailed extends ProductState {
  final String message;

  ProductFailed({required this.message});
}

class ProductLoading extends ProductState {}
