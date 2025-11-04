import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String keyIsLoggedIn = "is_logged_in";
  static const String keyUserEmail = "user_email";

  
  Future<void> setLoginStatus(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(keyIsLoggedIn, value);
  }

  
  Future<bool> getLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(keyIsLoggedIn) ?? false;
  }

 
  Future<void> setUserEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyUserEmail, email);
  }

 
  Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyUserEmail);
  }

  
  Future<void> clearStorage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
