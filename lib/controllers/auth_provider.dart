import 'package:flutter/material.dart';
import '../core/storage/local_storage_service.dart';

class AuthProvider with ChangeNotifier {
  final LocalStorageService localStorage = LocalStorageService();

  bool isLoggedIn = false;
  String? userEmail;
  bool isLoading = false;

  bool get isLoggedIns => isLoggedIn;
  String? get userEmails => userEmail;
  bool get isLoadings => isLoading;

  /// Load saved auth state when app starts
  Future<void> checkLoginStatus() async {
    isLoggedIn = await localStorage.getLoginStatus();
    userEmail = await localStorage.getUserEmail();
    notifyListeners();
  }

  /// Simulated login process
  Future<bool> login(String email, String password) async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1)); // Fake API call time

    if (email.isNotEmpty && password.isNotEmpty) {
      isLoggedIn = true;
      userEmail = email;

      await localStorage.setLoginStatus(true);
      await localStorage.setUserEmail(email);

      isLoading = false;
      notifyListeners();
      return true;
    }

    isLoading = false;
    notifyListeners();
    return false;
  }

  /// Logout user and clear data
  Future<void> logout() async {
    isLoggedIn = false;
    userEmail = null;

    await localStorage.clearStorage();
    notifyListeners();
  }
}
