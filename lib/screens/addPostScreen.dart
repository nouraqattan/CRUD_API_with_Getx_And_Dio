import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/postControllers.dart';
import '../model/postModel.dart';
import '../widgets/addpostScreen_widgets/bodyInputs.dart';
import '../widgets/addpostScreen_widgets/submitsButtomsWidget.dart';
import '../widgets/addpostScreen_widgets/titleinputs.dart';

class AddPostScreen extends StatelessWidget {
  final PostController postController = Get.find();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Post')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TitleInput(controller: titleController),
            const SizedBox(height: 16),
            BodyInput(controller: bodyController),
            const SizedBox(height: 16),
            SubmitButton(
              onPressed: () async {
                final title = titleController.text.trim();
                final body = bodyController.text.trim();
                if (title.isNotEmpty && body.isNotEmpty) {
                  final newPost = Post(userId: 1, id: 0, title: title, body: body);
                  await postController.createPost(newPost);
                  Get.back(); // Go back to the posts list
                } else {
                  Get.snackbar("Error", "Title and Body cannot be empty");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}