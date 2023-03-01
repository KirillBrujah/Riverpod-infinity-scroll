import 'package:dio/dio.dart';

/// Class wrapper for Dio object with presetting
class DioClient {
  late final Dio _dio;

  DioClient._() {
    _dio = Dio();
    _dio.options.headers["Content-Type"] = "application/json";
    _dio.options.headers["Accept"] = "application/json";
    _dio.options.baseUrl = 'https://www.cheapshark.com/api/1.0/';
  }

  static final DioClient _dioClient = DioClient._();

  factory DioClient() {
    return _dioClient;
  }

  Future<Response> post(String url, {dynamic data}) async {
    final response = await _dio.post(url, data: data);
    return response;
  }

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final response = await _dio.get(
      url,
      queryParameters: queryParameters,
      options: options,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  Future<Response> put(String url, {Map<String, dynamic>? data}) async {
    final response = await _dio.put(url, data: data);
    return response;
  }

  Future<Response> delete(String url, {Map<String, dynamic>? data}) async {
    final response = await _dio.delete(url, data: data);
    return response;
  }
}
