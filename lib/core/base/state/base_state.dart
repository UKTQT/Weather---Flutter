import 'package:flutter/material.dart';

abstract class BaseState<T extends StatelessWidget> extends State {
  ThemeData get themeData => Theme.of(context);
  double get screenHeight => MediaQuery.of(context).size.height;
  double get screenWidth => MediaQuery.of(context).size.width;
}
