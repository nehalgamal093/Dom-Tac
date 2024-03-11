import 'package:flutter/material.dart';

PreferredSize playlistAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(80.0),
    child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: const Text(
            'Playlists',
            style: TextStyle(color: Colors.white),
          ),
        )),
  );
}
