import 'package:dom_tac_music_player/presentation/pages/playlists/playlist_screen.dart';
import 'package:dom_tac_music_player/presentation/resources/colors_manager.dart';
import 'package:flutter/material.dart';

Widget drawerWidget(BuildContext context) {
  return Drawer(
    backgroundColor: ColorsManager.primaryColor,
    child: ListView(
      children: [
        Image.asset('assets/images/logo.jpg'),
        const SizedBox(height: 10),
        ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PlaylistScreen()));
          },
          title: const Text(
            'Playlists',
            style: TextStyle(color: Colors.white),
          ),
          leading: const Icon(
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
