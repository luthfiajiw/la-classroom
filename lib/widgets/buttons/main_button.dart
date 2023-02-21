
import 'package:flutter/material.dart';
import 'package:laclassroom/utils/themes/dark_theme.dart';
import 'package:laclassroom/utils/themes/ui_parameters.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MainButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;
  final Color? color;
  
  const MainButton({
    super.key,
    this.onTap,
    this.color,
    required this.child
  });

  Color defaultColor(BuildContext context) {
    if (UIParameters.isDarkMode(context)) {
      return primaryColorDark;
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? defaultColor(context),
      borderRadius: BorderRadius.circular(6),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(getValueForScreenType(context: context, mobile: 16, tablet: 18)),
          child: child
        ),
      ),
    );
  }
}