import 'package:flutter/material.dart';

Widget playListTile(String playlistName, String playlistImage) {
  return Padding(
    padding: const EdgeInsets.only(left: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 300,
          height: 60,
          child: Row(
            children: [
              Image.asset(playlistImage),
              const SizedBox(width: 10),
              Text(
                playlistName,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Divider(
          height: 5,
          thickness: .05,
        ),
        const SizedBox(height: 20),
      ],
    ),
  );
}
// 37🐨