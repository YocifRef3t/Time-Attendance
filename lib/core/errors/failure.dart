import 'package:dio/dio.dart';

class Failure {
  final String errorMessage;
  Failure({required this.errorMessage});

  factory Failure.serverError(DioException ex) {
    switch (ex.type) {
      case DioExceptionType.connectionTimeout:
        return Failure(errorMessage: "Connection timeout");
      case DioExceptionType.cancel:
        return Failure(errorMessage: "Request has been canceld");
      case DioExceptionType.sendTimeout:
        return Failure(errorMessage: "Send Timeout");
      case DioExceptionType.receiveTimeout:
        return Failure(errorMessage: "Receive Timeout");
      case DioExceptionType.badResponse:
        return Failure(errorMessage: "Api rejected request");
      default:
        return Failure(errorMessage: "Something went wrong");
    }
  }
}
