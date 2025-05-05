part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {
  const ProductEvent();
}

final class ProductUpload extends ProductEvent {
  final String sellerId;
  final int stock;
  final String? sku;
  final double price;
  final double? salePrice;
  final String title;
  final bool? isFeatured;
  final BrandModel? brand;
  final String description;
  final String categoryId;
  final String productType;
  final bool? canResale;
  final double? resaleAddedAmount;
  final Coupon? coupon;

  const ProductUpload({
    required this.sellerId,
    required this.stock,
    this.sku,
    required this.price,
    this.salePrice,
    required this.title,
    this.isFeatured,
    this.brand,
    required this.description,
    required this.categoryId,
    required this.productType,
    this.canResale,
    this.resaleAddedAmount,
    this.coupon,
  });
}

final class AllProductsGet extends ProductEvent {}

final class GetFeatureProducts extends ProductEvent {
  final bool useLimit;

  const GetFeatureProducts({this.useLimit = true});
}

final class GetBrandProducts extends ProductEvent {
  final String brandId;

  const GetBrandProducts({required this.brandId});
}

final class GetFavProducts extends ProductEvent {}

final class GetStoreProducts extends ProductEvent {}

final class GetCategoryProducts extends ProductEvent {}
