import 'package:dio/dio.dart';
import 'package:pokedex_app/config/base_url.dart';
import 'package:pokedex_app/core/utils/dio_interception.dart';

class DioClient {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: BaseURL().url,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 10),
      contentType: 'application/json',
    ),
  )..interceptors.add(DioInterception());

  static Dio get instance => _dio;
}