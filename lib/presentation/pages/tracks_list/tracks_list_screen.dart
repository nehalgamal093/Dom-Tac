import 'package:dom_tac_music_player/presentation/pages/appBar/top_app_bar.dart';
import 'package:dom_tac_music_player/presentation/pages/drawer/drawer_widget.dart';
import 'package:dom_tac_music_player/presentation/pages/player/player_screen.dart';
import 'package:dom_tac_music_player/presentation/pages/tracks_list/widgets/track_tile.dart';
import 'package:flutter/material.dart';
import '../../resources/colors_manager.dart';

class TracksListScreen extends StatelessWidget {
  const TracksListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primaryColor,
      appBar: topAppBar(context),
      endDrawer: drawerWidget(),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PlayerScreen()));
                },
                child: trackTile(index));
          }),
    );
  }
}
