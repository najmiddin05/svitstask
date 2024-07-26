import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:svitstask/config/exeptions/exceptions.dart';
import 'package:svitstask/config/constants/apis.dart';

/// [RemoteDataSource] is a class that handles making network requests using the Dio package.
class RemoteDataSource {
  final Dio _dio;

  /// Creates a [RemoteDataSource] instance with an optional [Interceptor].
  factory RemoteDataSource({Interceptor? interceptor}) {
    return RemoteDataSource._(_init(interceptor: interceptor));
  }

  RemoteDataSource._(this._dio);

  /// Initializes the Dio instance with default options and an optional [Interceptor].
  static Dio _init({Interceptor? interceptor}) {
    BaseOptions options = BaseOptions(
      baseUrl: Apis.baseUrl,
      contentType: Headers.jsonContentType,
    );

    final dio = Dio(options);
    if (interceptor != null) dio.interceptors.add(interceptor);
    return dio;
  }

  /// Makes a network request with the specified parameters.
  ///
  /// [api]: The API endpoint to request.
  /// [id]: An optional ID to include in the request URL.
  /// [method]: The HTTP method to use for the request (default is GET).
  /// [data]: Optional data to include in the request body.
  /// [queryParams]: Optional query parameters to include in the request URL.
  /// [formData]: Optional form data to include in the request body.
  ///
  /// Returns the response data as an [Object], or throws an exception if an error occurs.
  Future<Object?> request({
    required String api,
    String? id,
    RequestMethod method = RequestMethod.get,
    Object? data,
    Map<String, String>? queryParams,
    FormData? formData,
  }) async {
    try {
      final response = await _dio.request<Object?>(
        "$api${id != null ? "/$id" : ""}",
        data: data ?? formData,
        queryParameters: queryParams,
        options: Options(
          method: method.name,
        ),
      );
      return response.data;
    } on DioException catch (dioError) {
      debugPrint("Dio Error: $dioError");
      throw DioParseException(dioError);
    } catch (error) {
      throw BackendException();
    }
  }
}

/// Enumeration of HTTP request methods.
enum RequestMethod {
  get,
  post,
  put,
  patch,
  delete,
}
