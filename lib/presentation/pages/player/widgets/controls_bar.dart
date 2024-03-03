import 'package:flutter/material.dart';

Widget controlsBar() {
  return SizedBox(
    width: 350,
    child: Column(children: [
      SliderTheme(
        data: const SliderThemeData(
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5)),
        child: Slider(
            min: 0,
            max: 100,
            activeColor: const Color(0xff47a6bc),
            inactiveColor: const Color.fromARGB(255, 87, 93, 102),
            thumbColor: const Color(0xff47a6bc),
            value: 50,
            onChanged: (val) {}),
      )
    ]),
  );
}
