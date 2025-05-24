part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
  @override
  List<Object?> get props => [];
}

class LoadCart extends CartEvent {}

class AddToCart extends CartEvent {
  final Products product;
  final int quantity;
  const AddToCart(this.product, this.quantity);
}

class AddItem extends CartEvent {
  final CartItemModel item;
  const AddItem(this.item);
}

class RemoveItem extends CartEvent {
  final CartItemModel item;
  const RemoveItem(this.item);
}

class ClearCart extends CartEvent {}

class UpdateProductQuantity extends CartEvent {
  final Products product;
  const UpdateProductQuantity(this.product);
}

class UpdateCartItemCount extends CartEvent {
  final bool isIncrease;
  const UpdateCartItemCount({required this.isIncrease});
}

class GetCartItemList extends CartEvent {}
