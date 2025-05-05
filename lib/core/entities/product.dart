import 'package:ahiaa/core/entities/user.dart';
import 'package:ahiaa/features/shop/brands/data/models/brandmodel.dart';

import '../../features/shop/brands/domain/entities/brands.dart';
import '../../features/shop/product/data/models/product_attributes.dart';
import '../../features/shop/product/data/models/product_variations.dart';
import 'coupon.dart';

class Products {
  final String id;
  final String sellerId;
  final int stock;
  final String? sku;
  final double price;
  final double? salePrice;
  final String title;
  final DateTime date;
  final String thumbnail;
  final bool? isFeatured;
  final BrandModel? brand;
  final String description;
  final String categoryId;
  final List<String> subCategories;

  final List<String> images;
  final String productType;
  final List<ProductAttributeModel>? productAttributes;
  final List<ProductVariationModel>? productVariations;
  final bool? canResale;
  final double? resaleAddedAmount;
  final Coupon? coupon;
  final User? user;
  Products({
    required this.id,
    required this.sellerId,
    required this.stock,
    this.sku,
    required this.price,
    this.salePrice,
    required this.title,
    required this.date,
    required this.thumbnail,
    this.isFeatured,
    this.brand,
    required this.description,
    required this.categoryId,
    required this.subCategories,
    required this.images,
    required this.productType,
    this.productAttributes,
    this.productVariations,
    this.canResale,
    this.resaleAddedAmount,
    this.coupon,
    this.user,
  });
}
