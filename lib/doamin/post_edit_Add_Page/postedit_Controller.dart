import 'package:fakeapi_withdio_getx/doamin/postsList_Page/postList_Controller.dart';
import 'package:get/get.dart';
import '../../../../core/api/repositry.dart';
import '../../../../model/postModel.dart';

class PostEditController extends GetxController {
  var isLoading = false.obs;
  late final PostRepository postRepository;
  late final PostController postController;

  @override
  void onInit() {
    super.onInit();

    postRepository = Get.find<PostRepository>();
    postController = Get.find<PostController>();
  }

  Future<void> createPost(Post post) async {
    isLoading(true);
    try {
      final response = await postRepository.createPost(post);
      postController.posts.add(response);
      Get.snackbar("Success", "Post created successfully");
    } catch (e) {
      Get.snackbar("Error", "Failed to create post.");
    } finally {
      isLoading(false);
    }
  }

  Future<void> editPost(Post post) async {
    isLoading(true);
    try {
      final response = await postRepository.updatePost(post);
      int index = postController.posts.indexWhere((p) => p.id == post.id);
      if (index != -1) {
        postController.posts[index] = response;
      }
      Get.snackbar("Success", "Post updated successfully");
    } catch (e) {
      Get.snackbar("Error", "Failed to update post.");
    } finally {
      isLoading(false);
    }
  }
}