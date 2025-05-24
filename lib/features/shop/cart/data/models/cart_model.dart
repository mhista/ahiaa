import 'dart:convert';

import '../../domain/entities/cart.dart';

class CartItemModel extends Cart {
  CartItemModel({
    required super.id,
    required super.quantity,
    super.title = '',
    super.price = 0.0,
    super.image,
    super.variationId = '',
    super.brandName,
    super.selectedVariation,
  });

  CartItemModel copyWith({
    String? id,
    String? title,
    double? price,
    String? image,
    int? quantity,
    String? variationId,
    String? brandName,
    Map<String, String>? selectedVariation,
  }) {
    return CartItemModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
      variationId: variationId ?? this.variationId,
      brandName: brandName ?? this.brandName,
      selectedVariation: selectedVariation ?? this.selectedVariation,
    );
  }

  static CartItemModel empty() => CartItemModel(
    id: '',
    title: '',
    price: 0.0,
    quantity: 0,
    variationId: '',
  );
  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'price': price});
    if (image != null) {
      result.addAll({'image': image});
    }
    result.addAll({'quantity': quantity});
    result.addAll({'variation_id': variationId});
    if (brandName != null) {
      result.addAll({'brand_name': brandName});
    }
    if (selectedVariation != null) {
      result.addAll({'selected_variation': selectedVariation});
    } else {
      result.addAll({'selected_variation': {}});
    }

    return result;
  }

  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      image: map['image'],
      quantity: map['quantity']?.toInt() ?? 0,
      variationId: map['variation_id'] ?? '',
      brandName: map['brand_name'],
      selectedVariation: Map<String, String>.from(
        map['selected_variation'] ?? {},
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItemModel.fromJson(String source) =>
      CartItemModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CartItemModel(id: $id, title: $title, price: $price, image: $image, quantity: $quantity, variationId: $variationId, brandName: $brandName, selectedVariation: $selectedVariation)';
  }
}
