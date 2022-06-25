import 'dart:math';

import 'package:flutter/material.dart';

extension ColorExtension on BuildContext {
  //Base Color
  Color get transparentColor => Colors.transparent;
  Color get randomColor => Colors.primaries[Random().nextInt(17)];
  Color get whiteColor => Colors.white;
  Color get blackColor => Colors.black;

  //Theme Color
  Color get themeMainColor1 => const Color(0xff121212);
}
