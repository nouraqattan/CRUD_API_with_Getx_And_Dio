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
            onPressed: () async {
              final result = await Get.toNamed(AppRoutes.addEditPost);
              if (result == true) {
                await postController.fetchPosts();
              }
            },
          ),
        ],
      ),
      body: Obx(() {
        if (postController.isLoading.isTrue) {
          return Center(child: CircularProgressIndicator());
        }

        if (postController.posts.isEmpty) {
          return Center(child: Text("No posts available"));
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
                    onPressed: () async {
                      final result = await Get.toNamed(AppRoutes.addEditPost, arguments: post);
                      if (result == true) {
                        await postController.fetchPosts();
                      }
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