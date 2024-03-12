import 'package:dom_tac_music_player/presentation/pages/add_to_playlist/widgets/edit_playlist_btn.dart';
import 'package:dom_tac_music_player/presentation/pages/add_to_playlist/widgets/playlist_tile.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../../resources/assets_manager.dart';
import 'create_playlist_btn.dart';

Widget playlistList(OnAudioQuery audioQuery, int audioId) {
  return FutureBuilder(
      future: audioQuery.queryPlaylists(
          sortType: null,
          orderType: OrderType.ASC_OR_SMALLER,
          uriType: UriType.EXTERNAL,
          ignoreCase: true),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          String subString = 'App Playlist';
          List<PlaylistModel> listOfPlayLists = snapshot.data!
              .where((e) => e.playlist.contains(subString))
              .toList();
          return ListView(
            shrinkWrap: true,
            children: [
              createPlaylistBtn(audioQuery, context),
              playListTile('Favourite playlist', AssetsManager.heart),
              for (final item in listOfPlayLists)
                playListItem(
                    context, audioQuery, item.id, item.playlist, audioId)
            ],
          );
        } else {
          return const CircularProgressIndicator();
        }
      });
}
// 35🐨