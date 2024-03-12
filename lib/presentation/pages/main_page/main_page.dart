import 'package:dom_tac_music_player/bloc/get_last_played_position_bloc/get_last_played_position_bloc.dart';
import 'package:dom_tac_music_player/bloc/is_home_bloc/is_home_bloc.dart';
import 'package:dom_tac_music_player/presentation/pages/main_page/widgets/main_app_bar.dart';
import 'package:dom_tac_music_player/presentation/pages/playlists/playlist_screen.dart';
import 'package:dom_tac_music_player/presentation/pages/search/widgets/search_list.dart';
import 'package:dom_tac_music_player/presentation/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../bloc/get_last_played_audio_bloc/get_last_played_audio_bloc.dart';
import '../../../bloc/get_track_list_bloc/get_track_list_bloc.dart';
import '../small_player/small_player.dart';
import '../tracks_list/tracks_list_screen.dart';
import 'package:permission_handler/permission_handler.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final audioQuery = OnAudioQuery();
  final player = AudioPlayer();
  late SharedPreferences profileData;

  int? index;
  int? lastPlayedDuration;

  final TextEditingController songController = TextEditingController();

  Future<void> _getValue() async {
    profileData = await SharedPreferences.getInstance();
    index = profileData.getInt('last-index')!;
    // ignore: use_build_context_synchronously
    context.read<GetLastPlayedAudioBloc>().add(
          LastPlayedIndexEvent(lastPlayedIndex: index!),
        );
  }

  Future<void> getPosition() async {
    profileData = await SharedPreferences.getInstance();
    lastPlayedDuration = profileData.getInt('last-duration')!;
    // ignore: use_build_context_synchronously
    context.read<GetLastPlayedPositionBloc>().add(
          LastPLayedPositionEvent(lastPlayedPosition: lastPlayedDuration!),
        );
  }

  bool isGranted = false;
  requestStoragePermission() async {
    PermissionStatus storageStatus = await Permission.storage.request();
    isGranted = storageStatus.isGranted;
    isGranted ? setState(() {}) : null;
  }

  @override
  void initState() {
    super.initState();
    _getValue();
    getPosition();
    WidgetsFlutterBinding.ensureInitialized();
    requestStoragePermission();
  }

  @override
  Widget build(BuildContext context) {
    print(
        'last Played Position ${context.read<GetLastPlayedPositionBloc>().state.lastPlayedPosition}');
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorsManager.primaryColor,
        appBar: mainAppBar(context, songController),
        body: context.watch<IsHomeBloc>().state.isHome
            ? TabBarView(
                children: [
                  tracksScreen(player, audioQuery, context),
                  playlistScreen(audioQuery, player),
                ],
              )
            : searchList(context, player),
        bottomSheet: smallPlayer(
            context,
            player,
            context.read<GetTrackListBloc>().state.songList,
            context.read<GetLastPlayedAudioBloc>().state.lastPlayedSongIndex,
            audioQuery,
            context.read<GetLastPlayedPositionBloc>().state.lastPlayedPosition),
      ),
    );
  }
}
//78