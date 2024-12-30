import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'domain/post_edit_Add_Page/postedit_Controller.dart';
import 'domain/postsList_Page/postList_Controller.dart';
import 'core/api/dioConsumer.dart';
import 'core/api/repositry.dart';


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