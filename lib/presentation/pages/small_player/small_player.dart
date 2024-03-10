import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../resources/assets_manager.dart';

Widget smallPlayer(BuildContext context, AudioPlayer player,
    List<SongModel> model, int index, OnAudioQuery onAudioQuery) {
  double height = MediaQuery.of(context).size.height;
  return StreamBuilder<PlayerState>(
      stream: player.playerStateStream,
      builder: (context, snapshot) {
        final playing = snapshot.data?.playing;
        if (snapshot.hasData) {
          return Container(
            height: height * .1,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 60, 59, 60),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
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
                            model[player.currentIndex == null
                                    ? index
                                    : player.currentIndex!]
                                .id,
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
                            model[player.currentIndex == null
                                    ? index
                                    : player.currentIndex!]
                                .title,
                            style: const TextStyle(
                                color: Colors.white,
                                overflow: TextOverflow.ellipsis),
                          ),
                          Text(
                            model[player.currentIndex == null
                                    ? index
                                    : player.currentIndex!]
                                .artist!,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 40),
                    InkWell(
                      onTap: () async {},
                      child: const Icon(
                        Icons.skip_previous_outlined,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    playing != true
                        ? InkWell(
                            onTap: player.play,
                            child: const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 40,
                            ),
                          )
                        : InkWell(
                            onTap: player.pause,
                            child: const Icon(
                              Icons.pause,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                    InkWell(
                      onTap: () async {},
                      child: const Icon(
                        Icons.skip_next_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
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
      });
}
