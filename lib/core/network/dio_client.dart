import 'package:dio/dio.dart';
import '../constants/api_constants.dart';
import '../utils/app_exceptions.dart';
import '../utils/logger.dart';

class DioClient {
  final Dio dio;

  Dio get dios => dio;

  DioClient.internal(this.dio);

  factory DioClient() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseFakeStore,
        connectTimeout: Duration(milliseconds: ApiConstants.connectionTimeout),
        receiveTimeout: Duration(milliseconds: ApiConstants.receiveTimeout),
        headers: ApiConstants.defaultHeaders,
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          AppLogger.log("REQUEST => ${options.method} ${options.path}");
          AppLogger.log("HEADERS => ${options.headers}");
          AppLogger.log("BODY => ${options.data}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          AppLogger.success(
              "RESPONSE(${response.statusCode}) => ${response.data}");
          return handler.next(response);
        },
        onError: (error, handler) {
          AppLogger.error("API ERROR", error: error.message);
          return handler.next(error);
        },
      ),
    );

    return DioClient.internal(dio);
  }

  
  Exception handleError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkException("Connection Timeout");

      case DioExceptionType.badResponse:
        if (e.response != null) {
          switch (e.response?.statusCode) {
            case 400:
              return BadRequestException("Invalid request");
            case 401:
              return UnauthorisedException("Authentication failed");
            case 404:
              return NotFoundException("Requested resource not found");
          }
        }
        return FetchDataException("Server did not respond properly");

      default:
        return FetchDataException("Unexpected error occurred");
    }
  }
}
