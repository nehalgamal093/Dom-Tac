import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

Widget nextBtn(AudioPlayer player) {
  return InkWell(
    onTap: () async {
      player.seekToNext();
    },
    child: const Icon(
      Icons.skip_next_outlined,
      color: Colors.white,
      size: 40,
    ),
  );
}
