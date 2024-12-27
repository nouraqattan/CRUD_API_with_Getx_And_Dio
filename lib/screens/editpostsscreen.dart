import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/postControllers.dart';
import '../model/postModel.dart';
class EditPostScreen extends StatelessWidget {
  final Post post;
  final PostController postController = Get.find();

  EditPostScreen({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController(text: post.title);
    final TextEditingController bodyController = TextEditingController(text: post.body);

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Post'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () async {
              Post updatedPost = Post(
                userId: post.userId,
                id: post.id,
                title: titleController.text,
                body: bodyController.text,
              );
              await postController.editPost(updatedPost);
              Get.back();
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