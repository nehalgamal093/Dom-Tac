import 'package:dom_tac_music_player/presentation/pages/player/widgets/title_animation.dart';
import 'package:flutter/material.dart';

Widget trackName(String songName, String albumName) {
  return SizedBox(
    width: 300,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ScrollingText(
          text: songName,
          textStyle: const TextStyle(fontSize: 30, color: Colors.white),
        ),
         Align(
          alignment: Alignment.center,
          child: Text(
            albumName,
            style:const TextStyle(
                color: Colors.white,
                fontSize: 20,
                overflow: TextOverflow.ellipsis),
          ),
        ),
      ],
    ),
  );
}
