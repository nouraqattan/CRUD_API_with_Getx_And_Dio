import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../controllers/postControllers.dart';
import '../../../core/api/dioConsumer.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Dio>(() => Dio());
    Get.lazyPut<DioConsumer>(() => DioConsumer(dio: Get.find<Dio>()));
    Get.lazyPut<PostController>(() => PostController(apiConsumer: Get.find<DioConsumer>()));   }
}