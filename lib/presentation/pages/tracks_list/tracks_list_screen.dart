import 'package:dom_tac_music_player/presentation/pages/appBar/top_app_bar.dart';
import 'package:dom_tac_music_player/presentation/pages/drawer/drawer_widget.dart';
import 'package:dom_tac_music_player/presentation/pages/player/player_screen.dart';
import 'package:dom_tac_music_player/presentation/pages/tracks_list/widgets/track_tile.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:page_transition/page_transition.dart';
import '../../resources/colors_manager.dart';

class TracksListScreen extends StatefulWidget {
  const TracksListScreen({super.key});

  @override
  State<TracksListScreen> createState() => _TracksListScreenState();
}

class _TracksListScreenState extends State<TracksListScreen> {
  final _audioQuery = OnAudioQuery();
  final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primaryColor,
      appBar: topAppBar(context, player, false),
      endDrawer: drawerWidget(context, player),
      body: FutureBuilder(
          future: _audioQuery.querySongs(
              sortType: null,
              orderType: OrderType.ASC_OR_SMALLER,
              uriType: UriType.EXTERNAL,
              ignoreCase: true),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              duration: const Duration(milliseconds: 500),
                              reverseDuration:
                                  const Duration(milliseconds: 500),
                              type: PageTransitionType.leftToRight,
                              child: PlayerScreen(
                                  currentIndex: index,
                                  songs: snapshot.data!
                                      .map((e) => e.data)
                                      .toList(),
                                  player: player,
                                  songName: snapshot.data![index].title,
                                  albumName:
                                      snapshot.data![index].genre ?? 'Music',
                                  path: snapshot.data![index].data,
                                  songModel: snapshot.data!),
                            ),
                          );
                        },
                        child: trackTile(
                          index,
                          snapshot.data![index].title.toString(),
                          snapshot.data![index].id,
                        ));
                  });
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}
