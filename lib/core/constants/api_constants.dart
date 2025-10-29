class ApiConstants {
  /// Base URLs for API services
  static const String baseFakeStore = "https://fakestoreapi.com";
  static const String baseDummyJson = "https://dummyjson.com";

  /// Common timeouts for network requests (in milliseconds)
  static const int connectionTimeout = 5000;
  static const int receiveTimeout = 5000;

  /// Standard headers for HTTP requests
  static const Map<String, dynamic> defaultHeaders = {
    "Content-Type": "application/json"
  };
}
