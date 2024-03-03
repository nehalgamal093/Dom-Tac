import 'package:flutter/material.dart';

Widget playTrackBtn(IconData icon, bool isPlayed) {
  return Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomCenter,
        colors: isPlayed
            ? [
                const Color.fromARGB(255, 76, 134, 227),
                const Color.fromARGB(255, 2, 69, 184),
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
            colors: isPlayed
                ? [
                    const Color.fromARGB(255, 2, 69, 184),
                    const Color.fromARGB(255, 76, 134, 227),
                  ]
                : [
                    const Color.fromARGB(255, 1, 5, 12),
                    const Color.fromARGB(255, 2, 22, 55),
                  ],
          ),
        ),
        child: Icon(
          isPlayed ? Icons.pause : icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    ),
  );
}
