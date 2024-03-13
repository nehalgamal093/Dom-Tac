import 'package:dom_tac_music_player/bloc/get_track_list_bloc/get_track_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../../../bloc/search_list_bloc/search_list_bloc.dart';
import '../../../../bloc/song_details_bloc/song_details_bloc.dart';
import '../../../../services/get_track_list.dart';
import '../../tracks_list/widgets/track_tile.dart';

Widget searchList(
    BuildContext context, AudioPlayer player, OnAudioQuery audioQuery) {
  final songs = context.watch<GetTrackListBloc>().state.songList;
  final todos = context.watch<SearchListBloc>().state.songList;
  // ignore: no_leading_underscores_for_local_identifiers
  Future<void> _loadAndPlayInitialAudio(int i) async {
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
        initialPosition: Duration.zero);

    player.play();
  }

  return BlocProvider(
    create: (context) =>
        GetTrackListBloc(songsList: SongsList())..add(TrackListEvent()),
    child: BlocBuilder<GetTrackListBloc, GetTrackListState>(
      builder: (context, state) {
        if (state.status == Status.loaded) {
          return ListView.builder(
              itemCount: todos.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      int indexOfCurrentSongInMainList = songs.indexWhere(
                          (element) =>
                              element.title.contains(todos[index].title));

                      _loadAndPlayInitialAudio(indexOfCurrentSongInMainList);
                      context.read<SongDetailsBloc>().add(SongEvent(
                          title: state.songList[index].title,
                          artist: state.songList[index].artist!,
                          id: state.songList[index].id,
                          index: index));
                    },
                    child: trackTile(index, todos[index].title.toString(),
                        todos[index].id, context, audioQuery));
              });
        } else {
          return Container();
        }
      },
    ),
  );
}
