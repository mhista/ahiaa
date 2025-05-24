part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductUploadSuccess extends ProductState {}

class ProductsGetSuccess extends ProductState {
  final List<Products> products;
  final List<Products> featuredProducts;
  final List<Products> brandProducts;
  final List<Products> storeProducts;
  final List<Products> categoryProducts;
  final List<Products> favProducts;
  final List<Products> recommendedProducts;
  final bool isLoadingProducts;

  ProductsGetSuccess({
    required this.products,
    required this.featuredProducts,
    required this.brandProducts,
    required this.storeProducts,
    required this.categoryProducts,
    required this.favProducts,
    required this.recommendedProducts,
    required this.isLoadingProducts,
  });
}

class ProductFailed extends ProductState {
  final String message;

  ProductFailed({required this.message});
}

class ProductLoading extends ProductState {}
