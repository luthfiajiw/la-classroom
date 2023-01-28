import 'package:flutter/material.dart';
import 'package:laclassroom/utils/themes/light_theme.dart';
import 'package:laclassroom/utils/themes/ui_parameters.dart';

import 'dark_theme.dart';

const Color onSurfaceTextColor = Colors.white;

const mainGradientLight = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    primaryLightColorLight,
    primaryColorLight
  ]
);

const mainGradientDark = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    primaryDarkColorDark,
    primaryColorDark
  ]
);

LinearGradient mainGradient(BuildContext context) {
  if (UIParameters.isDarkMode(context)) {
    return mainGradientDark;
  } else {
    return mainGradientLight;
  }
}