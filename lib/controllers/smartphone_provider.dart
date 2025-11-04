import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../models/product.dart';
import '../core/network/dio_client.dart';
import '../core/constants/api_constants.dart';
import '../core/network/api_endpoints.dart';
import '../core/utils/logger.dart';

class SmartphoneProvider with ChangeNotifier {
  final DioClient dioClient = DioClient();

  List<Product> smartphones = [];
  bool isLoading = false;
  String? errorMessage;

  List<Product> get smartphone => smartphones;
  bool get isLoadings => isLoading;
  String? get errorMessages => errorMessage;


  Future<void> loadSmartphones() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      
      dioClient.dio.options.baseUrl = ApiConstants.baseDummyJson;

      final response =
          await dioClient.dio.get(ApiEndpoints.smartphones);

      final List data = response.data["products"];
      smartphones = data.map((json) => Product.fromJson(json)).toList();

      AppLogger.success("Smartphones loaded successfully");
    } on DioException catch (e) {
      errorMessage = dioClient.handleError(e).toString();
      AppLogger.error("Failed loading smartphones", error: errorMessage);
    } catch (e) {
      errorMessage = "Unexpected error: $e";
      AppLogger.error("Unexpected failure", error: e);
    }

    isLoading = false;
    notifyListeners();
  }
}
