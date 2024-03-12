import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../resources/colors_manager.dart';
import '../tracks_list/widgets/track_tile.dart';

class PlaylistTracksList extends StatefulWidget {
  final List<String> data;
  final AudioPlayer player;
  const PlaylistTracksList(
      {super.key, required this.data, required this.player});

  @override
  State<PlaylistTracksList> createState() => _PlaylistTracksListState();
}

class _PlaylistTracksListState extends State<PlaylistTracksList> {
  AudioPlayer audioPlayer = AudioPlayer();
  final _audioQuery = OnAudioQuery();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsManager.primaryColor,
        body: FutureBuilder(
            future: _audioQuery.querySongs(
                sortType: null,
                orderType: OrderType.ASC_OR_SMALLER,
                uriType: UriType.EXTERNAL,
                ignoreCase: true),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<SongModel> u = [];

                List<String> songs = widget.data.map((e) => e).toList();
                for (var img in snapshot.data!) {
                  for (var frnd in songs) {
                    if (img.data.contains(frnd)) {
                      u.add(img);
                    }
                  }
                }

                return ListView.builder(
                    itemCount: u.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => PlayerScreen(
                            //         player: widget.player,
                            //         path: u[index].data,
                            //         songModel: u),
                            //   ),
                            // );
                          },
                          child: trackTile(
                              index, u[index].title, u[index].id, context));
                    });
              } else {
                return const CircularProgressIndicator();
              }
            }));
  }
}
