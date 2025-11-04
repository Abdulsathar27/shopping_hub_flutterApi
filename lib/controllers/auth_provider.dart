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


  Future<void> checkLoginStatus() async {
    isLoggedIn = await localStorage.getLoginStatus();
    userEmail = await localStorage.getUserEmail();
    notifyListeners();
  }

 
  Future<bool> login(String email, String password) async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1)); 

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

  
  Future<void> logout() async {
    isLoggedIn = false;
    userEmail = null;

    await localStorage.clearStorage();
    notifyListeners();
  }
}
