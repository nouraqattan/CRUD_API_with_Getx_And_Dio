import 'package:get/get.dart';
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
      posts.assignAll(response);
    } catch (e) {
      print("Error fetching posts: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> deletePost(int id) async {
    try {
      await postRepository.deletePost(id);
      posts.removeWhere((post) => post.id == id);
      Get.snackbar("Success", "Post deleted successfully");
    } catch (e) {
      Get.snackbar("Error", "An error occurred while deleting the post.");
    }
  }
}