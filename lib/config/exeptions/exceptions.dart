import 'package:dio/dio.dart';

/// [NetworkException] is a custom exception for network errors.
class NetworkException implements Exception {
  final message = 'Please check your internet connection';

  @override
  String toString() => message;
}

/// [BackendException] is a custom exception for backend errors.
class BackendException implements Exception {
  final message = 'Cannot connect to server.';

  @override
  String toString() => message;
}

/// [DioParseException] is a custom exception for Dio parsing errors.
class DioParseException implements Exception {
  final DioException exception;
  const DioParseException(this.exception);

  String get message {
    return switch (exception.type) {
      DioExceptionType.connectionTimeout => "Connection timed out. Please check your internet connection and try again.",
      DioExceptionType.receiveTimeout => "Receiving data timed out. Please try again later.",
      DioExceptionType.sendTimeout => "Sending data timed out. Please ensure your network is stable and try again.",
      DioExceptionType.cancel => "Request has been cancelled. Please retry the operation.",
      DioExceptionType.connectionError => "A connection error occurred. Please verify your internet connection.",
      DioExceptionType.badResponse => "Received an invalid response from the server. Please try again later.",
      DioExceptionType.badCertificate => "The server certificate is not valid. Please ensure you are connecting to a trusted server.",
      DioExceptionType.unknown => "An unknown error occurred. Please try again or contact support.",
    };
  }

  @override
  String toString() => message;
}
