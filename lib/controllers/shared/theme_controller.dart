import 'package:flutter/material.dart';
import 'package:laclassroom/utils/themes/dark_theme.dart';
import 'package:laclassroom/utils/themes/light_theme.dart';

class ThemeController extends ChangeNotifier {
  final ThemeData _darkTheme = DarkTheme().buildDarkTheme();
  final ThemeData _lightTheme = LightTheme().buildLightTheme();

  ThemeData get darkTheme => _darkTheme;
  ThemeData get lightTheme => _lightTheme;

}