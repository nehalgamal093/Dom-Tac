import 'package:dom_tac_music_player/bloc/play_pause_bloc/play_pause_bloc.dart';
import 'package:dom_tac_music_player/bloc/search_list_bloc/search_list_bloc.dart';
import 'package:dom_tac_music_player/bloc/search_term_bloc/search_term_bloc.dart';
import 'package:dom_tac_music_player/presentation/pages/tracks_list/tracks_list_screen.dart';
import 'package:dom_tac_music_player/presentation/shared%20prefs/shared_prefs.dart';
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
      home: const TracksListScreen(),
    );
  }
}
//23