import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/smartphone_service.dart';
import '../core/utils/logger.dart';

class SmartphoneProvider with ChangeNotifier {
  final SmartphoneService _smartphoneService = SmartphoneService();

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
      smartphones = await _smartphoneService.fetchSmartphones();
      AppLogger.success("Smartphones loaded successfully");
    } catch (e) {
      errorMessage = e.toString();
      AppLogger.error("Failed to load smartphones", error: errorMessage);
    }

    isLoading = false;
    notifyListeners();
  }
}
