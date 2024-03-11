import 'package:dom_tac_music_player/presentation/pages/add_to_playlist/widgets/create_bottom_sheet/create_playlist_bottom_sheet.dart';
import 'package:dom_tac_music_player/presentation/pages/add_to_playlist/widgets/playlist_tile.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../../resources/assets_manager.dart';

Widget createPlaylistBtn(OnAudioQuery audioQuery, BuildContext context) {
  return InkWell(
    onTap: () {
      createPlayListBottomSheet(context, audioQuery);
    },
    child: playListTile('Create Playlist', AssetsManager.playlist),
  );
}
// 15🐨
