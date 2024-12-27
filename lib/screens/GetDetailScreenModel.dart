import 'package:flutter/material.dart';

class PostDetailScreen extends StatelessWidget {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostDetailScreen({required this.userId, required this.id, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("User ID: $userId", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("ID: $id", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text(body),
          ],
        ),
      ),
    );
  }
}