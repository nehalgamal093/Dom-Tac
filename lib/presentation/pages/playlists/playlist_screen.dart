import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../resources/colors_manager.dart';
import '../appBar/top_app_bar.dart';
import '../drawer/drawer_widget.dart';
import '../tracks_list/widgets/track_tile.dart';

class PlaylistScreen extends StatefulWidget {
  final AudioPlayer player;
  const PlaylistScreen({super.key, required this.player});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  AudioPlayer audioPlayer = AudioPlayer();

  final _audioQuery = OnAudioQuery();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primaryColor,
      appBar: topAppBar(context, widget.player, true),
      endDrawer: drawerWidget(context, audioPlayer),
      body: FutureBuilder(
          future: _audioQuery.queryPlaylists(
              sortType: null,
              orderType: OrderType.ASC_OR_SMALLER,
              uriType: UriType.EXTERNAL,
              ignoreCase: true),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    if (snapshot.data![index].data!.endsWith('m3u')) {
                      return InkWell(
                          onTap: () async {
                            // final tracks =
                            // M3uParser.parse(snapshot.data![index].data!);

                            // final fileContent =
                            //     await File(snapshot.data![index].data!)
                            //         .readAsString();
                            // final list = await File(snapshot.data![index].data!)
                            //     .readAsLinesSync();
                            // final listOfTracks = await parseFile(fileContent);

                            // audioPlayer.play(DeviceFileSource(fileContent[1]));
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => PlaylistTracksList(
                            //               data: fileContent,
                            //             )));
                            // Organized categories
                            // final categories = sortedCategories(
                            //     entries: listOfTracks,
                            //     attributeName: 'group-title');
                            // print(categories);
                            print(snapshot.data);
                          },
                          child: trackTile(
                            index,
                            snapshot.data![index].playlist,
                            snapshot.data![index].id,
                          ));
                    } else {
                      return Container();
                    }
                  });
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}
