import 'dart:io';
import 'package:dom_tac_music_player/presentation/pages/playlist_tracks/playlist_tracks_screen.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../tracks_list/widgets/track_tile.dart';

Widget playlistScreen(OnAudioQuery audioQuery, AudioPlayer player) {
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
          return ListView.builder(
              itemCount: listOfPlayLists.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () async {
                      final file = File(listOfPlayLists[index].data!);
                      final lines = await file.readAsLines();
                      print('lines are ${listOfPlayLists[index].getMap}');
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlaylistTracksList(
                                    player: player,
                                    data: lines,
                                    audioQuery: audioQuery,
                                  )));
                    },
                    child: trackTile(
                        index,
                        listOfPlayLists[index].playlist.substring(
                              12,
                            ),
                        listOfPlayLists[index].id,
                        context,
                        audioQuery));
              });
        } else {
          return const CircularProgressIndicator();
        }
      });
}
