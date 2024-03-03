import 'package:dom_tac_music_player/presentation/resources/assets_manager.dart';
import 'package:flutter/material.dart';

Widget trackPhoto(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          offset: const Offset(5, 0),
          blurRadius: 50,
          color: const Color.fromARGB(255, 207, 200, 208).withOpacity(0.3),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipOval(
        child: Container(
          width: 300,
          height: 300,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            color: Colors.black,
            image: DecorationImage(
              image: AssetImage(
                AssetsManager.albumCover,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
