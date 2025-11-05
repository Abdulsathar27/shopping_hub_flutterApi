import 'package:dio/dio.dart';
import '../models/product.dart';
import '../core/network/dio_client.dart';
import '../core/constants/api_constants.dart';
import '../core/network/api_endpoints.dart';
import '../core/utils/logger.dart';

class SmartphoneService {
  final DioClient dioClient = DioClient();

  Future<List<Product>> fetchSmartphones() async {
    try {
      dioClient.dio.options.baseUrl = ApiConstants.baseDummyJson;

      final response = await dioClient.dio.get(ApiEndpoints.smartphones);
      final List data = response.data["products"];

      AppLogger.success("Smartphones fetched successfully");
      return data.map((json) => Product.fromJson(json)).toList();
    } on DioException catch (e) {
      final error = dioClient.handleError(e);
      AppLogger.error("Smartphone API error", error: error);
      throw Exception(error);
    } catch (e) {
      AppLogger.error("Unexpected error fetching smartphones", error: e);
      throw Exception("Unexpected error: $e");
    }
  }
}
