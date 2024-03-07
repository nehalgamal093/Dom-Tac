import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../resources/colors_manager.dart';
import '../appBar/top_app_bar.dart';
import '../drawer/drawer_widget.dart';
import '../tracks_list/widgets/track_tile.dart';

class PlaylistTracksList extends StatefulWidget {
  final List<String> data;
  const PlaylistTracksList({super.key, required this.data});

  @override
  State<PlaylistTracksList> createState() => _PlaylistTracksListState();
}

// _audioQuery.querySongs(
//                 sortType: null,
//                 orderType: OrderType.ASC_OR_SMALLER,
//                 uriType: UriType.EXTERNAL,
//                 ignoreCase: true),
class _PlaylistTracksListState extends State<PlaylistTracksList> {
  AudioPlayer audioPlayer = AudioPlayer();
  final _audioQuery = OnAudioQuery();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsManager.primaryColor,
        appBar: topAppBar(context, audioPlayer, false),
        endDrawer: drawerWidget(context, audioPlayer),
        body: FutureBuilder(
            future: _audioQuery.querySongs(
                sortType: null,
                orderType: OrderType.ASC_OR_SMALLER,
                uriType: UriType.EXTERNAL,
                ignoreCase: true),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            print(snapshot.data![index].id);
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => PlayerScreen(
                            //       songName: snapshot.data![index].title,
                            //       albumName:
                            //           snapshot.data![index].genre ?? 'Music',
                            //       path: snapshot.data![index].data,
                            //       id: snapshot.data![index].id,
                            //     ),
                            //   ),
                            // );
                          },
                          child: trackTile(
                            index,
                            snapshot.data![index].title.toString(),
                            snapshot.data![index].id,
                          ));
                    });
              } else {
                return const CircularProgressIndicator();
              }
            }));
  }
}
