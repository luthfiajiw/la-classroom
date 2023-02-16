import 'package:flutter/material.dart';
import 'package:laclassroom/utils/themes/dark_theme.dart';
import 'package:laclassroom/utils/themes/light_theme.dart';

class ThemeController extends ChangeNotifier {
  ThemeData _activeTheme = LightTheme().buildLightTheme();

  ThemeData get activeTheme => _activeTheme;

  void toggleTheme(bool isDarkMode) {
    print(isDarkMode);
    if (isDarkMode) {
      _activeTheme = DarkTheme().buildDarkTheme();
    } else {
      _activeTheme = LightTheme().buildLightTheme();
    }
    notifyListeners();
  }
}