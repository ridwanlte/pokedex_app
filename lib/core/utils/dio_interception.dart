import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioInterception extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // debugPrint('[REQUEST] ${options.method} ${options.uri}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // debugPrint(
    //     '[RESPONSE] ${response.statusCode} => ${response.requestOptions.uri}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      final statusCode = err.response!.statusCode;

      switch (statusCode) {
        case 401:
          break;
        case 403:
          debugPrint('Forbidden: You Don`t have access!');
          break;
        case 500:
          debugPrint('Server error: Please try again later!');
          break;
        default:
          debugPrint('Error $statusCode: ${err.response?.statusMessage}');
      }
    } else {
      debugPrint('Dio error: ${err.message}');
    }

    super.onError(err, handler);
  }
}
