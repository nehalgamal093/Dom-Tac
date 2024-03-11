import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

Widget playBtn(AudioPlayer player) {
  return InkWell(
    onTap: player.play,
    child: const Icon(
      Icons.play_arrow,
      color: Colors.white,
      size: 40,
    ),
  );
}
