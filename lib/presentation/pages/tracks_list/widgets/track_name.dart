import 'package:dom_tac_music_player/presentation/pages/tracks_list/widgets/liked_btn.dart';
import 'package:dom_tac_music_player/presentation/pages/tracks_list/widgets/played_btn.dart';
import 'package:flutter/material.dart';

Widget trackNameWidget(int index) {
  return SizedBox(
    width: 300,
    height: 60,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Avril Lavigne - Under My Skin',
          style: TextStyle(color: Colors.white),
        ),
        Row(
          children: [
            const Text('Let Go', style: TextStyle(color: Colors.white)),
            const Spacer(),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              index == 0
                  ? likeTrackBtn(Icons.favorite, true)
                  : likeTrackBtn(Icons.favorite, false),
              const SizedBox(
                width: 10,
              ),
              index == 2
                  ? playTrackBtn(Icons.play_arrow, true)
                  : playTrackBtn(Icons.play_arrow, false)
            ])
          ],
        )
      ],
    ),
  );
}
