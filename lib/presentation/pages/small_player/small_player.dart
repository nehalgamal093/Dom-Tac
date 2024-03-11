import 'dart:typed_data';
import 'package:dom_tac_music_player/presentation/pages/small_player/widgets/next_btn.dart';
import 'package:dom_tac_music_player/presentation/pages/small_player/widgets/pause_btn.dart';
import 'package:dom_tac_music_player/presentation/pages/small_player/widgets/play_btn.dart';
import 'package:dom_tac_music_player/presentation/pages/small_player/widgets/previous_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../bloc/song_details_bloc/song_details_bloc.dart';
import '../../resources/assets_manager.dart';
import '../player/player_screen.dart';

Widget smallPlayer(BuildContext context, AudioPlayer player,
    List<SongModel> model, int index, OnAudioQuery onAudioQuery) {
  Future<void> saveLastSong(int lastPlayedAudioIndex) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt('last-index', lastPlayedAudioIndex);
  }

  double height = MediaQuery.of(context).size.height;
  return InkWell(
    onTap: () async {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlayerScreen(
                songModel: model, path: model[index].data, player: player),
          ));
    },
    child: StreamBuilder<PlayerState>(
        stream: player.playerStateStream,
        builder: (context, snapshot) {
          final playing = snapshot.data?.playing;
          if (snapshot.hasData) {
            player.currentIndex == null
                ? null
                : saveLastSong(player.currentIndex!);
            player.currentIndex == null
                ? context.read<SongDetailsBloc>().add(SongEvent(
                    title: model[index].title,
                    artist: model[index].artist!,
                    id: model[index].id,
                    index: index))
                : context.read<SongDetailsBloc>().add(SongEvent(
                    title: model[player.currentIndex!].title,
                    artist: model[player.currentIndex!].artist!,
                    id: model[player.currentIndex!].id,
                    index: player.currentIndex!));
            return Container(
              height: height * .1,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 60, 59, 60),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      FutureBuilder<Uint8List?>(
                          future: onAudioQuery.queryArtwork(
                              player.currentIndex == null
                                  ? model[index].id
                                  : context.watch<SongDetailsBloc>().state.id,
                              ArtworkType.AUDIO),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.memory(snapshot.data!),
                              );
                            } else {
                              return SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Image.asset(AssetsManager.albumCover));
                            }
                          }),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              player.currentIndex == null
                                  ? model[index].title
                                  : context
                                      .watch<SongDetailsBloc>()
                                      .state
                                      .title,
                              style: const TextStyle(
                                  color: Colors.white,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            Text(
                              player.currentIndex == null
                                  ? model[index].artist!
                                  : context
                                      .watch<SongDetailsBloc>()
                                      .state
                                      .artist,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 40),
                      previousBtn(player),
                      playing != true ? playBtn(player) : pauseBtn(player),
                      nextBtn(player),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  )
                ],
              ),
            );
          } else {
            return Container();
          }
        }),
  );
}
//165