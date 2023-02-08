import 'package:flutter/material.dart';
import 'package:laclassroom/utils/routes/route_paths.dart';
import 'package:laclassroom/utils/themes/palette.dart';
import 'package:responsive_builder/responsive_builder.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double  width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: mainGradient(context)
        ),
        padding: EdgeInsets.symmetric(horizontal: width * 0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.star, size: 65),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 36),
              child: Text(
                "This is a study app. You can use it as you want. If you understand how this works you would be able to scale it.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: onSurfaceTextColor,
                  fontSize: getValueForScreenType<double>(context: context, mobile: 16, tablet: 18)
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RoutePaths.home);
              },
              icon: const Icon(Icons.arrow_forward_rounded)
            )
          ],
        ),
      ),
    );
  }
}