import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laclassroom/utils/themes/palette.dart';

mixin SubThemeData {
  
  TextTheme getTextTheme() {
    return GoogleFonts.quicksandTextTheme(const TextTheme(
      bodyText1: TextStyle(fontWeight: FontWeight.w500,),
      bodyText2: TextStyle(fontWeight: FontWeight.w500),
    ));
  }

  IconThemeData getIconTheme() {
    return const IconThemeData(color: onSurfaceTextColor);
  }
}