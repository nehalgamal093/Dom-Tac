import 'package:dom_tac_music_player/presentation/pages/player/widgets/player_btn.dart';
import 'package:flutter/material.dart';

Widget controlsBtns() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        playerBtn(Icons.shuffle),
        clickedBtn(Icons.play_arrow),
        playerBtn(Icons.repeat)
      ],
    ),
  );
}
