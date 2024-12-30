import 'package:fakeapi_withdio_getx/doamin/post_edit_Add_Page/postedit_Controller.dart';
import 'package:get/get.dart';


class AddEditPostBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PostEditController>(PostEditController());
  }
}