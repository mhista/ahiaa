part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {
  const ProductEvent();
}

final class ProductUpload extends ProductEvent {
  final String sellerId;
  final int stock;
  final String sku;
  final double price;
  final double salePrice;
  final String title;
  final String thumbnail;
  final bool isFeatured;
  final BrandModel brand;
  final String description;
  final String categoryId;
  final List<String> images;
  final String productType;
  final List<ProductAttributeModel> productAttributes;
  final List<ProductVariationModel> productVariations;
  final bool canResale;
  final double resaleAddedAmount;
  final Coupon coupon;

  const ProductUpload({
    required this.sellerId,
    required this.stock,
    required this.sku,
    required this.price,
    required this.salePrice,
    required this.title,
    required this.thumbnail,
    required this.isFeatured,
    required this.brand,
    required this.description,
    required this.categoryId,
    required this.images,
    required this.productType,
    required this.productAttributes,
    required this.productVariations,
    required this.canResale,
    required this.resaleAddedAmount,
    required this.coupon,
  });
}

final class ProductFetch extends ProductEvent {}
