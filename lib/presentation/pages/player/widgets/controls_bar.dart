import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

Widget controlsBar(
    Duration progress, Duration buffered, Duration total, AudioPlayer player) {
  return SizedBox(
    width: 350,
    child: Column(children: [
      ProgressBar(
        timeLabelTextStyle: const TextStyle(color: Colors.white),
        progress: progress,
        buffered: buffered,
        total: total,
        onSeek: (duration) {
          player.seek(duration);
        },
      )
    ]),
  );
}
//22