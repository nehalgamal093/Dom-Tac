import 'package:dom_tac_music_player/presentation/pages/appBar/widgets/app_bar_btns.dart';
import 'package:flutter/material.dart';

PreferredSize topAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(80.0),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        actions: <Widget>[
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
          })
        ],
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: appBarBtns(Icons.arrow_back),
        ),
      ),
    ),
  );
}
