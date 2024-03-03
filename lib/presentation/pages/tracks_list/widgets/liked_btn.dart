import 'package:flutter/material.dart';

Widget likeTrackBtn(IconData icon, bool isLiked) {
  return Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomCenter,
        colors: isLiked
            ? [
                const Color.fromARGB(255, 241, 53, 53),
                const Color.fromARGB(255, 144, 3, 3),
              ]
            : [
                const Color.fromARGB(255, 2, 22, 55),
                const Color.fromARGB(255, 1, 5, 12),
              ],
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: isLiked
                ? [
                    const Color.fromARGB(255, 144, 3, 3),
                    const Color.fromARGB(255, 241, 53, 53),
                  ]
                : [
                    const Color.fromARGB(255, 1, 5, 12),
                    const Color.fromARGB(255, 2, 22, 55),
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
