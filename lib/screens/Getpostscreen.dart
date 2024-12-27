import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/postControllers.dart';
import '../core/api/dioConsumer.dart';
import '../core/routes/routes.dart';

class PostsScreen extends StatelessWidget {
  final PostController postController = Get.put(PostController(apiConsumer: DioConsumer(dio: Dio())));
  @override
  Widget build(BuildContext context) {
    postController.fetchPosts();
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.toNamed(AppRoutes.addPost);
            },
          ),
        ],
      ),
      body: Obx(() {
        if (postController.isLoading.isTrue) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: postController.posts.length,
          itemBuilder: (context, index) {
            final post = postController.posts[index];
            return ListTile(
              title: Text(post.title),
              subtitle: Text(post.body),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Get.toNamed(AppRoutes.editPost, arguments: post);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      final PostController controller = Get.find();
                      controller.deletePost(post.id);
                    },
                  ),
                ],
              ),
              onTap: () {
                Get.toNamed(AppRoutes.postDetail, arguments: {
                  'userId': post.userId,
                  'id': post.id,
                  'title': post.title,
                  'body': post.body,
                });
              },
            );
          },
        );
      }),
    );
  }}