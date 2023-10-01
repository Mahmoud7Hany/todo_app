import 'package:flutter/material.dart';

class TextFieldAdd extends StatelessWidget {
  const TextFieldAdd({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLength: 20,
      decoration: InputDecoration(
        hintText: 'Add New Task',
        labelText: 'Task',
        prefixIcon: const Icon(Icons.task),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
