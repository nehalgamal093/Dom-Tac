import 'package:dom_tac_music_player/common/check_permission.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

Widget playBtn(AudioPlayer player, BuildContext context, int lastPlayedIndex,
    int duration) {
  return InkWell(
    onTap: () {
      if (player.currentIndex == null) {
        loadAndPlayInitialAudio(
            lastPlayedIndex, context, player, Duration(seconds: duration));
      } else {
        player.play();
      }
    },
    child: const Icon(
      Icons.play_arrow,
      color: Colors.white,
      size: 40,
    ),
  );
}
