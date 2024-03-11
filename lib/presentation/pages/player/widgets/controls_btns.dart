import 'package:dom_tac_music_player/presentation/pages/player/widgets/play_pause_btn.dart';
import 'package:dom_tac_music_player/presentation/pages/player/widgets/next_previous_btn.dart';
import 'package:dom_tac_music_player/presentation/pages/player/widgets/shuffle_repeat_btn.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

Widget controlsBtns(
  String path,
  bool isPlaying,
  AudioPlayer audioPlayer,
) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
            onTap: () {
              audioPlayer.setLoopMode(LoopMode.one);
            },
            child: shuffleRepeatBtn(Icons.repeat)),
        InkWell(
          onTap: () {
            audioPlayer.seekToPrevious();
          },
          child: nextAndPreviousBtn(
            Icons.skip_previous_rounded,
          ),
        ),
        isPlaying != true
            ? InkWell(
                onTap: audioPlayer.play, child: playPauseBtn(Icons.play_arrow))
            : InkWell(
                onTap: audioPlayer.pause, child: playPauseBtn(Icons.pause)),
        InkWell(
          onTap: () {
            audioPlayer.seekToNext();
          },
          child: nextAndPreviousBtn(
            Icons.skip_next_rounded,
          ),
        ),
        InkWell(
            onTap: () {
              audioPlayer.setShuffleModeEnabled(true);
            },
            child: shuffleRepeatBtn(Icons.shuffle))
      ],
    ),
  );
}
//52