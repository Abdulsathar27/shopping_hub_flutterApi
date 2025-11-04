import '../core/storage/local_storage_service.dart';

class AuthService {
  final LocalStorageService localStorageService = LocalStorageService();

  
  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 800));

    if (email.isNotEmpty && password.isNotEmpty) {
      await localStorageService.setLoginStatus(true);
      await localStorageService.setUserEmail(email);
      return true;
    }
    return false;
  }

  
  Future<void> logout() async {
    await localStorageService.clearStorage();
  }


  Future<bool> isLoggedIn() async {
    return await localStorageService.getLoginStatus();
  }


  Future<String?> getUserEmail() async {
    return await localStorageService.getUserEmail();
  }
}
