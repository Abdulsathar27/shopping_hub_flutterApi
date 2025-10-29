class AppException implements Exception {
  final String message;
  final String? prefix;

  AppException(this.message, [this.prefix]);

  @override
  String toString() {
    return "$prefix$message";
  }
}

class NetworkException extends AppException {
  NetworkException(String message)
      : super(message, "Network Error: ");
}

class BadRequestException extends AppException {
  BadRequestException(String message)
      : super(message, "Bad Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException(String message)
      : super(message, "Unauthorised: ");
}

class NotFoundException extends AppException {
  NotFoundException(String message)
      : super(message, "Not Found: ");
}

class FetchDataException extends AppException {
  FetchDataException(String message)
      : super(message, "Data Fetch Error: ");
}
