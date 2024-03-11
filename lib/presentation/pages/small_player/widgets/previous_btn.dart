import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

Widget previousBtn(AudioPlayer player) {
  return InkWell(
    onTap: () {
      player.seekToPrevious();
    },
    child: const Icon(
      Icons.skip_previous_outlined,
      size: 40,
      color: Colors.white,
    ),
  );
}
