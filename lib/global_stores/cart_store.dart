import 'package:flutter/material.dart';
import 'package:payment_exercise/models/cart_item.dart';

/// Cart store
class CartStore extends ChangeNotifier {
  final _cartItems = <CartItem>[];

  /// Cart items
  List<CartItem> get cartItems => _cartItems;

  /// Adds a cart item to the cart.
  void addCartItem(CartItem cartItem) {
    _cartItems.add(cartItem);
    notifyListeners();
  }

  /// Adds all cart items to the cart.
  void addAllCartItems(List<CartItem> cartItems) {
    _cartItems
      ..clear()
      ..addAll(cartItems);
    notifyListeners();
  }

  /// Removes a cart item from the cart.
  void removeCartItem(CartItem cartItem) {
    _cartItems.remove(cartItem);
    notifyListeners();
  }
}
