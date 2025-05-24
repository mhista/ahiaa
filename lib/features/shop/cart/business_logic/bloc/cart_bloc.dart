import 'package:ahiaa/core/entities/product.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/dependencies/init_dependencies.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../product/business_logic/cubits/product_attribute_service/product_variation_cubit.dart';
import '../../data/models/cart_model.dart';
import '../cubit/cart_service.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final _variationController = serviceLocator<VariationCubit>();
  final _cartService = serviceLocator<CartService>();

  CartBloc() : super(CartInitial()) {
    on<LoadCart>(_onLoadCart);
    on<AddToCart>(_onAddToCart);
    on<AddItem>(_onAddItem);
    on<RemoveItem>(_onRemoveItem);
    on<ClearCart>(_onClearCart);
    on<UpdateProductQuantity>(_onUpdateProductQuantity);
    on<UpdateCartItemCount>(_updateCartItemCount);
    on<GetCartItemList>(getCartItemList);
    add(LoadCart());
  }

  void _updateCartItemCount(
    UpdateCartItemCount event,
    Emitter<CartState> emit,
  ) {
    emit(CartLoading());
    if (event.isIncrease) {
      int itemCount = _cartService.addItemQuantityToUpdate(1);
      emit(CartItemCountUpdated(itemCount: itemCount));
    } else {
      int itemCount = _cartService.subtractItemQuantityToUpdate(1);
      if (itemCount == 0) {
        emit(CartItemCountUpdated(itemCount: itemCount));

        emit(
          CartList(
            list: _cartService.cartItems,
            totalPrice: _cartService.cartTotalPrice,
            totalItems: _cartService.cartItemsCount,
          ),
        );
      } else {
        emit(CartItemCountUpdated(itemCount: itemCount));
      }
    }
  }

  void getCartItemList(GetCartItemList event, Emitter<CartState> emit) {
    emit(CartLoading());
    emit(
      CartList(
        list: _cartService.cartItems,
        totalPrice: _cartService.cartTotalPrice,
        totalItems: _cartService.cartItemsCount,
      ),
    );
  }

  void _onLoadCart(LoadCart event, Emitter<CartState> emit) {
    emit(CartLoading());
    _cartService.loadCartItems();
    emit(
      CartList(
        list: _cartService.cartItems,
        totalPrice: _cartService.cartTotalPrice,
        totalItems: _cartService.cartItemsCount,
      ),
    );
    emit(
      CartList(
        list: _cartService.cartItems,
        totalPrice: _cartService.cartTotalPrice,
        totalItems: _cartService.cartItemsCount,
      ),
    );
    emit(CartItemCountUpdated(itemCount: 0));
  }

  void _onAddToCart(AddToCart event, Emitter<CartState> emit) {
    emit(CartLoading());

    final product = event.product;
    final quantity = event.quantity;

    // if (quantity < 1) {
    //   emit(CartError(message: 'Quantity must be greater than 0'));
    //   return;
    // }

    if (product.productType == ProductType.variable.name &&
        _variationController.state.selectedVariation.id.isEmpty) {
      emit(CartError(message: 'Please select a variation'));
      return;
    }

    if (product.productType == ProductType.variable.name) {
      if (_variationController.state.selectedVariation.stock < 1) {
        emit(CartError(message: 'Selected variation is out of stock'));
        return;
      }
    } else if (product.stock < 1) {
      emit(CartError(message: 'Product is out of stock'));
      return;
    }

    final newItem = _cartService.convertProductToCartItem(product, quantity);
    final inCart = _cartService.addItemToCart(newItem);
    _updateCartStorageAndEmitStates(
      emit: emit,
      inCart: inCart,
      message: 'Item added to cart successfully',
    );
  }

  void _onAddItem(AddItem event, Emitter<CartState> emit) {
    emit(CartLoading());

    final inCart = _cartService.addItemToCart(event.item);
    _updateCartStorageAndEmitStates(
      emit: emit,
      inCart: inCart,
      message: 'Item added to cart successfully',
    );
  }

  void _onRemoveItem(RemoveItem event, Emitter<CartState> emit) {
    emit(CartLoading());

    final inCart = _cartService.removeItemFromCart(event.item);
    _updateCartStorageAndEmitStates(
      emit: emit,
      inCart: inCart,
      message: 'Item removed from cart successfully',
    );
  }

  void _onClearCart(ClearCart event, Emitter<CartState> emit) {
    emit(CartLoading());

    _cartService.clearCart();
    emit(CartSuccess(message: 'Cart cleared successfully'));
    emit(
      CartList(
        list: _cartService.cartItems,
        totalPrice: _cartService.cartTotalPrice,
        totalItems: _cartService.cartItemsCount,
      ),
    );
    _updateCartStorageAndEmitStates(
      emit: emit,
      inCart: false,
      message: 'Cart cleared successfully',
    );
  }

  void _onUpdateProductQuantity(
    UpdateProductQuantity event,
    Emitter<CartState> emit,
  ) {
    emit(CartLoading());

    final product = event.product;
    _cartService.updateAlreadyAddedProductInCart(product);
    _updateCartStorageAndEmitStates(
      emit: emit,
      inCart: true,
      message: 'Item quantity updated successfully',
    );
  }

  // helper to emit states
  void _updateCartStorageAndEmitStates({
    required Emitter<CartState> emit,
    required bool inCart,
    required String message,
  }) {
    // Emit required states
    emit(CartSuccess(message: message));
    emit(ProductInCart(isInCart: inCart));
    emit(CartItemCountUpdated(itemCount: _cartService.itemQuantityToUpdate));
    emit(
      CartList(
        list: _cartService.cartItems,
        totalPrice: _cartService.cartTotalPrice,
        totalItems: _cartService.cartItemsCount,
      ),
    );
  }
}
