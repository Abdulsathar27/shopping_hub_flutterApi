import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final Map<int, CartItem> items = {};

  Map<int, CartItem> get itemss => items;

  int get itemCount => items.length;

  
  double get totalPrice {
    double total = 0.0;
    items.forEach((key, item) {
      total += item.product.price * item.quantity;
    });
    return total;
  }

  
  void addToCart(Product product) {
    if (items.containsKey(product.id)) {
      items[product.id]!.quantity++;
    } else {
      items[product.id] = CartItem(
        product: product,
        quantity: 1,
      );
    }
    notifyListeners();
  }

 
  void removeFromCart(int id) {
    items.remove(id);
    notifyListeners();
  }

  
  void increaseQuantity(int id) {
    if (items.containsKey(id)) {
      items[id]!.quantity++;
      notifyListeners();
    }
  }

  
  void decreaseQuantity(int id) {
    if (!items.containsKey(id)) return;

    if (items[id]!.quantity > 1) {
      items[id]!.quantity--;
    } else {
      items.remove(id);
    }
    notifyListeners();
  }

 
  void clearCart() {
    items.clear();
    notifyListeners();
  }
}


class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });
}
