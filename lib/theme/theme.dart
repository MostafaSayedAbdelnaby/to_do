import 'package:flutter/material.dart';

// create an abstract class for override by two methods : 1) lightMode & 2) darkMode
abstract class BaseTheme {
  Color get primaryColor;

  Color get backgroundColor;

  Color get textColor;

  ThemeData get themeData;
}
