import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../models/product.dart';
import '../core/network/dio_client.dart';
import '../core/network/api_endpoints.dart';
import '../core/utils/logger.dart';

class ProductProvider with ChangeNotifier {
  final DioClient _dioClient = DioClient();

  List<Product> _products = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  /// Fetch all products from FakeStore API
  Future<void> loadProducts() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _dioClient.dio.get(ApiEndpoints.products);
      final List data = response.data;

      _products = data.map((json) => Product.fromJson(json)).toList();
      AppLogger.success("Products loaded successfully");
    } on DioException catch (e) {
      _errorMessage = _dioClient.handleError(e).toString();
      AppLogger.error("Failed loading products", error: _errorMessage);
    } catch (e) {
      _errorMessage = "Unexpected error: $e";
      AppLogger.error("Unexpected failure", error: e);
    }

    _isLoading = false;
    notifyListeners();
  }

  /// Add a new product (FakeStore allows mock POST)
  Future<void> addProduct(Product product) async {
    try {
      final response = await _dioClient.dio.post(
        ApiEndpoints.products,
        data: product.toJson(),
      );

      final addedProduct = Product.fromJson(response.data);
      _products.add(addedProduct);

      AppLogger.success("Product added successfully");
      notifyListeners();
    } on DioException catch (e) {
      AppLogger.error("Add product failed", error: _dioClient.handleError(e));
    }
  }

  /// Update product by ID
  Future<void> updateProduct(int id, Product updatedProduct) async {
    try {
      final response = await _dioClient.dio.put(
        "${ApiEndpoints.productById}$id",
        data: updatedProduct.toJson(),
      );

      final updated = Product.fromJson(response.data);
      final index = _products.indexWhere((p) => p.id == id);
      if (index != -1) {
        _products[index] = updated;
        notifyListeners();
      }

      AppLogger.success("Product updated");
    } on DioException catch (e) {
      AppLogger.error("Update failed", error: _dioClient.handleError(e));
    }
  }

  /// Delete product by ID
  Future<void> deleteProduct(int id) async {
    try {
      await _dioClient.dio.delete("${ApiEndpoints.productById}$id");
      _products.removeWhere((p) => p.id == id);
      notifyListeners();
      AppLogger.success("Product deleted");
    } on DioException catch (e) {
      AppLogger.error("Delete failed", error: _dioClient.handleError(e));
    }
  }
}
