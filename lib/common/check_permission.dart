import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import '../bloc/get_track_list_bloc/get_track_list_bloc.dart';

Future<void> loadAndPlayInitialAudio(
    int i, BuildContext context, AudioPlayer player, Duration duration) async {
  List<String> songs = context
      .read<GetTrackListBloc>()
      .state
      .songList
      .map((e) => e.data)
      .toList();

  await player.setAudioSource(
      ConcatenatingAudioSource(
          children: songs.map((e) => AudioSource.file(e)).toList()),
      initialIndex: i,
      initialPosition: duration);
  player.play();
}
