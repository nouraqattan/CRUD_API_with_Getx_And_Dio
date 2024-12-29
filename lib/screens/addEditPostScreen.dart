import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/postedit.dart';
import '../model/postModel.dart';


class AddOrEditPostScreen extends StatelessWidget {
  final PostEditController postEditController = Get.find<PostEditController>();
  final Post? post;

  AddOrEditPostScreen({Key? key}) : post = Get.arguments, super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController(text: post?.title ?? '');
    final TextEditingController bodyController = TextEditingController(text: post?.body ?? '');

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
                  if (post == null) {
                    // Create a new post
                    final newPost = Post(
                      userId: 1,
                      id: 0,
                      title: title,
                      body: body,
                    );
                    await postEditController.createPost(newPost);
                  } else {

                    Post updatedPost = Post(
                      userId: post!.userId,
                      id: post!.id,
                      title: title,
                      body: body,
                    );
                    await postEditController.editPost(updatedPost);
                  }
                  Get.back();
                } catch (e) {
                  Get.snackbar("Error", "Failed to save post: $e");
                }
              } else {
                Get.snackbar("Error", "Title and Body cannot be empty");
              }
            },
          ),
        ],
      ),
      body: Padding(
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
      ),
    );
  }
}