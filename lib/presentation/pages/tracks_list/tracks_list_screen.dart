import 'package:dom_tac_music_player/presentation/pages/tracks_list/widgets/track_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:page_transition/page_transition.dart';
import '../../../bloc/get_track_list_bloc/get_track_list_bloc.dart';
import '../../../bloc/song_details_bloc/song_details_bloc.dart';
import '../../../services/get_track_list.dart';
import '../player/player_screen.dart';

Widget tracksScreen(
    bool hasPermission, AudioPlayer player, OnAudioQuery onAudioQuery) {
  return !hasPermission
      ? Container()
      : BlocProvider(
          create: (context) =>
              GetTrackListBloc(songsList: SongsList())..add(TrackListEvent()),
          child: BlocBuilder<GetTrackListBloc, GetTrackListState>(
            builder: (context, state) {
              if (state.status == Status.loaded) {
                return Column(children: [
                  Expanded(
                    child: ListView.separated(
                        separatorBuilder: ((context, index) => Divider(
                              thickness: .05,
                            )),
                        itemCount: state.songList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    duration: const Duration(milliseconds: 500),
                                    reverseDuration:
                                        const Duration(milliseconds: 500),
                                    type: PageTransitionType.leftToRight,
                                    child: PlayerScreen(
                                        currentIndex: index,
                                        songs: state.songList
                                            .map((e) => e.data)
                                            .toList(),
                                        player: player,
                                        songName: state.songList[index].title,
                                        albumName:
                                            state.songList[index].genre ??
                                                'Music',
                                        path: state.songList[index].data,
                                        songModel: state.songList),
                                  ),
                                );
                              },
                              child: trackTile(
                                  index,
                                  state.songList[index].title.toString(),
                                  state.songList[index].id,
                                  context));
                        }),
                  ),
                ]);
              } else {
                return Container();
              }
            },
          ),
        );
}
