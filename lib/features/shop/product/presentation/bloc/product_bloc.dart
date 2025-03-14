import 'package:ahiaa/core/usecases/usecase.dart';
import 'package:ahiaa/features/shop/product/domain/entities/product.dart';
import 'package:ahiaa/features/shop/product/domain/usecase/get_all_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ahiaa/features/shop/product/domain/usecase/upload_product.dart';

import '../../../../../core/entities/coupon.dart';
import '../../../brands/domain/entities/brands.dart';
import '../../data/models/product_attributes.dart';
import '../../data/models/product_variations.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final UploadProduct _uploadProduct;
  final GetAllProducts _getAllProducts;
  ProductBloc({
    required UploadProduct uploadProduct,
    required GetAllProducts getAllProducts,
  }) : _uploadProduct = uploadProduct,
       _getAllProducts = getAllProducts,
       super(ProductInitial()) {
    on<ProductEvent>((event, emit) => ProductLoading());
    on<ProductUpload>((event, emit) => uploadProduct);
    on<ProductEvent>((event, emit) => getAllProducts);
  }

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
      (f) => ProductFailed(message: f.message),
      (product) => ProductUploadSuccess(),
    );
  }

  void getAllProducts(ProductEvent event, Emitter<ProductState> emit) async {
    final result = await _getAllProducts(NoParams());

    result.fold(
      (f) => ProductFailed(message: f.message),
      (products) => ProductsGetSuccess(products: products),
    );
  }
}
