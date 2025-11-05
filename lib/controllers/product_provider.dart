import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/product_service.dart';
import '../core/utils/logger.dart';

class ProductProvider with ChangeNotifier {
  final ProductService _productService = ProductService();

  List<Product> products = [];
  bool isLoading = false;
  String? errorMessage;

  List<Product> get product => products;
  bool get isLoadings => isLoading;
  String? get errorMessages => errorMessage;

  Future<void> loadProducts() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      products = await _productService.fetchProducts();
    } catch (e) {
      errorMessage = e.toString();
      AppLogger.error("Failed loading products", error: errorMessage);
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> addProduct(Product product) async {
    try {
      final addedProduct = await _productService.addProduct(product);
      products.add(addedProduct);
      notifyListeners();
    } catch (e) {
      AppLogger.error("Add product failed", error: e);
    }
  }

  Future<void> updateProduct(int id, Product updatedProduct) async {
    try {
      final updated = await _productService.updateProduct(id, updatedProduct);
      final index = products.indexWhere((p) => p.id == id);
      if (index != -1) {
        products[index] = updated;
        notifyListeners();
      }
    } catch (e) {
      AppLogger.error("Update failed", error: e);
    }
  }

  Future<void> deleteProduct(int id) async {
    try {
      await _productService.deleteProduct(id);
      products.removeWhere((p) => p.id == id);
      notifyListeners();
    } catch (e) {
      AppLogger.error("Delete failed", error: e);
    }
  }
}
