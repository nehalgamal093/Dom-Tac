import 'package:dom_tac_music_player/presentation/resources/colors_manager.dart';
import 'package:flutter/material.dart';

Widget addLoveBar() {
  return const SizedBox(
    width: 300,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.favorite_border_outlined,
          color: ColorsManager.whiteClr,
        ),
        Icon(
          Icons.add,
          color: ColorsManager.whiteClr,
        )
      ],
    ),
  );
}
