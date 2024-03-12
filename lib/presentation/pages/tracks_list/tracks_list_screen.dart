import 'package:dom_tac_music_player/presentation/pages/tracks_list/widgets/track_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../../bloc/get_track_list_bloc/get_track_list_bloc.dart';
import '../../../bloc/song_details_bloc/song_details_bloc.dart';
import '../../../common/check_permission.dart';
import '../../../services/get_track_list.dart';

Widget tracksScreen(bool hasPermission, AudioPlayer player,
    OnAudioQuery onAudioQuery, BuildContext context) {
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
                        separatorBuilder: ((context, index) => const Divider(
                              thickness: .05,
                            )),
                        itemCount: state.songList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                loadAndPlayInitialAudio(
                                    index, context, player, Duration.zero);
                                context.read<SongDetailsBloc>().add(SongEvent(
                                    title: state.songList[index].title,
                                    artist: state.songList[index].artist!,
                                    id: state.songList[index].id,
                                    index: index));
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
//53