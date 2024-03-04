import 'package:dom_tac_music_player/bloc/play_pause_bloc/play_pause_bloc.dart';
import 'package:dom_tac_music_player/presentation/pages/player/widgets/player_btn.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget controlsBtns(String path, AudioPlayer audioPlayer) {
  play() async {
    await audioPlayer.play(DeviceFileSource(path));
  }

  pause() async {
    await audioPlayer.pause();
  }

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        playerBtn(Icons.shuffle),
        BlocBuilder<PlayPauseBloc, PlayPauseState>(
          builder: (context, state) {
            if (state.playOrPauseStatus == PlayOrPauseStatus.pause) {
              return InkWell(
                  onTap: () {
                    play();
                    context.read<PlayPauseBloc>().add(PlayPause());
                  },
                  child: clickedBtn(Icons.play_arrow));
            } else {
              return InkWell(
                  onTap: () {
                    context.read<PlayPauseBloc>().add(PlayPause());
                    pause();
                  },
                  child: clickedBtn(Icons.pause));
            }
          },
        ),
        playerBtn(Icons.repeat)
      ],
    ),
  );
}
