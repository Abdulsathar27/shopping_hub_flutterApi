import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../models/product.dart';
import '../core/network/dio_client.dart';
import '../core/network/api_endpoints.dart';
import '../core/utils/logger.dart';

class ProductProvider with ChangeNotifier {
  final DioClient dioClient = DioClient();

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
      final response = await dioClient.dio.get(ApiEndpoints.products);
      final List data = response.data;

      products = data.map((json) => Product.fromJson(json)).toList();
      AppLogger.success("Products loaded successfully");
    } on DioException catch (e) {
      errorMessage = dioClient.handleError(e).toString();
      AppLogger.error("Failed loading products", error: errorMessage);
    } catch (e) {
      errorMessage = "Unexpected error: $e";
      AppLogger.error("Unexpected failure", error: e);
    }

    isLoading = false;
    notifyListeners();
  }

  
  Future<void> addProduct(Product product) async {
    try {
      final response = await dioClient.dio.post(
        ApiEndpoints.products,
        data: product.toJson(),
      );

      final addedProduct = Product.fromJson(response.data);
      products.add(addedProduct);

      AppLogger.success("Product added successfully");
      notifyListeners();
    } on DioException catch (e) {
      AppLogger.error("Add product failed", error: dioClient.handleError(e));
    }
  }

  
  Future<void> updateProduct(int id, Product updatedProduct) async {
    try {
      final response = await dioClient.dio.put(
        "${ApiEndpoints.productById}$id",
        data: updatedProduct.toJson(),
      );

      final updated = Product.fromJson(response.data);
      final index = products.indexWhere((p) => p.id == id);
      if (index != -1) {
        products[index] = updated;
        notifyListeners();
      }

      AppLogger.success("Product updated");
    } on DioException catch (e) {
      AppLogger.error("Update failed", error: dioClient.handleError(e));
    }
  }

  
  Future<void> deleteProduct(int id) async {
    try {
      await dioClient.dio.delete("${ApiEndpoints.productById}$id");
      products.removeWhere((p) => p.id == id);
      notifyListeners();
      AppLogger.success("Product deleted");
    } on DioException catch (e) {
      AppLogger.error("Delete failed", error: dioClient.handleError(e));
    }
  }
}
