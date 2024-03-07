import 'package:dom_tac_music_player/presentation/resources/assets_manager.dart';
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
              SizedBox(width: 10),
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
        SizedBox(height: 20),
        const Divider(
          height: 5,
          thickness: .05,
        ),
        SizedBox(height: 20),
      ],
    ),
  );
}
