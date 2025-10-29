import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../models/product.dart';
import '../core/network/dio_client.dart';
import '../core/constants/api_constants.dart';
import '../core/network/api_endpoints.dart';
import '../core/utils/logger.dart';

class SmartphoneProvider with ChangeNotifier {
  final DioClient _dioClient = DioClient();

  List<Product> _smartphones = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Product> get smartphones => _smartphones;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  /// Fetch smartphone category from DummyJSON API
  Future<void> loadSmartphones() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      /// Temporarily override base URL for DummyJSON
      _dioClient.dio.options.baseUrl = ApiConstants.baseDummyJson;

      final response =
          await _dioClient.dio.get(ApiEndpoints.smartphones);

      final List data = response.data["products"];
      _smartphones = data.map((json) => Product.fromJson(json)).toList();

      AppLogger.success("Smartphones loaded successfully");
    } on DioException catch (e) {
      _errorMessage = _dioClient.handleError(e).toString();
      AppLogger.error("Failed loading smartphones", error: _errorMessage);
    } catch (e) {
      _errorMessage = "Unexpected error: $e";
      AppLogger.error("Unexpected failure", error: e);
    }

    _isLoading = false;
    notifyListeners();
  }
}
