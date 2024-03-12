import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget pauseBtn(AudioPlayer player) {
  Future<void> saveDuration(int lastDuration) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt('last-duration', lastDuration);
  }

  return InkWell(
    onTap: () {
      player.pause();
      player.positionStream.listen((event) {
        saveDuration(event.inSeconds);
      });
    },
    child: const Icon(
      Icons.pause,
      color: Colors.white,
      size: 40,
    ),
  );
}
