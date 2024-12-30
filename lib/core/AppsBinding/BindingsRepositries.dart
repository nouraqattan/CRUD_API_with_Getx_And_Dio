import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:fakeapi_withdio_getx/doamin/postsList_Page/postList_Controller.dart';
import 'package:fakeapi_withdio_getx/doamin/post_edit_Add_Page/postedit_Controller.dart';
import '../api/repositry.dart';
import '../api/dioConsumer.dart';

class AppsBindingsRepo extends Bindings {
  @override
  void dependencies() {
    Get.put<Dio>(Dio());
    Get.put<DioConsumer>(DioConsumer());
    Get.put<PostRepository>(PostRepository());
    Get.put<PostController>(PostController());
    Get.put<PostEditController>(PostEditController());
  }
}