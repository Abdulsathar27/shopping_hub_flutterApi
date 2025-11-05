import '../core/network/dio_client.dart';
import '../core/network/api_endpoints.dart';
import '../models/product.dart';
import '../core/utils/logger.dart';

class ProductService {
  final DioClient dioClient = DioClient();

  Future<List<Product>> fetchProducts() async {
    final response = await dioClient.dio.get(ApiEndpoints.products);
    final List data = response.data;
    AppLogger.success("Products loaded successfully");
    return data.map((json) => Product.fromJson(json)).toList();
  }

  Future<Product> addProduct(Product product) async {
    final response = await dioClient.dio.post(
      ApiEndpoints.products,
      data: product.toJson(),
    );
    AppLogger.success("Product added successfully");
    return Product.fromJson(response.data);
  }

  Future<Product> updateProduct(int id, Product updatedProduct) async {
    final response = await dioClient.dio.put(
      "${ApiEndpoints.productById}$id",
      data: updatedProduct.toJson(),
    );
    AppLogger.success("Product updated successfully");
    return Product.fromJson(response.data);
  }

  Future<void> deleteProduct(int id) async {
    await dioClient.dio.delete("${ApiEndpoints.productById}$id");
    AppLogger.success("Product deleted successfully");
  }
}
