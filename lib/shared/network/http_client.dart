import 'package:dio/dio.dart';
import 'package:more_devs_ecommerce/shared/network/http_client_exception.dart';

class HttpClient {
  HttpClient({Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: 'https://api-production-c0289.up.railway.app/api/v1',
              connectTimeout: const Duration(seconds: 15),
              receiveTimeout: const Duration(seconds: 15),
              sendTimeout: const Duration(seconds: 15),
              headers: const {'accept': 'application/json'},
            ),
          );

  final Dio _dio;

  Future<Map<String, dynamic>> get(
    String path, {
    String? token,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) {
    return _request(
      () => _dio.get<Object?>(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            ...?headers,
            if (token != null && token.trim().isNotEmpty)
              'Authorization': 'Bearer $token',
          },
        ),
        cancelToken: cancelToken,
      ),
    );
  }

  Future<Map<String, dynamic>> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    String? token,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) {
    return _request(
      () => _dio.post<Object?>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          contentType: Headers.jsonContentType,
          headers: {
            ...?headers,
            if (token != null && token.trim().isNotEmpty)
              'Authorization': 'Bearer $token',
          },
        ),
        cancelToken: cancelToken,
      ),
    );
  }

  Future<Map<String, dynamic>> put(
    String path, {
    Object? data,
    String? token,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) {
    return _request(
      () => _dio.put<Object?>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          contentType: data == null ? null : Headers.jsonContentType,
          headers: {
            ...?headers,
            if (token != null && token.trim().isNotEmpty)
              'Authorization': 'Bearer $token',
          },
        ),
        cancelToken: cancelToken,
      ),
    );
  }

  Future<Map<String, dynamic>> patch(
    String path, {
    Object? data,
    String? token,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) {
    return _request(
      () => _dio.patch<Object?>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          contentType: data == null ? null : Headers.jsonContentType,
          headers: {
            ...?headers,
            if (token != null && token.trim().isNotEmpty)
              'Authorization': 'Bearer $token',
          },
        ),
        cancelToken: cancelToken,
      ),
    );
  }

  Future<Map<String, dynamic>> delete(
    String path, {
    Object? data,
    String? token,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) {
    return _request(
      () => _dio.delete<Object?>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            ...?headers,
            if (token != null && token.trim().isNotEmpty)
              'Authorization': 'Bearer $token',
          },
        ),
        cancelToken: cancelToken,
      ),
    );
  }

  Future<Map<String, dynamic>> _request(
    Future<Response<Object?>> Function() call,
  ) async {
    try {
      final response = await call();
      return response.data as Map<String, dynamic>;
    } on DioException catch (error) {
      throw HttpClientException(
        message: _messageFor(error),
        statusCode: error.response?.statusCode,
        responseData: error.response?.data,
      );
    }
  }

  String _messageFor(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Tempo de conexão esgotado. Tente novamente.';
      case DioExceptionType.connectionError:
        return 'Sem conexão com o servidor.';
      case DioExceptionType.cancel:
        return 'Requisição cancelada.';
      default:
        return error.message ?? 'Falha ao comunicar com o servidor.';
    }
  }
}
