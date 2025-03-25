import 'dart:convert';

import 'package:ahiaa/features/shop/product/domain/entities/product.dart';
import '../../../../../core/entities/coupon.dart';
import '../../../../../core/entities/user.dart';
import '../../../brands/data/models/brandmodel.dart';
import '../../data/models/product_attributes.dart';
import '../../data/models/product_variations.dart';

class ProductModel extends Products {
  ProductModel({
    required super.id,
    required super.stock,
    required super.price,
    required super.title,
    required super.thumbnail,
    required super.productType,
    required super.canResale,
    required super.sku,
    required super.salePrice,
    required super.date,
    required super.isFeatured,
    required super.brand,
    required super.description,
    required super.categoryId,
    required super.images,
    required super.productAttributes,
    required super.productVariations,
    required super.resaleAddedAmount,
    required super.coupon,
    required super.sellerId,
    super.user,
  });
  // final bool useRefNet;

  ProductModel copyWith({
    String? id,
    String? sellerId,
    int? stock,
    String? sku,
    double? price,
    double? salePrice,
    String? title,
    DateTime? date,
    String? thumbnail,
    bool? isFeatured,
    BrandModel? brand,
    String? description,
    String? categoryId,
    List<String>? images,
    String? productType,
    List<ProductAttributeModel>? productAttributes,
    List<ProductVariationModel>? productVariations,
    bool? canResale,
    double? resaleAddedAmount,
    Coupon? coupon,
    User? user,
  }) {
    return ProductModel(
      id: id ?? this.id,
      stock: stock ?? this.stock,
      sku: sku ?? this.sku,
      price: price ?? this.price,
      salePrice: salePrice ?? this.salePrice,
      title: title ?? this.title,
      date: date ?? this.date,
      thumbnail: thumbnail ?? this.thumbnail,
      isFeatured: isFeatured ?? this.isFeatured,
      brand: brand ?? this.brand,
      description: description ?? this.description,
      categoryId: categoryId ?? this.categoryId,
      images: images ?? this.images,
      productType: productType ?? this.productType,
      productAttributes: productAttributes ?? this.productAttributes,
      productVariations: productVariations ?? this.productVariations,
      canResale: canResale ?? this.canResale,
      resaleAddedAmount: resaleAddedAmount ?? this.resaleAddedAmount,
      coupon: coupon ?? this.coupon,
      sellerId: sellerId ?? this.sellerId,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'seller_id': id});
    result.addAll({'stock': stock});
    result.addAll({'sku': sku});
    result.addAll({'price': price});
    result.addAll({'sale_price': salePrice});
    result.addAll({'title': title});
    result.addAll({'date': date.toIso8601String()});
    result.addAll({'thumbnail': thumbnail});
    result.addAll({'is_featured': isFeatured});
    result.addAll({'brand': brand.toMap()});
    result.addAll({'description': description});
    result.addAll({'category_id': categoryId});
    result.addAll({'images': images});
    result.addAll({'product_type': productType});
    result.addAll({
      'product_attributes': productAttributes.map((x) => x.toMap()).toList(),
    });
    result.addAll({
      'product_variations': productVariations.map((x) => x.toMap()).toList(),
    });
    result.addAll({'can_resale': canResale});
    result.addAll({'resale_added_amount': resaleAddedAmount});
    result.addAll({'coupon': coupon.toMap()});

    return result;
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] ?? '',
      sellerId: map['seller_id'] ?? '',
      stock: map['stock']?.toInt() ?? 0,
      sku: map['sku'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      salePrice: map['sale_price']?.toDouble() ?? 0.0,
      title: map['title'] ?? '',
      date: map['date'] == null ? DateTime.now() : DateTime.parse(map['date']),
      thumbnail: map['thumbnail'] ?? '',
      isFeatured: map['is_featured'] ?? false,
      brand: BrandModel.fromMap(map['brand'] ?? BrandModel.empty()),
      description: map['description'] ?? '',
      categoryId: map['category_id'] ?? '',
      images: List<String>.from(map['images'] ?? []),
      productType: map['product_type'] ?? '',
      productAttributes: List<ProductAttributeModel>.from(
        map['product_attributes']?.map((x) => ProductAttributeModel.fromMap(x)),
      ),
      productVariations: List<ProductVariationModel>.from(
        map['product_variations']?.map((x) => ProductVariationModel.fromMap(x)),
      ),
      canResale: map['can_resale'] ?? false,
      resaleAddedAmount: map['resale_added_amount']?.toDouble() ?? 0.0,
      coupon: Coupon.fromMap(map['coupon']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Products(id: $id, stock: $stock, sku: $sku, price: $price, salePrice: $salePrice, title: $title, date: $date, thumbnail: $thumbnail, isFeatured: $isFeatured, brand: $brand, description: $description, categoryId: $categoryId, images: $images, productType: $productType, productAttributes: $productAttributes, productVariations: $productVariations, canResale: $canResale, resaleAddedAmount: $resaleAddedAmount, coupon: $coupon)';
  }
}
