import 'package:dom_tac_music_player/presentation/resources/colors_manager.dart';
import 'package:flutter/material.dart';

Widget drawerWidget() {
  return Drawer(
    backgroundColor: ColorsManager.primaryColor,
    child: ListView(
      children: [
        Image.asset('assets/images/logo.jpg'),
        const SizedBox(height: 10),
        const ListTile(
          title: Text(
            'Playlists',
            style: TextStyle(color: Colors.white),
          ),
          leading: Icon(
            Icons.playlist_add,
            color: Colors.white,
          ),
        ),
        const ListTile(
          title: Text(
            'Favorites',
            style: TextStyle(color: Colors.white),
          ),
          leading: Icon(
            Icons.favorite_outline,
            color: Colors.white,
          ),
        ),
        const Divider(),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 10),
          child: Row(
            children: [
              const Text(
                'Dark Mode',
                style: TextStyle(color: Colors.white),
              ),
              const Spacer(),
              Switch(value: true, onChanged: (val) {})
            ],
          ),
        )
      ],
    ),
  );
}
