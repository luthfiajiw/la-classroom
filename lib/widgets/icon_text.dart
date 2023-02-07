
import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final Icon icon;
  final Widget text;
  
  const IconText({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon,
        const SizedBox(
          width: 6,
        ),
        text
      ],
    );
  }
}