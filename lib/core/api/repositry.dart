import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'endpoint_API_Repo.dart';
import '../../model/postModel.dart';
import 'dioConsumer.dart';

class PostRepository {
  final DioConsumer apiConsumer;

  PostRepository() : apiConsumer = Get.find<DioConsumer>();

  Future<List<Post>> fetchPosts() async {
    final response = await apiConsumer.get(EndPoint.posts);
    return List<Post>.from(response.map((post) => Post.fromJson(post)));
  }

  Future<Post> fetchPostById(int id) async {
    final response = await apiConsumer.get(EndPoint.postById(id));
    return Post.fromJson(response);
  }

  Future<Post> createPost(Post post) async {
    final response = await apiConsumer.post(EndPoint.posts, data: post.toJson());
    return Post.fromJson(response);
  }

  Future<Post> updatePost(Post post) async {
    final response = await apiConsumer.put(EndPoint.postById(post.id), data: post.toJson());
    return Post.fromJson(response);
  }

  Future<void> deletePost(int id) async {
    await apiConsumer.delete(EndPoint.postById(id));
  }
}