import 'package:flutter/material.dart';

class BodyInput extends StatelessWidget {
  final TextEditingController controller;

  const BodyInput({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(labelText: 'Body'),
      maxLines: 5,
    );
  }
}