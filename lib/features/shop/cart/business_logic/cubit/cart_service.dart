import 'dart:convert';

import 'package:ahiaa/core/entities/product.dart';
import 'package:ahiaa/features/shop/cart/data/models/cart_model.dart';
import 'package:ahiaa/utils/constants/enums.dart';
import 'package:flutter/material.dart';

import '../../../../../core/dependencies/init_dependencies.dart';
import '../../../../../utils/local_storage/storage_utility.dart';
import '../../../product/business_logic/cubits/product_attribute_service/product_variation_cubit.dart';

/// A service class responsible for managing cart logic including
/// adding, removing, and retrieving items from the shopping cart.
class CartService {
  // instance of variation controller
  final variationController = serviceLocator<VariationCubit>();

  // Internal counter for total items in cart
  int _cartItemsCount = 0;

  // Total price of all items in the cart
  double _cartTotalPrice = 0.0;

  // Quantity of a specific item in the cart
  int _itemQuantityToUpdate = 0;

  // Internal list to hold the cart items
  final List<CartItemModel> _cartItems = [];

  // Getters to expose private fields
  int get cartItemsCount => _cartItemsCount;
  double get cartTotalPrice => _cartTotalPrice;
  List<CartItemModel> get cartItems => _cartItems;
  int get itemQuantityToUpdate => _itemQuantityToUpdate;

  /// Public method to save the current cart items into local storage
  void addItemsToCartStorage() => _addItemsToCartStorage();

  // check if item is in cart
  bool isItemInCart(String productId) {
    return _cartItems.any((item) => item.id == productId);
  }

  // Public method to update item quantity in cart
  void setItemQuantityToUpdate(int value) {
    _itemQuantityToUpdate = value;
  }

  // add item quantity in cart
  int addItemQuantityToUpdate(int value) {
    _itemQuantityToUpdate += value;
    return _itemQuantityToUpdate;
  }

  // subtract item quantity in cart
  int subtractItemQuantityToUpdate(int value) {
    if (_itemQuantityToUpdate <= 0) {
      return 0;
    }
    _itemQuantityToUpdate -= value;
    return _itemQuantityToUpdate;
  }

  /// Removes the specified item or reduces its quantity in the cart.
  /// If quantity reaches zero or less, it is removed entirely.
  bool removeItemFromCart(CartItemModel item) {
    int index = _cartItems.indexWhere((i) => i.id == item.id);
    if (index != -1) {
      _cartItems[index].quantity -= 1;

      // Remove item if quantity is zero or less
      if (_cartItems[index].quantity <= 0) {
        _cartItems.removeAt(index);
        _updateCart(); // Refresh cart
        return false;
      }
    }
    _updateCart(); // Refresh cart
    return true;
  }

  // remove item from cart
  bool removeItemEntirelyFromCart(String productId) {
    int index = _cartItems.indexWhere((i) => i.id == productId);
    if (index != -1) {
      _cartItems.removeAt(index);
    }
    debugPrint('Item removed from cart: $productId');
    _updateCart(); // Refresh cart
    return false;
  }

  /// Adds an item to the cart.
  /// If the item already exists, increment its quantity.
  /// Otherwise, add the item to the cart.
  bool addItemToCart(CartItemModel item) {
    int index = _cartItems.indexWhere((i) => i.id == item.id);
    if (index != -1) {
      // Item already in cart; update its quantity
      _cartItems[index].quantity += 1;
    } else {
      // New item; add to cart
      _cartItems.add(item);
    }
    debugPrint('Item added to cart: ${item.title}, Quantity: ${item.quantity}');
    debugPrint(
      'Cart items count: $_cartItemsCount, Total price: $_cartTotalPrice , Item quantity: ${_cartItems.length}',
    );
    _updateCart(); // Refresh cart totals and storage

    return true;
  }

