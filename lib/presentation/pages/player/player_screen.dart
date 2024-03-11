import 'package:dom_tac_music_player/presentation/pages/player/widgets/add_love_bar.dart';
import 'package:dom_tac_music_player/presentation/pages/player/widgets/controls_bar.dart';
import 'package:dom_tac_music_player/presentation/pages/player/widgets/controls_btns.dart';
import 'package:dom_tac_music_player/presentation/pages/player/widgets/track_name.dart';
import 'package:dom_tac_music_player/presentation/pages/player/widgets/track_photo.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../resources/colors_manager.dart';

class PlayerScreen extends StatefulWidget {
  final List<SongModel> songModel;
  final String path;

  final AudioPlayer player;

  const PlayerScreen(
      {super.key,
      required this.path,
      required this.player,
      required this.songModel});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  Future<void> saveLastSong(int lastPlayedAudioIndex) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt('last-index', lastPlayedAudioIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsManager.primaryColor, body: mainPage());
  }

  Widget mainPage() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: SizedBox(
        width: width,
        height: height,
        child: StreamBuilder<PlayerState>(
            stream: widget.player.playerStateStream,
            builder: (context, snapshot) {
              final playing = snapshot.data?.playing;
              if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    trackPhoto(
                        context, widget.songModel, widget.player.currentIndex!),
                    const SizedBox(height: 40),
                    addLoveBar(),
                    const SizedBox(height: 20),
                    StreamBuilder<Duration>(
                        stream: widget.player.positionStream,
                        builder: (context, snapshot) {
                          return controlsBar(
                              snapshot.data ?? Duration.zero,
                              widget.player.bufferedPosition,
                              widget.player.duration ?? Duration.zero,
                              widget.player);
                        }),
                    const SizedBox(height: 30),
                    trackName(
                      widget.songModel[widget.player.currentIndex!].title,
                      widget.songModel[widget.player.currentIndex!].artist!,
                    ),
                    const SizedBox(height: 50),
                    controlsBtns(widget.path, playing!, widget.player)
                  ],
                );
              } else {
                return Container();
              }
            }),
      ),
    );
  }
}
//87