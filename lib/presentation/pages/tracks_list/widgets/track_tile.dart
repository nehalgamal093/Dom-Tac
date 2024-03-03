import 'package:dom_tac_music_player/presentation/pages/tracks_list/widgets/track_name.dart';
import 'package:dom_tac_music_player/presentation/resources/assets_manager.dart';
import 'package:flutter/material.dart';

Widget trackTile(int index) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    child: Container(
      width: 300,
      height: 80,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 2, 22, 55),
            Color.fromARGB(255, 3, 18, 44),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: Image.asset(AssetsManager.albumCover),
            ),
            const SizedBox(width: 10),
            trackNameWidget(index)
          ],
        ),
      ),
    ),
  );
}