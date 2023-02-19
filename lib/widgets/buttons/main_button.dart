
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
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