import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// [DioInterceptor] is a custom Dio interceptor for logging and modifying requests and responses.
class DioInterceptor extends Interceptor {
  const DioInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('''
REQUEST[${options.method}]:
      URL: ${options.uri}
      Data: ${options.data}
      QueryParameters: ${options.queryParameters}
      Headers: ${options.headers}
''');

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('''
RESPONSE[${response.statusCode}]:
      URL: ${response.realUri}
      Data: ${(response.data is Uint8List?) ? response.data.runtimeType : response.data}
''');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint('''
ERROR[${err.response?.statusCode}]:
      URL: ${err.response?.realUri}
      TYPE: ${err.type}
      Data: ${err.response?.data}
      Message: ${err.message}
''');

    _errorHandler(err, handler);
  }

  void _errorHandler(DioException err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      handler.resolve(err.response!);
    } else {
      handler.next(err);
    }
  }
}
