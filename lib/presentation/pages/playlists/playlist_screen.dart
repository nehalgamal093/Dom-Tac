import 'dart:io';
import 'package:dom_tac_music_player/presentation/pages/playlist_tracks/playlist_tracks_screen.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../resources/colors_manager.dart';
import '../appBar/top_app_bar.dart';
import '../drawer/drawer_widget.dart';
import '../tracks_list/widgets/track_tile.dart';

class PlaylistScreen extends StatefulWidget {
  final AudioPlayer player;
  const PlaylistScreen({super.key, required this.player});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  final _audioQuery = OnAudioQuery();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primaryColor,
      appBar: topAppBar(context, widget.player, true),
      endDrawer: drawerWidget(context, widget.player),
      body: FutureBuilder(
          future: _audioQuery.queryPlaylists(
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
                          String name = 'Nehal';

                          // ignore: use_build_context_synchronously
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PlaylistTracksList(
                                        player: widget.player,
                                        data: lines,
                                      )));
                        },
                        child: trackTile(
                            index,
                            listOfPlayLists[index].playlist.substring(
                                  15,
                                ),
                            listOfPlayLists[index].id,
                            context));
                  });
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}
