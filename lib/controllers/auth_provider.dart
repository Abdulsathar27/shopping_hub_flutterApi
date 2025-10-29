import 'package:flutter/material.dart';
import '../core/storage/local_storage_service.dart';

class AuthProvider with ChangeNotifier {
  final LocalStorageService _localStorage = LocalStorageService();

  bool _isLoggedIn = false;
  String? _userEmail;
  bool _isLoading = false;

  bool get isLoggedIn => _isLoggedIn;
  String? get userEmail => _userEmail;
  bool get isLoading => _isLoading;

  /// Load saved auth state when app starts
  Future<void> checkLoginStatus() async {
    _isLoggedIn = await _localStorage.getLoginStatus();
    _userEmail = await _localStorage.getUserEmail();
    notifyListeners();
  }

  /// Simulated login process
  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1)); // Fake API call time

    if (email.isNotEmpty && password.isNotEmpty) {
      _isLoggedIn = true;
      _userEmail = email;

      await _localStorage.setLoginStatus(true);
      await _localStorage.setUserEmail(email);

      _isLoading = false;
      notifyListeners();
      return true;
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  /// Logout user and clear data
  Future<void> logout() async {
    _isLoggedIn = false;
    _userEmail = null;

    await _localStorage.clearStorage();
    notifyListeners();
  }
}
