import 'package:dom_tac_music_player/bloc/get_last_played_audio_bloc/get_last_played_audio_bloc.dart';
import 'package:dom_tac_music_player/bloc/get_track_list_bloc/get_track_list_bloc.dart';
import 'package:dom_tac_music_player/bloc/is_home_bloc/is_home_bloc.dart';
import 'package:dom_tac_music_player/bloc/play_pause_bloc/play_pause_bloc.dart';
import 'package:dom_tac_music_player/bloc/search_list_bloc/search_list_bloc.dart';
import 'package:dom_tac_music_player/bloc/search_term_bloc/search_term_bloc.dart';
import 'package:dom_tac_music_player/bloc/song_details_bloc/song_details_bloc.dart';
import 'package:dom_tac_music_player/presentation/pages/main_page/main_page.dart';
import 'package:dom_tac_music_player/services/get_track_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PlayPauseBloc(),
        ),
        BlocProvider(
          create: (context) => SearchTermBloc(),
        ),
        BlocProvider(
          create: (context) => SearchListBloc(
              songsList: SongsList(),
              searchTermBloc: BlocProvider.of<SearchTermBloc>(context)),
        ),
        BlocProvider(
          create: (context) =>
              GetTrackListBloc(songsList: SongsList())..add(TrackListEvent()),
        ),
        BlocProvider(
          create: (context) => SongDetailsBloc(),
        ),
        BlocProvider(
          create: (context) => IsHomeBloc(),
        ),
        BlocProvider(
          create: (context) => GetLastPlayedAudioBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dom Tac',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}
//62