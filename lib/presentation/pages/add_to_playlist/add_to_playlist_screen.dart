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
        padding: const EdgeInsets.only(top: 30),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            color: ColorsManager.secondaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: FutureBuilder(
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
                return ListView(
                  shrinkWrap: true,
                  children: [
                    InkWell(
                        onTap: () {
                          createPlayList(context, _audioQuery);
                        },
                        child: playListTile(
                            'Create Playlist', AssetsManager.playlist)),
                    playListTile('Favourite playlist', AssetsManager.heart),
                    for (final item in listOfPlayLists)
                      InkWell(
                        onLongPress: () {
                          editPlaylist(context, _audioQuery, item.id);
                        },
                        child: playListTile(
                            item.playlist.substring(
                              12,
                            ),
                            AssetsManager.music),
                      )
                  ],
                );
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}

void createPlayList(BuildContext context, OnAudioQuery onAudioQuery) {
  TextEditingController controller = TextEditingController();
  double height = MediaQuery.of(context).size.height;
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      isScrollControlled: true,
      context: context,
      backgroundColor: ColorsManager.primaryColor,
      builder: (builder) {
        return SingleChildScrollView(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: height * .3,
            decoration: const BoxDecoration(
              color: ColorsManager.primaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: controller,
                    decoration: const InputDecoration(
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
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Colors.blue, fontSize: 20),
                          )),
                      TextButton(
                          onPressed: () {
                            onAudioQuery.createPlaylist(
                                'App Playlist ${controller.text}');
                            Navigator.pop(context);
                          },
                          child: const Text('Create',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 20)))
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      });
}

void editPlaylist(
    BuildContext context, OnAudioQuery onAudioQuery, int playlistId) {
  double height = MediaQuery.of(context).size.height;
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      context: context,
      backgroundColor: ColorsManager.primaryColor,
      builder: (builder) {
        return SingleChildScrollView(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: height * .1,
            decoration: const BoxDecoration(
              color: ColorsManager.primaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () async {
                            onAudioQuery.removePlaylist(playlistId);

                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.delete, color: Colors.white)),
                      IconButton(
                          onPressed: () async {
                            onAudioQuery.removePlaylist(playlistId);

                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.edit, color: Colors.white))
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      });
}
