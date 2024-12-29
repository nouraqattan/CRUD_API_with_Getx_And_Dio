import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../model/postModel.dart';

class PostDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Post post = Get.arguments;

    return Scaffold(
      appBar: AppBar(title: Text(post.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("User ID: ${post.userId}", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("ID: ${post.id}", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text(post.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text(post.body),
          ],
        ),
      ),
    );
  }
}