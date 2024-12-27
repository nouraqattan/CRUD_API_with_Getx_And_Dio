import 'package:flutter/material.dart';

class TitleInput extends StatelessWidget {
  final TextEditingController controller;

  const TitleInput({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(labelText: 'Title'),
    );
  }
}