import 'package:dom_tac_music_player/presentation/pages/add_to_playlist/widgets/edit_playlist_bottom_sheet/edit_playlist_bottom_sheet.dart';
import 'package:dom_tac_music_player/presentation/pages/add_to_playlist/widgets/playlist_tile.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../../resources/assets_manager.dart';

Widget playListItem(BuildContext context, OnAudioQuery audioQuery, int id,
    String playlist, int audioId) {
  return InkWell(
    onLongPress: () {
      editPlaylistBottomSheet(context, audioQuery, id);
    },
    onTap: () async {
      audioQuery.addToPlaylist(id, audioId);
    },
    child: playListTile(
        playlist.substring(
          12,
        ),
        AssetsManager.music),
  );
}
//20 🐨