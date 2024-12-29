/*import 'package:get/get.dart';
import '../../model/postModel.dart';
import '../core/api/repositry.dart';

class PostController extends GetxController {
  final PostRepository postRepository;
  var posts = <Post>[].obs;
  var isLoading = false.obs;

  PostController({required this.postRepository});

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    isLoading(true);
    try {
      final response = await postRepository.fetchPosts();
      posts.value = response;
    } catch (e) {
      print("Error fetching posts: $e");
      Get.snackbar('Error', 'Failed to load posts', snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }

  Future<void> createPost(Post post) async {
    isLoading(true);
    try {
      final response = await postRepository.createPost(post);
      posts.add(response);
      Get.snackbar("Success", "Post created successfully");
    } catch (e) {
      Get.snackbar("Error", "An error occurred while creating the post.");
    } finally {
      isLoading(false);
    }
  }

  Future<void> editPost(Post updatedPost) async {
    try {
      final response = await postRepository.updatePost(updatedPost);
      int index = posts.indexWhere((p) => p.id == updatedPost.id);
      if (index != -1) {
        posts[index] = response;
      }
      Get.snackbar("Success", "Post updated successfully");
    } catch (e) {
      Get.snackbar("Error", "An error occurred while updating the post.");
    }
  }

  Future<void> deletePost(int id) async {
    try {
      await postRepository.deletePost(id);  // Use repository to delete post
      posts.removeWhere((post) => post.id == id);
      Get.snackbar("Success", "Post deleted successfully");
    } catch (e) {
      Get.snackbar("Error", "An error occurred while deleting the post.");
    }
  }
}*/