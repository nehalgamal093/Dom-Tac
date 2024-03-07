import 'package:dom_tac_music_player/presentation/pages/appBar/widgets/app_bar_btns.dart';
import 'package:dom_tac_music_player/presentation/pages/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

PreferredSize topAppBar(BuildContext context, AudioPlayer player, bool isBack) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(80.0),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SearchScreen(player: player)));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [appBarBtns(Icons.search)],
            ),
          ),
          Builder(builder: (context) {
            return InkWell(
              onTap: () {
                Scaffold.of(context).openEndDrawer();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [appBarBtns(Icons.list)],
              ),
            );
          }),
        ],
        leading: isBack
            ? InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: appBarBtns(Icons.arrow_back),
              )
            : Container(),
      ),
    ),
  );
}
