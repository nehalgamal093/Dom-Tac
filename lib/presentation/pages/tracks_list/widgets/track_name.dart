import 'package:dom_tac_music_player/presentation/pages/add_to_playlist/add_to_playlist_screen.dart';
import 'package:dom_tac_music_player/presentation/pages/tracks_list/widgets/liked_btn.dart';
import 'package:dom_tac_music_player/presentation/pages/tracks_list/widgets/played_btn.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

Widget trackNameWidget(int index, String title, BuildContext context,
    int audioId, OnAudioQuery onAudioQuery) {
  return SizedBox(
    width: 300,
    height: 60,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, overflow: TextOverflow.ellipsis),
          ),
        ),
        Row(
          children: [
            const Text('Let Go', style: TextStyle(color: Colors.white)),
            const Spacer(),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddToPlaylistScreen(
                                  audioId: audioId,
                                  onAudioQuery: onAudioQuery,
                                )));
                  },
                  child: addToPlaylistBtn(Icons.add)),
              const SizedBox(
                width: 10,
              ),
              playTrackBtn(
                Icons.favorite,
              )
            ])
          ],
        )
      ],
    ),
  );
}
