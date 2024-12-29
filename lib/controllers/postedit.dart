import 'package:get/get.dart';
import '../../../core/api/repositry.dart';
import '../../../model/postModel.dart';

class PostEditController extends GetxController {
  final PostRepository postRepository;
  var posts = <Post>[].obs;
  var isLoading = false.obs;
  PostEditController({required this.postRepository});

  Future<void> createPost(Post post) async {
    isLoading(true);
    try {
      await postRepository.createPost(post);
      Get.snackbar("Success", "Post created successfully");
    } catch (e) {
      Get.snackbar("Error", "An error occurred while creating the post.");
    } finally {
      isLoading(false);
    }
  }

  Future<void> editPost(Post updatedPost) async {
    isLoading(true);
    try {
      await postRepository.updatePost(updatedPost);
      Get.snackbar("Success", "Post updated successfully");
    } catch (e) {
      Get.snackbar("Error", "An error occurred while updating the post.");
    } finally {
      isLoading(false);
    }
  }
}