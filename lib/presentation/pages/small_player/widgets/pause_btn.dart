import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

Widget pauseBtn(AudioPlayer player) {
  return InkWell(
    onTap: player.pause,
    child: const Icon(
      Icons.pause,
      color: Colors.white,
      size: 40,
    ),
  );
}
