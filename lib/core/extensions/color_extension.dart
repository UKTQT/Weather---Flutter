import 'package:flutter/material.dart';
import 'dart:math';

extension ColorExtension on BuildContext {
  //Base Color
  Color get transparentColor => Colors.transparent;
  Color get randomColor => Colors.primaries[Random().nextInt(17)];
  Color get whiteColor => Colors.white;
  Color get blackColor => Colors.black;

  //Theme Color
  Color get themeLinearColor1 => const Color(0xff2f58e1);
  Color get themeLinearColor2 => const Color(0xff6aa9e8);

  // Property Box's
  Color get propertyBox1 => const Color(0xff093075);
  Color get propertyBox2 => const Color(0xff9bc9ff);
}
