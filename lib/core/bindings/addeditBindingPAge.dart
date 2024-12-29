import 'package:dio/dio.dart';
import 'package:fakeapi_withdio_getx/controllers/postedit.dart';
import 'package:get/get.dart';
import '../api/dioConsumer.dart';
import '../api/repositry.dart';

class AddEditPostBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DioConsumer>(DioConsumer(dio: Get.find<Dio>()));
    Get.put<PostRepository>(PostRepository(apiConsumer: Get.find<DioConsumer>()));
    Get.put<PostEditController>(PostEditController(postRepository: Get.find<PostRepository>()));
  }
}