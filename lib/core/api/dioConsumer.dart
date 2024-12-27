import 'package:dio/dio.dart';
import '../errors/handleDioException.dart';

abstract class ApiConsumer {
  Future<dynamic> get(String path, {Map<String, dynamic>? queryParameters});
  Future<dynamic> post(String path, {dynamic data});
  Future<dynamic> put(String path, {dynamic data});
  Future<dynamic> delete(String path);
}

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = "https://jsonplaceholder.typicode.com";
  }

  @override
  Future<dynamic> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(path, queryParameters: queryParameters);
      return response.data;
    } on DioError catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future<dynamic> post(String path, {dynamic data}) async {
    try {
      final response = await dio.post(path, data: data);
      return response.data;
    } on DioError catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future<dynamic> put(String path, {dynamic data}) async {
    try {
      final response = await dio.put(path, data: data);
      return response.data;
    } on DioError catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future<dynamic> delete(String path) async {
    try {
      final response = await dio.delete(path);
      return response.data;
    } on DioError catch (e) {
      handleDioExceptions(e);
    }
  }
}