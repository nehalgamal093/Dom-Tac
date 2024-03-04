import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:dom_tac_music_player/presentation/pages/player/widgets/player_btn.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

AudioPlayer player = AudioPlayer();
// Future<Uint8List> audioBytes() async {

//   ByteData bytes = await rootBundle.load(audioAsset);
//   Uint8List audiobytes =
//       bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
//   return audiobytes;
// }

play() async {
  String audioAsset = 'audio/beatles.mp3';
  await player.play(
    AssetSource(audioAsset),
  );
}

pause() async {
  await player.pause();
}

Widget controlsBtns() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        playerBtn(Icons.shuffle),
        InkWell(
            onTap: () {
              play();
            },
            child: clickedBtn(Icons.play_arrow)),
        playerBtn(Icons.repeat)
      ],
    ),
  );
}
