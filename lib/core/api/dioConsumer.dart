import 'package:dio/dio.dart';
import '../errors/handleDioException.dart';
import 'endpoint_API_Repo.dart';

class DioConsumer extends ApiRepository {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = ApiRepository.baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 10);
  }
  Future<dynamic> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(path, queryParameters: queryParameters);
      return response.data;
    } on DioError catch (e) {
      handleDioExceptions(e);
      rethrow;
    }
  }
  Future<dynamic> post(String path, {dynamic data}) async {
    try {
      final response = await dio.post(path, data: data);
      return response.data;
    } on DioError catch (e) {
      handleDioExceptions(e);
      rethrow;
    }
  }

  Future<dynamic> put(String path, {dynamic data}) async {
    try {
      final response = await dio.put(path, data: data);
      return response.data;
    } on DioError catch (e) {
      handleDioExceptions(e);
      rethrow;
    }
  }

  Future<dynamic> delete(String path) async {
    try {
      final response = await dio.delete(path);
      return response.data;
    } on DioError catch (e) {
      handleDioExceptions(e);
      rethrow;
    }
  }
}