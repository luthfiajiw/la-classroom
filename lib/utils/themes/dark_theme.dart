import 'package:flutter/material.dart';
import 'package:laclassroom/utils/themes/sub_theme_data_mixin.dart';

const Color primaryDarkColorDark = Color(0xFF2e3c62);
const Color primaryColorDark = Color(0xFF99ace1);
const Color mainTextColorDark = Colors.white;
class DarkTheme with SubThemeData {
  ThemeData buildDarkTheme() {
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
      primaryColor: primaryColorDark,
      cardColor: primaryColorDark,
      iconTheme: getIconTheme(),
      textTheme: getTextTheme().apply(
        displayColor: mainTextColorDark,
        bodyColor: mainTextColorDark,
      )
    );
  }
}