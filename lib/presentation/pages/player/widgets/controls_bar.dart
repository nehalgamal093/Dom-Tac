import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

Widget controlsBar(
    Duration progress, Duration buffered, Duration total, AudioPlayer player) {
  return SizedBox(
    width: 350,
    child: Column(children: [
      ProgressBar(
        timeLabelTextStyle: TextStyle(color: Colors.white),
        progress: progress,
        buffered: buffered,
        total: total,
        onSeek: (duration) {
          player.seek(duration);
        },
      )
      // SliderTheme(
      //   data: const SliderThemeData(
      //       thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5)),
      //   child: Slider(
      //       min: 0,
      //       max: 100,
      //       activeColor: const Color(0xff47a6bc),
      //       inactiveColor: const Color.fromARGB(255, 87, 93, 102),
      //       thumbColor: const Color(0xff47a6bc),
      //       value: 50,
      //       onChanged: (val) {}),
      // )
    ]),
  );
}
