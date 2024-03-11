import 'package:flutter/material.dart';

Widget nextAndPreviousBtn(IconData icon) {
  return Container(
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromARGB(255, 144, 4, 58),
          Color.fromARGB(255, 90, 2, 36),
        ],
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 30,
        height: 30,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 90, 2, 36),
              Color.fromARGB(255, 144, 4, 58),
            ],
          ),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    ),
  );
}
//41