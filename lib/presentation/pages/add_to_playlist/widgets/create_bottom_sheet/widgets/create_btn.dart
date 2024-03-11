import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

Widget createBtn(
    OnAudioQuery audioQuery, BuildContext context, String playlistName) {
  return TextButton(
    onPressed: () {
      audioQuery.createPlaylist('App Playlist $playlistName');
      Navigator.pop(context);
    },
    child: const Text(
      'Create',
      style: TextStyle(color: Colors.blue, fontSize: 20),
    ),
  );
}
