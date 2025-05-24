import 'package:ahiaa/core/usecases/usecase.dart';
import 'package:ahiaa/core/entities/product.dart';
import 'package:ahiaa/features/shop/product/domain/usecase/get_all_products.dart';
import 'package:ahiaa/features/shop/product/domain/usecase/get_featured_products.dart';
import 'package:ahiaa/features/shop/product/domain/usecase/get_products_by_brand.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ahiaa/features/shop/product/domain/usecase/upload_product.dart';

import '../../../../../core/dependencies/init_dependencies.dart';
import '../../../../../core/entities/coupon.dart';
import '../../../brands/data/models/brandmodel.dart';
import '../../data/models/product_attributes.dart';
import '../../data/models/product_variations.dart';
import '../../services/product_services.dart';

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
    on<ProductUpload>(
      uploadAllProduct,
    ); // Handles the ProductUpload event and calls the uploadProduct function
    on<AllProductsGet>(
      getAllTheProducts,
    ); // Handles the AllProductsGet event and calls the getAllProducts function
    on<GetFeatureProducts>(
      getAllTheFeaturedProducts,
    ); // Handles the GetFeatureProducts event and calls the getAllProducts function
    on<GetBrandProducts>(
      getAllTheBrandProducts,
    ); // Handles the GetBrandProducts event and calls the getProductsByBrand function

    add(AllProductsGet());
  }

  // Uploads a product
  Future<void> uploadAllProduct(
    ProductUpload event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading()); // Emits ProductLoading state
    final result = await _uploadProduct(
      ProductParams(
        sellerId: event.sellerId,
        stock: event.stock,
        price: event.price,
        salePrice: event.salePrice,
        title: event.title,
        isFeatured: event.isFeatured,
        brand: event.brand,
        description: event.description,
        categoryId: event.categoryId,
        productType: event.productType,
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
  Future<void> getAllTheProducts(
    AllProductsGet event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading()); // Emits ProductLoading state
    final result = await _getAllProducts(NoParams());

    result.fold(
      (f) => emit(
        ProductFailed(message: f.message),
      ), // Emits ProductFailed state with the error message
      (products) {
        final productServices = serviceLocator<ProductServices>();
        productServices.updateProducts(products);
        emit(
          ProductsGetSuccess(
            products: productServices.products,
            featuredProducts: productServices.featuredProducts,
            brandProducts: productServices.brandProducts,
            storeProducts: productServices.storeProducts,
            categoryProducts: productServices.categoryProducts,
            favProducts: productServices.favProducts,
            recommendedProducts: productServices.recommendedProducts,
            isLoadingProducts: false,
          ),
        );
      }, // Emits ProductsGetSuccess state with the retrieved products
    );
  }

  // Retrieves products by brand
  Future<void> getAllTheBrandProducts(
    GetBrandProducts event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading()); // Emits ProductLoading state
    final result = await _getProductsByBrand(
      BrandProductParams(brandId: event.brandId),
    );

    result.fold(
      (f) => emit(
        ProductFailed(message: f.message),
      ), // Emits ProductFailed state with the error message
      (products) {
        final productServices = serviceLocator<ProductServices>();
        productServices.updateBrandProducts(products);
        emit(
          ProductsGetSuccess(
            products: productServices.products,
            featuredProducts: productServices.featuredProducts,
            brandProducts: productServices.brandProducts,
            storeProducts: productServices.storeProducts,
            categoryProducts: productServices.categoryProducts,
            favProducts: productServices.favProducts,
            recommendedProducts: productServices.recommendedProducts,
            isLoadingProducts: false,
          ),
        );
      }, // Emits ProductsGetSuccess state with the retrieved products
    );
  }

  // Retrieves featured products
  Future<void> getAllTheFeaturedProducts(
    GetFeatureProducts event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading()); // Emits ProductLoading state
    final result = await _getFeaturedProducts(
      FeaturedProductsParams(useLimit: event.useLimit),
    );

    result.fold(
      (f) => emit(
        ProductFailed(message: f.message),
      ), // Emits ProductFailed state with the error message
      (products) {
        final productServices = serviceLocator<ProductServices>();
        productServices.updateFeaturedProducts(products);
        emit(
          ProductsGetSuccess(
            products: productServices.products,
            featuredProducts: productServices.featuredProducts,
            brandProducts: productServices.brandProducts,
            storeProducts: productServices.storeProducts,
            categoryProducts: productServices.categoryProducts,
            favProducts: productServices.favProducts,
            recommendedProducts: productServices.recommendedProducts,
            isLoadingProducts: false,
          ),
        );
      }, // Emits ProductsGetSuccess state with the retrieved products
    );
  }
}
