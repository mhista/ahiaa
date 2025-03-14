import 'package:ahiaa/core/entities/user.dart';
import 'package:ahiaa/features/shop/brands/data/models/brandmodel.dart';

import '../../../../../core/entities/coupon.dart';
import '../../../brands/domain/entities/brands.dart';
import '../../data/models/product_attributes.dart';
import '../../data/models/product_variations.dart';

class Products {
  final String id;
  final String sellerId;
  final int stock;
  final String sku;
  final double price;
  final double salePrice;
  final String title;
  final DateTime date;
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
  final User? user;

  Products({
    required this.id,
    required this.sellerId,
    required this.stock,
    required this.sku,
    required this.price,
    required this.salePrice,
    required this.title,
    required this.date,
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
    this.user,
  });
}
