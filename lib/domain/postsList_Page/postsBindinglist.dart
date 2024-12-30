import 'package:get/get.dart';
import 'postList_Controller.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PostController>(PostController());
  }
}