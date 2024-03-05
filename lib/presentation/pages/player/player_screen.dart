import 'package:audioplayers/audioplayers.dart';
import 'package:dom_tac_music_player/bloc/play_pause_bloc/play_pause_bloc.dart';
import 'package:dom_tac_music_player/presentation/pages/player/widgets/add_love_bar.dart';
import 'package:dom_tac_music_player/presentation/pages/player/widgets/controls_bar.dart';
import 'package:dom_tac_music_player/presentation/pages/player/widgets/controls_btns.dart';
import 'package:dom_tac_music_player/presentation/pages/player/widgets/track_name.dart';
import 'package:dom_tac_music_player/presentation/pages/player/widgets/track_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../resources/colors_manager.dart';
import '../appBar/top_app_bar.dart';

class PlayerScreen extends StatefulWidget {
  final AudioPlayer audioPlayer;
  final String path;
  final String songName;
  final String albumName;
  final int id;
  PlayerScreen(
      {super.key,
      required this.path,
      required this.songName,
      required this.albumName,
      required this.audioPlayer,
      required this.id});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PlayPauseBloc>().add(PlayEvent());
    play();
  }

  play() async {
    await widget.audioPlayer.play(DeviceFileSource(widget.path));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: topAppBar(context),
      backgroundColor: ColorsManager.primaryColor,
      body: SizedBox(
        width: width,
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            trackPhoto(context, widget.id),
            const SizedBox(height: 40),
            addLoveBar(),
            const SizedBox(height: 20),
            controlsBar(),
            const SizedBox(height: 30),
            trackName(widget.songName, widget.albumName),
            const SizedBox(height: 50),
            controlsBtns(widget.path, widget.audioPlayer)
          ],
        ),
      ),
    );
  }
}
