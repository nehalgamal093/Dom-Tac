import 'package:dom_tac_music_player/bloc/search_list_bloc/search_list_bloc.dart';
import 'package:dom_tac_music_player/presentation/pages/search/widgets/search_bar.dart';
import 'package:dom_tac_music_player/presentation/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import 'package:on_audio_query/on_audio_query.dart';

import '../player/player_screen.dart';
import '../tracks_list/widgets/track_tile.dart';

class SearchScreen extends StatefulWidget {
  final AudioPlayer player;
  const SearchScreen({super.key, required this.player});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController songController = TextEditingController();
  final _audioQuery = OnAudioQuery();

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<SearchListBloc>().state.songList;

    return Scaffold(
      backgroundColor: ColorsManager.primaryColor,
      appBar: searchBar(context, songController),
      body: FutureBuilder(
          future: _audioQuery.querySongs(
              sortType: null,
              orderType: OrderType.ASC_OR_SMALLER,
              uriType: UriType.EXTERNAL,
              ignoreCase: true),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: todos.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlayerScreen(
                                songs: todos.map((e) => e.data).toList(),
                                songModel: todos,
                                currentIndex: index,
                                songName: todos[index].title,
                                albumName: todos[index].genre ?? 'Music',
                                path: todos[index].data,
                                player: widget.player,
                              ),
                            ),
                          );
                        },
                        child: trackTile(
                          index,
                          todos[index].title.toString(),
                          todos[index].id,
                        ));
                  });
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}
