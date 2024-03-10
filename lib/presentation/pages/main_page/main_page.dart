import 'package:dom_tac_music_player/bloc/is_home_bloc/is_home_bloc.dart';
import 'package:dom_tac_music_player/presentation/pages/playlists/playlist_screen.dart';
import 'package:dom_tac_music_player/presentation/pages/search/widgets/search_bar.dart';
import 'package:dom_tac_music_player/presentation/pages/search/widgets/search_list.dart';
import 'package:dom_tac_music_player/presentation/resources/colors_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../bloc/get_last_played_audio_bloc/get_last_played_audio_bloc.dart';
import '../../../bloc/get_track_list_bloc/get_track_list_bloc.dart';
import '../appBar/widgets/app_bar_btns.dart';
import '../search/search_screen.dart';
import '../small_player/small_player.dart';
import '../tracks_list/tracks_list_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _audioQuery = OnAudioQuery();
  final player = AudioPlayer();
  String? savedValue;
  bool _hasPermission = false;
  getValue(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    index = sharedPreferences.getInt(key);
    print('%% ${index}');
  }

  checkAndRequestPermissions({bool retry = false}) async {
    _hasPermission = await _audioQuery.checkAndRequest();

    _hasPermission ? setState(() {}) : null;
  }

  late SharedPreferences profileData;
  int? index;
  Future<void> _getValue() async {
    profileData = await SharedPreferences.getInstance();

    index = profileData.getInt('last-index')!;

    context.read<GetLastPlayedAudioBloc>().add(
          LastPlayedIndexEvent(lastPlayedIndex: index!),
        );
  }

  final TextEditingController songController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _getValue();
    checkAndRequestPermissions(retry: true);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorsManager.primaryColor,
        appBar: context.watch<IsHomeBloc>().state.isHome
            ? AppBar(
                actions: [
                  InkWell(
                    onTap: () {
                      context
                          .read<IsHomeBloc>()
                          .add(setCurrentWidgetEvent(isHome: false));
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => SearchScreen(player: player)));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [appBarBtns(Icons.search)],
                    ),
                  ),
                ],
                backgroundColor: ColorsManager.primaryColor,
                bottom: const TabBar(
                  indicatorColor: Colors.transparent,
                  dividerColor: Colors.transparent,
                  tabs: [
                    Text(
                      'Tracks',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Playlists',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                title: const Text(
                  'Dom Tac',
                  style: TextStyle(color: Colors.white),
                ),
              )
            : searchBar(context, songController),
        body: context.watch<IsHomeBloc>().state.isHome
            ? TabBarView(
                children: [
                  tracksScreen(_hasPermission, player, _audioQuery),
                  playlistScreen(_audioQuery, player),
                ],
              )
            : searchList(context, player),
        bottomSheet: smallPlayer(
            context,
            player,
            context.read<GetTrackListBloc>().state.songList,
            context.read<GetLastPlayedAudioBloc>().state.lastPlayedSongIndex,
            _audioQuery),
      ),
    );
  }
}
