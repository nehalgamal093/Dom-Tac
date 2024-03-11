import 'package:flutter/material.dart';

Widget playPauseBtn(IconData icon) {
  return Container(
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromARGB(255, 62, 127, 232),
          Color.fromARGB(255, 6, 70, 181),
        ],
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 70,
        height: 70,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 6, 70, 181),
              Color.fromARGB(255, 62, 127, 232),
            ],
          ),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 40,
        ),
      ),
    ),
  );
}
