import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../../core/api/dioConsumer.dart';
import '../../core/api/repositry.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<Dio>(Dio());
    Get.put<DioConsumer>(DioConsumer());
    Get.put<PostRepository>(PostRepository());
  }
}