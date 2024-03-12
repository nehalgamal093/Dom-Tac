import 'package:dom_tac_music_player/presentation/pages/add_to_playlist/widgets/playlist_appBar.dart';
import 'package:dom_tac_music_player/presentation/pages/add_to_playlist/widgets/playlist_list.dart';
import 'package:dom_tac_music_player/presentation/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

class AddToPlaylistScreen extends StatefulWidget {
  final int audioId;

  AddToPlaylistScreen({super.key, required this.audioId});

  @override
  State<AddToPlaylistScreen> createState() => _AddToPlaylistScreenState();
}

class _AddToPlaylistScreenState extends State<AddToPlaylistScreen> {
  final _audioQuery = OnAudioQuery();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primaryColor,
      appBar: playlistAppBar(context),
      body: Container(
          padding: const EdgeInsets.only(top: 30),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              color: ColorsManager.secondaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: playlistList(_audioQuery, widget.audioId)),
    );
  }
}
//27🐨