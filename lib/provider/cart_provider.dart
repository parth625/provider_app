import 'package:flutter/material.dart';
import 'package:provider_app/task/product.dart';

class CartProvider extends ChangeNotifier {

  final List<Product> _cartItems = [];

  List<Product> getCartItems() => _cartItems;

  int getLength() => _cartItems.length;

  /// Add product to cart
  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  /// Remove product from the cart
  void removeFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }
}
