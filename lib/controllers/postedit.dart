import 'package:fakeapi_withdio_getx/controllers/postList.dart';
import 'package:get/get.dart';
import '../../../core/api/repositry.dart';
import '../../../model/postModel.dart';

class PostEditController extends GetxController {
  final PostRepository postRepository;
  final PostController postController;
  var isLoading = false.obs;

  PostEditController({required this.postRepository, required this.postController});

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