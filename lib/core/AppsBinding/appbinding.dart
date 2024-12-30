import 'package:get/get.dart';
import '../../screens/GetDetailScreenModel.dart';
import '../../screens/Getpostscreen.dart';
import '../../screens/addEditPostScreen.dart';
import '../../doamin/post_edit_Add_Page/addeditBindingPage.dart';
import '../../doamin/postsList_Page/postsBindinglist.dart';
import '../../approutes.dart';
import 'BindingsRepositries.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    PostBinding().dependencies();
    AddEditPostBinding().dependencies();
  }
  static final AppBinding = [
    GetPage(
      name: AppRoutes.posts,
      page: () => PostsScreen(),
      binding: AppsBindingsRepo(),
    ),
    GetPage(
      name: AppRoutes.addEditPost,
      page: () => AddOrEditPostScreen(),
      binding: AppsBindingsRepo(),
    ),
    GetPage(
      name: AppRoutes.postDetail,
      page: () => PostDetailScreen(),
      binding: AppsBindingsRepo(),
    ),
  ];
}