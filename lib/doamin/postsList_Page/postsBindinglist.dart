import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'postList_Controller.dart';
import '../../core/api/dioConsumer.dart';
import '../../core/api/repositry.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
   Get.put<Dio>(Dio());
    Get.put<DioConsumer>(DioConsumer());
    Get.put<PostRepository>(PostRepository());
    Get.put<PostController>(PostController());
  }
}