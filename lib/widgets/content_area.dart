
import 'package:flutter/material.dart';
import 'package:laclassroom/utils/themes/palette.dart';

class ContentArea extends StatelessWidget {
  final EdgeInsets? padding;
  final Widget child;

  const ContentArea({super.key, this.padding, required this.child});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      clipBehavior: Clip.hardEdge,
      type: MaterialType.transparency,
      child: Ink(
        decoration: BoxDecoration(
          color: customScaffoldColor(context),
        ),
        padding: padding ?? const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: child,
      ),
    );
  }
}