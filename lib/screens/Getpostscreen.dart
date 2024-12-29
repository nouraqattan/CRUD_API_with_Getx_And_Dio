import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/postList.dart';
import '../core/routes/approutes.dart';

class PostsScreen extends StatelessWidget {
  final PostController postController = Get.find<PostController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.toNamed(AppRoutes.addEditPost);
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
              onTap: () {
                Get.toNamed(AppRoutes.postDetail, arguments: post);
              },
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Get.toNamed(AppRoutes.addEditPost, arguments: post);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      postController.deletePost(post.id);
                    },
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}