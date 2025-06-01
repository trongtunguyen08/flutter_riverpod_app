import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_app/data/local/secure_storage/isucure_storage.dart';
import 'package:flutter_riverpod_app/data/local/secure_storage/secure_storage.dart';
import 'package:flutter_riverpod_app/data/local/secure_storage/secure_storage_const.dart';

final networkServiceInterceptorProvider =
    Provider.family<NetworkServiceInterceptor, Dio>((ref, dio) {
      final secureStorage = ref.watch(secureStorageProvider);
      return NetworkServiceInterceptor(secureStorage, dio);
    });

final class NetworkServiceInterceptor extends Interceptor {
  final ISecureStorage _secureStorage;
  final Dio _dio;

  NetworkServiceInterceptor(this._secureStorage, this._dio);

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _secureStorage.read(accessTokenKey) ?? '';
    if (token.isEmpty) {
      return handler.reject(
        DioException(requestOptions: options, error: 'Access token is missing'),
      );
    }
    // Add the token to the request headers
    options.headers["Authorization"] = "Bearer $token";
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Handle unauthorized errors
    if (err.response?.statusCode == 401) {
      final refreshToken = _secureStorage.read(refreshTokenKey);
      try {
        final response = await _dio.post<Map<String, dynamic>>(
          "/api/v1/auth/refresh-token",
          data: {"refreshToken": refreshToken},
        );
        final json = response.data;
        final newAccessToken = json?['accessToken'] as String?;
        if (newAccessToken != null) {
          // Save the new access token
          await _secureStorage.write(accessTokenKey, newAccessToken);
          // Retry the original request with the new token
          final options = err.requestOptions;
          options.headers["Authorization"] = "Bearer $newAccessToken";
          final cloneRequest = await _dio.fetch(options);
          return handler.resolve(cloneRequest);
        }
      } on DioException catch (e) {
        return handler.next(e);
      }
    }

    return handler.next(err);
  }
}
