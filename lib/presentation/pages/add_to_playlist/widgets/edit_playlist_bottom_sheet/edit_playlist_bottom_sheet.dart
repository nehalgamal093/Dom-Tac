import 'package:dom_tac_music_player/presentation/pages/add_to_playlist/widgets/edit_playlist_bottom_sheet/widgets/edit_playlist_btn.dart';
import 'package:dom_tac_music_player/presentation/pages/add_to_playlist/widgets/edit_playlist_bottom_sheet/widgets/remove_playlist_btn.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../../../resources/colors_manager.dart';

void editPlaylistBottomSheet(
    BuildContext context, OnAudioQuery audioQuery, int playlistId) {
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
                      editPlaylistBtn(audioQuery, playlistId, context),
                      removePlaylistBtn(audioQuery, playlistId, context)
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      });
}
//49