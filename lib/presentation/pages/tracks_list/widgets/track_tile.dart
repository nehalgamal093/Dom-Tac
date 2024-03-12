import 'dart:typed_data';

import 'package:dom_tac_music_player/presentation/pages/tracks_list/widgets/track_name.dart';
import 'package:dom_tac_music_player/presentation/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

Widget trackTile(int index, String title, int id, BuildContext context) {
  OnAudioQuery audioQuery = OnAudioQuery();
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder<Uint8List?>(
                future: audioQuery.queryArtwork(id, ArtworkType.AUDIO),
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
            trackNameWidget(index, title, context, id)
          ],
        ),
      ));
}
