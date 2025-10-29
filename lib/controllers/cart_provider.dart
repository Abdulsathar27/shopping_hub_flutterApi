import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final Map<int, CartItem> _items = {};

  Map<int, CartItem> get items => _items;

  int get itemCount => _items.length;

  /// Total cart price
  double get totalPrice {
    double total = 0.0;
    _items.forEach((key, item) {
      total += item.product.price * item.quantity;
    });
    return total;
  }

  /// Add product to cart
  void addToCart(Product product) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity++;
    } else {
      _items[product.id] = CartItem(
        product: product,
        quantity: 1,
      );
    }
    notifyListeners();
  }

  /// Remove a product from cart completely
  void removeFromCart(int id) {
    _items.remove(id);
    notifyListeners();
  }

  /// Increase quantity
  void increaseQuantity(int id) {
    if (_items.containsKey(id)) {
      _items[id]!.quantity++;
      notifyListeners();
    }
  }

  /// Decrease quantity
  void decreaseQuantity(int id) {
    if (!_items.containsKey(id)) return;

    if (_items[id]!.quantity > 1) {
      _items[id]!.quantity--;
    } else {
      _items.remove(id);
    }
    notifyListeners();
  }

  /// Clear entire cart
  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}

/// Cart item model for cart state
class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });
}
