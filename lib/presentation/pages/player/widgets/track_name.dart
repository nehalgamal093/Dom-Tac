import 'package:dom_tac_music_player/presentation/pages/player/widgets/title_animation.dart';
import 'package:flutter/material.dart';

Widget trackName() {
  return const SizedBox(
    width: 300,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ScrollingText(
          text: 'Avril Lavigne - Under My Skin',
          textStyle: TextStyle(fontSize: 30, color: Colors.white),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            'Let Go',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                overflow: TextOverflow.ellipsis),
          ),
        ),
      ],
    ),
  );
}
