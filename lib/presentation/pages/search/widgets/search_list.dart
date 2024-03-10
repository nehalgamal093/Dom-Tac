import 'package:dom_tac_music_player/bloc/get_track_list_bloc/get_track_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../bloc/search_list_bloc/search_list_bloc.dart';
import '../../player/player_screen.dart';
import '../../tracks_list/widgets/track_tile.dart';

Widget searchList(BuildContext context, AudioPlayer player) {
  // final _audioQuery = OnAudioQuery();
  final songs = context.watch<GetTrackListBloc>().state.songList;
  final todos = context.watch<SearchListBloc>().state.songList;

  int ok = songs.indexWhere((element) => element.title.contains('24'));

  return ListView.builder(
      itemCount: todos.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {
              print('this index $ok');
              Navigator.push(
                context,
                PageTransition(
                  duration: const Duration(milliseconds: 500),
                  reverseDuration: const Duration(milliseconds: 500),
                  type: PageTransitionType.leftToRight,
                  child: PlayerScreen(
                      songs: todos.map((e) => e.data).toList(),
                      songModel: todos,
                      currentIndex: index,
                      songName: todos[index].title,
                      albumName: todos[index].genre ?? 'Music',
                      path: todos[index].data,
                      player: player),
                ),
              );
            },
            child: trackTile(index, todos[index].title.toString(),
                todos[index].id, context));
      });
}
