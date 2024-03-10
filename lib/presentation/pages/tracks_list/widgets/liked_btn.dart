import 'package:flutter/material.dart';

Widget addToPlaylistBtn(IconData icon) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Icon(
      icon,
      color: Colors.white,
      size: 20,
    ),
  );
}
