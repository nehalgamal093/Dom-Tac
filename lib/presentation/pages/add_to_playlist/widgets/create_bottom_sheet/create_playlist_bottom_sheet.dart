import 'package:dom_tac_music_player/presentation/pages/add_to_playlist/widgets/create_bottom_sheet/widgets/cancel_btn.dart';
import 'package:dom_tac_music_player/presentation/pages/add_to_playlist/widgets/create_bottom_sheet/widgets/create_btn.dart';
import 'package:dom_tac_music_player/presentation/pages/add_to_playlist/widgets/create_bottom_sheet/widgets/create_playlist_textfield.dart';
import 'package:dom_tac_music_player/presentation/pages/add_to_playlist/widgets/create_bottom_sheet/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../../../resources/colors_manager.dart';

void createPlayListBottomSheet(BuildContext context, OnAudioQuery audioQuery) {
  TextEditingController controller = TextEditingController();
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
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
            width: width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  title(),
                  const SizedBox(height: 20),
                  createPlayListTextField(controller),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      cancelBtn(context),
                      createBtn(audioQuery, context, controller.text)
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      });
}
//59