import 'package:get/get.dart';
import '../core/api/dioConsumer.dart';
import '../core/api/endpoint.dart';
import '../model/postModel.dart';
class PostController extends GetxController {
  final DioConsumer apiConsumer;
  var posts = <Post>[].obs;
  var specificPost = Post(userId: 0, id: 0, title: '', body: '').obs;
  var isLoading = false.obs;

  PostController({required this.apiConsumer});

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  @override
  void onReady() {
    super.onReady();
    Get.snackbar('Notice', 'PostController is ready', snackPosition: SnackPosition.BOTTOM);
  }

  Future<void> fetchPosts() async {
    isLoading(true);
    try {
      final response = await apiConsumer.get(EndPoint.posts);
      posts.value = List<Post>.from(response.map((x) => Post.fromJson(x)));
    } catch (e) {
      print("Error fetching posts: $e");
      Get.snackbar('Error', 'Failed to load posts', snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchSpecificPost(int id) async {
    isLoading(true);
    try {
      final response = await apiConsumer.get('${EndPoint.postById}/$id');
      specificPost.value = Post.fromJson(response);
    } catch (e) {
      print("Error fetching specific post: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {
    Get.snackbar('Notice', 'PostController is being closed', snackPosition: SnackPosition.BOTTOM);
    super.onClose();
  }

  Future<void> createPost(Post post) async {
    isLoading(true);
    try {
      final response = await apiConsumer.post(EndPoint.posts, data: post.toJson());
      if (response != null) {
        posts.add(Post.fromJson(response));
        Get.snackbar("Success", "Post created successfully");
      } else {
        Get.snackbar("Error", "Failed to create post");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred while creating the post.");
    } finally {
      isLoading(false);
    }
  }

  Future<void> editPost(Post updatedPost) async {
    try {
      final response = await apiConsumer.put('${EndPoint.posts}/${updatedPost.id}', data: updatedPost.toJson());
      if (response != null) {
        int index = posts.indexWhere((p) => p.id == updatedPost.id);
        if (index != -1) {
          posts[index] = Post.fromJson(response);
        }
        Get.snackbar("Success", "Post updated successfully");
      } else {
        Get.snackbar("Error", "Failed to update post");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred while updating the post.");
    }
  }

  Future<void> deletePost(int id) async {
    try {
      await apiConsumer.delete('${EndPoint.posts}/$id');
      posts.removeWhere((post) => post.id == id);
      Get.snackbar("Success", "Post deleted successfully");
    } catch (e) {
      Get.snackbar("Error", "An error occurred while deleting the post.");
    }
  }
}