import 'package:flutter/material.dart';

Widget addToPlaylistBtn(IconData icon) {
  return Container(
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromARGB(255, 2, 22, 55),
          Color.fromARGB(255, 1, 5, 12),
        ],
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 20,
        height: 20,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 1, 5, 12),
              Color.fromARGB(255, 2, 22, 55),
            ],
          ),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 10,
        ),
      ),
    ),
  );
}
