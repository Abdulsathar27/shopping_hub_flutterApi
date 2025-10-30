import '../core/storage/local_storage_service.dart';

class AuthService {
  final LocalStorageService localStorageService = LocalStorageService();

  /// Simulated authentication logic (replace with real API later)
  Future<bool> login(String email, String password) async {
    // Fake delay to simulate network authentication
    await Future.delayed(const Duration(milliseconds: 800));

    if (email.isNotEmpty && password.isNotEmpty) {
      await localStorageService.setLoginStatus(true);
      await localStorageService.setUserEmail(email);
      return true;
    }
    return false;
  }

  /// Logout user and clear stored data
  Future<void> logout() async {
    await localStorageService.clearStorage();
  }

  /// Check if user already logged in
  Future<bool> isLoggedIn() async {
    return await localStorageService.getLoginStatus();
  }

  /// Get stored logged-in user email
  Future<String?> getUserEmail() async {
    return await localStorageService.getUserEmail();
  }
}
