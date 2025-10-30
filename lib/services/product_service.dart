import 'package:dio/dio.dart';
import '../models/product.dart';
import '../core/network/dio_client.dart';
import '../core/network/api_endpoints.dart';
import '../core/utils/app_exceptions.dart';
import '../core/utils/logger.dart';

class ProductService {
  final DioClient dioClient = DioClient();

  /// Fetch all products from FakeStore API
  Future<List<Product>> fetchProducts() async {
    try {
      final response = await dioClient.dio.get(ApiEndpoints.products);
      final List data = response.data;
      return data.map((json) => Product.fromJson(json)).toList();
    } on DioException catch (e) {
      throw dioClient.handleError(e);
    } catch (e) {
      throw FetchDataException("Unexpected error: $e");
    }
  }

  /// Add product
  Future<Product> addProduct(Product product) async {
    try {
      final response = await dioClient.dio.post(
        ApiEndpoints.products,
        data: product.toJson(),
      );
      return Product.fromJson(response.data);
    } on DioException catch (e) {
      throw dioClient.handleError(e);
    }
  }

  /// Update product
  Future<Product> updateProduct(int id, Product product) async {
    try {
      final response = await dioClient.dio.put(
        "${ApiEndpoints.productById}$id",
        data: product.toJson(),
      );
      return Product.fromJson(response.data);
    } on DioException catch (e) {
      throw dioClient.handleError(e);
    }
  }

  /// Delete product
  Future<void> deleteProduct(int id) async {
    try {
      await dioClient.dio.delete("${ApiEndpoints.productById}$id");
      AppLogger.success("Product deleted from server");
    } on DioException catch (e) {
      throw dioClient.handleError(e);
    }
  }
}
