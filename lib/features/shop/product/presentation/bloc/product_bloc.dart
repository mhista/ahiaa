import 'package:ahiaa/core/usecases/usecase.dart';
import 'package:ahiaa/features/shop/product/domain/entities/product.dart';
import 'package:ahiaa/features/shop/product/domain/usecase/get_all_products.dart';
import 'package:ahiaa/features/shop/product/domain/usecase/get_featured_products.dart';
import 'package:ahiaa/features/shop/product/domain/usecase/get_products_by_brand.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ahiaa/features/shop/product/domain/usecase/upload_product.dart';

import '../../../../../core/entities/coupon.dart';
import '../../../brands/data/models/brandmodel.dart';
import '../../data/models/product_attributes.dart';
import '../../data/models/product_variations.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final UploadProduct _uploadProduct;
  final GetAllProducts _getAllProducts;
  final GetProductsByBrand _getProductsByBrand;
  final GetFeaturedProducts _getFeaturedProducts;

  ProductBloc({
    required UploadProduct uploadProduct,
    required GetAllProducts getAllProducts,
    required GetProductsByBrand getProductsByBrand,
    required GetFeaturedProducts getFeaturedProducts,
  }) : _uploadProduct = uploadProduct,
       _getAllProducts = getAllProducts,
       _getProductsByBrand = getProductsByBrand,
       _getFeaturedProducts = getFeaturedProducts,
       super(ProductInitial()) {
    on<ProductEvent>(
      (event, emit) => ProductLoading(),
    ); // Handles the ProductEvent and emits ProductLoading state
    on<ProductUpload>(
      (event, emit) => uploadProduct,
    ); // Handles the ProductUpload event and calls the uploadProduct function
    on<AllProductsGet>(
      (event, emit) => getAllProducts,
    ); // Handles the AllProductsGet event and calls the getAllProducts function
    on<GetFeatureProducts>(
      (event, emit) => getAllProducts,
    ); // Handles the GetFeatureProducts event and calls the getAllProducts function
    on<GetBrandProducts>(
      (event, emit) => getProductsByBrand,
    ); // Handles the GetBrandProducts event and calls the getProductsByBrand function
  }

  // Uploads a product
  void uploadProduct(ProductUpload event, Emitter<ProductState> emit) async {
    final result = await _uploadProduct(
      ProductParams(
        sellerId: event.sellerId,
        stock: event.stock,
        sku: event.sku,
        price: event.price,
        salePrice: event.salePrice,
        title: event.title,
        thumbnail: event.thumbnail,
        isFeatured: event.isFeatured,
        brand: event.brand,
        description: event.description,
        categoryId: event.categoryId,
        images: event.images,
        productType: event.productType,
        productAttributes: event.productAttributes,
        productVariations: event.productVariations,
        canResale: event.canResale,
        resaleAddedAmount: event.resaleAddedAmount,
        coupon: event.coupon,
      ),
    );

    result.fold(
      (f) => ProductFailed(
        message: f.message,
      ), // Emits ProductFailed state with the error message
      (product) => ProductUploadSuccess(), // Emits ProductUploadSuccess state
    );
  }

  // Retrieves all products
  void getAllProducts(AllProductsGet event, Emitter<ProductState> emit) async {
    final result = await _getAllProducts(NoParams());

    result.fold(
      (f) => ProductFailed(
        message: f.message,
      ), // Emits ProductFailed state with the error message
      (products) => ProductsGetSuccess(
        products: products,
      ), // Emits ProductsGetSuccess state with the retrieved products
    );
  }

  // Retrieves products by brand
  void getAllBrandProducts(
    GetBrandProducts event,
    Emitter<ProductState> emit,
  ) async {
    final result = await _getProductsByBrand(
      BrandProductParams(brandId: event.brandId),
    );

    result.fold(
      (f) => ProductFailed(
        message: f.message,
      ), // Emits ProductFailed state with the error message
      (products) => ProductsGetSuccess(
        products: products,
      ), // Emits ProductsGetSuccess state with the retrieved products
    );
  }

  // Retrieves featured products
  void getAllFeaturedProducts(
    GetFeatureProducts event,
    Emitter<ProductState> emit,
  ) async {
    final result = await _getFeaturedProducts(
      FeaturedProductsParams(useLimit: event.useLimit),
    );

    result.fold(
      (f) => ProductFailed(
        message: f.message,
      ), // Emits ProductFailed state with the error message
      (products) => ProductsGetSuccess(
        products: products,
      ), // Emits ProductsGetSuccess state with the retrieved products
    );
  }
}
