import 'package:flutter/material.dart';

Widget cancelBtn(BuildContext context) {
  return TextButton(
    onPressed: () {
      Navigator.pop(context);
    },
    child: const Text(
      'Cancel',
      style: TextStyle(color: Colors.blue, fontSize: 20),
    ),
  );
}
