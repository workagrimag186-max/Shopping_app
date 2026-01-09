import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/cart_item.dart';

class CartProvider with ChangeNotifier {
  // Using a Map where the Key is the Product ID
  final Map<String, CartItem> _items = {};

  List<CartItem> get items => _items.values.toList();

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.product.price * cartItem.quantity;
    });
    return total;
  }

  int get itemCount => _items.length; // Number of unique items

  void clearCart() {
  _items.clear();
  notifyListeners();
}



  void addToCart(Product product) {
    if (_items.containsKey(product.id)) {
      // If item exists, just increase quantity
      _items.update(
        product.id,
        (existingItem) => CartItem(
          product: existingItem.product,
          quantity: existingItem.quantity + 1,
        ),
      );
    } else {
      // If item is new, add it to the map
      _items.putIfAbsent(
        product.id,
        () => CartItem(product: product),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }
}