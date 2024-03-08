import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../resources/colors_manager.dart';
import '../../shared prefs/shared_prefs.dart';

Widget smallPlayer(BuildContext context, AudioPlayer player,
    List<SongModel> model, int index) {
  double height = MediaQuery.of(context).size.height;
  return StreamBuilder<PlayerState>(
      stream: player.playerStateStream,
      builder: (context, snapshot) {
        final playing = snapshot.data?.playing;
        if (snapshot.hasData) {
          return Container(
            height: height * .1,
            decoration: const BoxDecoration(
              color: ColorsManager.primaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 20),
                    Container(width: 40, height: 40, color: Colors.red),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model[index].title,
                          style: const TextStyle(
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis),
                        ),
                        Text(
                          'The best damn thing',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(width: 40),
                    InkWell(
                      onTap: () async {},
                      child: const Icon(
                        Icons.skip_previous_outlined,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    playing != true
                        ? InkWell(
                            onTap: player.play,
                            child: const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 40,
                            ),
                          )
                        : InkWell(
                            onTap: player.pause,
                            child: const Icon(
                              Icons.pause,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                    InkWell(
                      onTap: () async {
                        SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();
                        await sharedPreferences.setInt('index', 1);
                      },
                      child: const Icon(
                        Icons.skip_next_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        } else {
          return Container();
        }
      });
}
