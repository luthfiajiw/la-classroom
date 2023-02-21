import 'package:flutter/material.dart';
import 'package:laclassroom/utils/themes/dark_theme.dart';
import 'package:laclassroom/utils/themes/light_theme.dart';
import 'package:laclassroom/widgets/buttons/main_button.dart';

class AnswerButton extends MainButton {
  final bool isSelected;
  final bool isDarkMode;

  const AnswerButton({
    super.key,
    super.onTap,
    required this.isDarkMode,
    required this.isSelected,
    required super.child
  }) : super(
    color: isDarkMode
    ? isSelected ? primaryDarkColorDark : primaryColorDark
    : isSelected ? primaryColorLight : Colors.white
  );
}