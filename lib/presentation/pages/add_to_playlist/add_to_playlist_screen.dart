import 'package:dom_tac_music_player/presentation/pages/add_to_playlist/widgets/playlist_appBar.dart';
import 'package:dom_tac_music_player/presentation/pages/add_to_playlist/widgets/playlist_tile.dart';
import 'package:dom_tac_music_player/presentation/resources/assets_manager.dart';
import 'package:dom_tac_music_player/presentation/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

class AddToPlaylistScreen extends StatelessWidget {
  AddToPlaylistScreen({super.key});
  final _audioQuery = OnAudioQuery();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primaryColor,
      appBar: playlistAppBar(context),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: ColorsManager.secondaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            InkWell(
                onTap: () {
                  createPlayList(context);
                },
                child: playListTile('Create Playlist', AssetsManager.playlist)),
            playListTile('Favourite playlist', AssetsManager.heart),
            FutureBuilder(
                future: _audioQuery.queryPlaylists(
                    sortType: null,
                    orderType: OrderType.ASC_OR_SMALLER,
                    uriType: UriType.EXTERNAL,
                    ignoreCase: true),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    String subString = 'App Playlist';
                    List<PlaylistModel> listOfPlayLists = snapshot.data!
                        .where((e) => e.playlist.contains(subString))
                        .toList();
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: listOfPlayLists.length,
                        itemBuilder: (context, index) {
                          return playListTile(
                              listOfPlayLists[index].playlist.substring(
                                    15,
                                  ),
                              AssetsManager.music);
                        });
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
          ],
        ),
      ),
    );
  }
}

void createPlayList(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          height: 250,
          decoration: const BoxDecoration(color: ColorsManager.primaryColor),
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Create Playlist',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                const SizedBox(height: 20),
                const TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.blue, fontSize: 20),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: const Text('Create',
                            style: TextStyle(color: Colors.blue, fontSize: 20)))
                  ],
                )
              ],
            ),
          ),
        );
      });
}
