import 'package:audioplayers/audioplayers.dart';
import 'package:dom_tac_music_player/bloc/search_list_bloc/search_list_bloc.dart';
import 'package:dom_tac_music_player/presentation/pages/appBar/top_app_bar.dart';
import 'package:dom_tac_music_player/presentation/pages/drawer/drawer_widget.dart';
import 'package:dom_tac_music_player/presentation/pages/player/player_screen.dart';
import 'package:dom_tac_music_player/presentation/pages/tracks_list/widgets/track_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../resources/colors_manager.dart';

class TracksListScreen extends StatefulWidget {
  const TracksListScreen({super.key});

  @override
  State<TracksListScreen> createState() => _TracksListScreenState();
}

class _TracksListScreenState extends State<TracksListScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  final _audioQuery = OnAudioQuery();
  @override
  void initState() {
    super.initState();
    context.read<SearchListBloc>().add(GetListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primaryColor,
      appBar: topAppBar(context),
      endDrawer: drawerWidget(),
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
                            MaterialPageRoute(
                              builder: (context) => PlayerScreen(
                                list:
                                    snapshot.data!.map((e) => e.title).toList(),
                                songName: snapshot.data![index].title,
                                albumName:
                                    snapshot.data![index].genre ?? 'Music',
                                audioPlayer: audioPlayer,
                                path: snapshot.data![index].data,
                                id: snapshot.data![index].id,
                              ),
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
