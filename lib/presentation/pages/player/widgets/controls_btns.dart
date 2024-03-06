import 'package:dom_tac_music_player/presentation/pages/player/widgets/player_btn.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

AudioPlayer audioPlayer = AudioPlayer();
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
            child: playerBtn(Icons.repeat)),
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
                onTap: audioPlayer.play, child: clickedBtn(Icons.play_arrow))
            : InkWell(onTap: audioPlayer.pause, child: clickedBtn(Icons.pause)),
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
            child: playerBtn(Icons.shuffle))
      ],
    ),
  );
}
