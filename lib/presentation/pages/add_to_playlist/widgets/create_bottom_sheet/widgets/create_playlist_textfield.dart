import 'package:flutter/material.dart';

Widget createPlayListTextField(TextEditingController controller) {
  return TextField(
    style: const TextStyle(color: Colors.white),
    controller: controller,
    decoration: const InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
    ),
  );
}
