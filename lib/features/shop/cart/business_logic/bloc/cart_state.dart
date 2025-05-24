part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {
  const CartInitial();
}

class CartList extends CartState {
  final List<CartItemModel> list;
  final int totalItems;
  final double totalPrice;

  const CartList({
    this.list = const [],
    this.totalItems = 0,
    this.totalPrice = 0.0,
  });

  CartList copyWith({
    List<CartItemModel>? list,
    int? totalItems,
    double? totalPrice,
  }) {
    return CartList(
      list: list ?? this.list,
      totalItems: totalItems ?? this.totalItems,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  @override
  List<Object> get props => [list, totalItems, totalPrice];
}

class CartError extends CartState {
  final String message;

  const CartError({required this.message});

  @override
  List<Object> get props => [message];
}

class CartSuccess extends CartState {
  final String message;

  const CartSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class CartLoading extends CartState {
  const CartLoading();
}

class CartItemCountUpdated extends CartState {
  final int itemCount;

  const CartItemCountUpdated({required this.itemCount});

  @override
  List<Object> get props => [itemCount];
}

class ProductInCart extends CartState {
  final bool isInCart;

  const ProductInCart({required this.isInCart});

  @override
  List<Object> get props => [isInCart];
}
