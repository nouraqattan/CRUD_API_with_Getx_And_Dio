import 'package:get/get.dart';
import '../../screens/GetDetailScreenModel.dart';
import '../../screens/Getpostscreen.dart';
import '../../screens/addPostScreen.dart';
import '../../screens/editpostsscreen.dart';
import '../bindings/postBinding.dart';

class AppRoutes {
  static const String posts = '/posts';
  static const String addPost = '/addPost';
  static const String editPost = '/editPost';
  static const String postDetail = '/postDetail';

  static List<GetPage> routes = [
    GetPage(
      name: posts,
      page: () => PostsScreen(),
      binding: PostBinding(),
    ),
    GetPage(
      name: addPost,
      page: () => AddPostScreen(),
      binding: PostBinding(),
    ),
    GetPage(
      name: editPost,
      page: () {
        final post = Get.arguments;
        return EditPostScreen(post: post);
      },
      binding: PostBinding(),
    ),
    GetPage(
      name: postDetail,
      page: () => PostDetailScreen(
        userId: Get.arguments['userId'],
        id: Get.arguments['id'],
        title: Get.arguments['title'],
        body: Get.arguments['body'],
      ),
    ),
  ];
}