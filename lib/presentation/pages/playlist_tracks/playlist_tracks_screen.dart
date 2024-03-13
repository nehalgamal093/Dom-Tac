import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../resources/colors_manager.dart';
import '../tracks_list/widgets/track_tile.dart';

class PlaylistTracksList extends StatefulWidget {
  final List<String> data;
  final AudioPlayer player;
  final OnAudioQuery audioQuery;
  const PlaylistTracksList(
      {super.key,
      required this.data,
      required this.player,
      required this.audioQuery});

  @override
  State<PlaylistTracksList> createState() => _PlaylistTracksListState();
}

class _PlaylistTracksListState extends State<PlaylistTracksList> {
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsManager.primaryColor,
        body: FutureBuilder(
            future: widget.audioQuery.querySongs(
                sortType: null,
                orderType: OrderType.ASC_OR_SMALLER,
                uriType: UriType.EXTERNAL,
                ignoreCase: true),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<SongModel> u = [];

                List<String> songs = widget.data.map((e) => e).toList();
                for (var item in snapshot.data!) {
                  for (var song in songs) {
                    if (item.data.contains(song)) {
                      u.add(item);
                      print('u is ${u}');
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
                          child: trackTile(index, u[index].title, u[index].id,
                              context, widget.audioQuery));
                    });
              } else {
                return const CircularProgressIndicator();
              }
            }));
  }
}
