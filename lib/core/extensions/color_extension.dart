import 'package:flutter/material.dart';
import 'dart:math';

extension ColorExtension on BuildContext {
  //Base Color
  Color get transparentColor => Colors.transparent;
  Color get randomColor => Colors.primaries[Random().nextInt(17)];
  Color get whiteColor => Colors.white;
  Color get blackColor => Colors.black;

  //Theme Color

}
