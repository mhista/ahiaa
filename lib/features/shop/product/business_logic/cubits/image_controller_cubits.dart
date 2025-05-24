import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/product.dart';

class ProductImageCubit extends Cubit<String?> {
  ProductImageCubit() : super('');

  List<String> getAllProductsImages(Products product) {
    // USE SET TO ADD UNIQUE URL
    Set<String> images = {};

    // LOAD THUMBNAIL IMAGE
    images.add(product.thumbnail);
    // ASSIGN THUMBNAIL AS SELECTED IMAGE
    emit(product.thumbnail);

    // GET ALL IMAGES FROM THE PRODUCT IMAGES
    if (product.images.isNotEmpty) {
      images.addAll(product.images);
    }

    // GET ALL IMAGES FROM PRODUCT VARIATIONS IF NOT NULL
    if (product.productVariations != null ||
        product.productVariations!.isNotEmpty) {
      images.addAll(
        product.productVariations!.map((variation) => variation.image!),
      );
    }

    // LIST OF IMAGAE
    return images.toList();
  }

  void setSelectedImage(String image) {
    emit(image);
  }
}
