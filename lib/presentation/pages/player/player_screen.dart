import 'package:dom_tac_music_player/presentation/pages/player/widgets/add_love_bar.dart';
import 'package:dom_tac_music_player/presentation/pages/player/widgets/controls_bar.dart';
import 'package:dom_tac_music_player/presentation/pages/player/widgets/controls_btns.dart';
import 'package:dom_tac_music_player/presentation/pages/player/widgets/track_name.dart';
import 'package:dom_tac_music_player/presentation/pages/player/widgets/track_photo.dart';
import 'package:flutter/material.dart';

import '../../resources/colors_manager.dart';
import '../appBar/top_app_bar.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

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
            trackPhoto(context),
            const SizedBox(height: 40),
            addLoveBar(),
            const SizedBox(height: 20),
            controlsBar(),
            const SizedBox(height: 30),
            trackName(),
            const SizedBox(height: 50),
            controlsBtns()
          ],
        ),
      ),
    );
  }
}
