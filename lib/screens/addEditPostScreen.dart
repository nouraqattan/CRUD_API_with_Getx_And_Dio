import 'package:fakeapi_withdio_getx/controllers/postedit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/postList.dart';
import '../model/postModel.dart';


class AddOrEditPostScreen extends StatelessWidget {
  final PostEditController postEditController = Get.find<PostEditController>();
  final PostController postController = Get.find<PostController>();
  final Post? post;

  AddOrEditPostScreen({Key? key}) : post = Get.arguments, super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: post?.title ?? '');
    final bodyController = TextEditingController(text: post?.body ?? '');

    return Scaffold(
      appBar: AppBar(
        title: Text(post == null ? 'Add Post' : 'Edit Post'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
              onPressed: () async {
                final title = titleController.text.trim();
                final body = bodyController.text.trim();

                if (title.isNotEmpty && body.isNotEmpty) {
                  try {
                    postEditController.isLoading(true);
                    if (post == null) {
                      final newPost = Post(userId: 1, id: 0, title: title, body: body);
                      await postEditController.createPost(newPost);
                    } else {
                      final updatedPost = Post(userId: post!.userId, id: post!.id, title: title, body: body);
                      await postEditController.editPost(updatedPost);
                    }
                    Get.back(result: true);
                  } catch (e) {
                    Get.snackbar("Error", "Failed to save post: ${e.toString()}");
                  } finally {
                    postEditController.isLoading(false);
                  }
                } else {
                  Get.snackbar("Error", "Title and Body cannot be empty");
                }
              }
          ),
        ],
      ),
      body: Obx(() {
        if (postEditController.isLoading.isTrue) {
          return Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: "Title"),
              ),
              SizedBox(height: 16),
              TextField(
                controller: bodyController,
                decoration: InputDecoration(labelText: "Body"),
                maxLines: 5,
              ),
            ],
          ),
        );
      }),
    );
  }
}