  CartItemModel convertProductToCartItem(Products product, int quantity) {
    if (product.productType == ProductType.single.name) {
      // RESET VARIATION IN CASE OF SINGLE PODUCT TYPE ,
      variationController.resetSelectedAttributes();
    }

    final variation = variationController.state.selectedVariation;
    final isVariation = variation.id.isNotEmpty;

    final price =
        isVariation
            ? variation.salePrice! > 0.0
                ? variation.salePrice
                : variation.price
            : product.salePrice! > 0.0
            ? product.salePrice
            : product.price;
    debugPrint(
      'Product Price: ${product.price}, Sale Price: ${product.salePrice}, Variation Price: ${variation.price}, Variation Sale Price: ${variation.salePrice}',
    );
    return CartItemModel(
      id: product.id,
      quantity: quantity,
      price: price!,
      variationId: variation.id,
      title: product.title,
      image: isVariation ? variation.image : product.thumbnail,
      brandName: product.brand != null ? product.brand!.name : '',
      selectedVariation: isVariation ? variation.attributeValues : null,
    );
  }

  /// Updates the quantity of a product already in the cart,
  /// considering its type (single or variable).
  void updateAlreadyAddedProductInCart(Products product) {
    if (product.productType == ProductType.single.name) {
      // For single product, just count total by product ID
      setItemQuantityToUpdate(getItemCountInCart(product.id));
    } else {
      final variationId = variationController.state.selectedVariation.id;
      if (variationId.isNotEmpty) {
        setItemQuantityToUpdate(
          getVariationQuantityInCart(product.id, variationId),
        );
      } else {
        setItemQuantityToUpdate(0);
      }
    }
  }

  /// Calculates and updates total item count and price of the cart.
  void updateCartTotals() {
    _cartItemsCount = _cartItems.fold(
      0,
      (total, item) => total + item.quantity,
    );
    _cartTotalPrice = _cartItems.fold(
      0.0,
      (total, item) => total + (item.price * item.quantity),
    );
  }

  /// Retrieves list of cart items as string representation.
  /// Placeholder for future expansion.
  List<String> getCartItems() {
    return [];
  }

  /// Loads previously saved cart items from local storage.
  void loadCartItems() {
    clearCart(); // Reset cart before loading
    final rawItems = PLocalStorage.instance().getData<String>('cartItems');

    if (rawItems != null) {
      List<dynamic> decodedItems = jsonDecode(rawItems);
      _cartItems.addAll(
        decodedItems.map((e) => CartItemModel.fromMap(e)).toList(),
      );
      _cartItemsCount = _cartItems.length;
      _cartTotalPrice = _cartItems.fold(
        0.0,
        (total, item) => total + (item.price * item.quantity),
      );
    } else {
      return;
    }
  }

  /// Gets the total quantity of a product regardless of its variations.
  int getItemCountInCart(String productId) {
    final foundItem = cartItems
        .where((item) => item.id == productId)
        .fold(0, (previous, item) => previous + item.quantity);
    return foundItem;
  }

  /// Gets the quantity of a product considering its variation.
  int getVariationQuantityInCart(String productId, String variationId) {
    final foundItem = cartItems.firstWhere(
      (item) => item.id == productId && item.variationId == variationId,
      orElse: () => CartItemModel.empty(),
    );
    return foundItem.quantity;
  }

  /// Internal method to persist cart items to local storage.
  void _addItemsToCartStorage() {
    final List<Map<String, dynamic>> mappedItems =
        _cartItems.map((e) => e.toMap()).toList();
    final String encodedItems = jsonEncode(mappedItems);

    PLocalStorage.instance().saveData('cartItems', encodedItems);
  }

  /// Internal method to update cart values and persist to storage.
  void _updateCart() {
    updateCartTotals(); // Update total count and price
    _addItemsToCartStorage(); // Save cart to storage
    _itemQuantityToUpdate = 0; // Reset item quantity
  }

  /// Clears all items from the cart and resets total counters.
  void clearCart() {
    _cartItems.clear();
    _cartItemsCount = 0;
    _cartTotalPrice = 0.0;
  }
}
