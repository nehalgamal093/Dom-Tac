import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

Widget removePlaylistBtn(
    OnAudioQuery audioQuery, int playlistId, BuildContext context) {
  return IconButton(
    onPressed: () async {
      audioQuery.removePlaylist(playlistId);

      Navigator.pop(context);
    },
    icon: const Icon(Icons.edit, color: Colors.white),
  );
}
