export 'dio_helper.dart';

import 'package:dio/dio.dart';

typedef Json = Map<String, dynamic>;

class DioHelper {
  
  final _baseUrl = 'http://192.168.1.12:3000';
  late Dio _dio;

  DioHelper() {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
  }

  Future<Json> post({
    required String endpoint,
    Json? body,
    Json? params,
    Options? options,
  }) async {
    final response = await _dio.post(
      endpoint,
      data: body,
      queryParameters: params,
      options: options,
    );
    return response.data;
  }

  Future<Json> patch({
    required String endpoint,
    Json? body,
    Json? params,
    Options? options,
  }) async {
    final response = await _dio.patch(
      endpoint,
      data: body,
      queryParameters: params,
      options: options,
    );
    return response.data;
  }

  Future<Json> get({
    required String endpoint,
    Json? body,
    Json? params,
    Options? options,
  }) async {
    final response = await _dio.get(
      endpoint,
      data: body,
      queryParameters: params,
      options: options,
    );
    return response.data;
  }
}