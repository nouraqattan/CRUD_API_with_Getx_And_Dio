import 'package:get/get.dart';
import '../domain/post_edit_Add_Page/addeditBindingPage.dart';
import '../domain/postsList_Page/postsBindinglist.dart';
import '../screens/GetDetailScreenModel.dart';
import '../screens/Getpostscreen.dart';
import '../screens/addEditPostScreen.dart';
import 'approutes.dart';

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
      binding: PostBinding(),
    ),
    GetPage(
      name: AppRoutes.addEditPost,
      page: () => AddOrEditPostScreen(),
      binding: AddEditPostBinding(),
    ),
    GetPage(
      name: AppRoutes.postDetail,
      page: () => PostDetailScreen(),
      binding: PostBinding(),
    ),
  ];
}