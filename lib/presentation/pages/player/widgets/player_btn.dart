import 'package:flutter/material.dart';

Widget playerBtn(IconData icon) {
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
      // boxShadow: [
      //   BoxShadow(
      //     offset: const Offset(1, 0),
      //     blurRadius: 3,
      //     color: Colors.white.withOpacity(0.3),
      //   ),
      // ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 50,
        height: 50,
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
          size: 20,
        ),
      ),
    ),
  );
}

Widget clickedBtn(IconData icon) {
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
