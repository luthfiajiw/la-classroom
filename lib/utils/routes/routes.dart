import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laclassroom/screens/introduction_screen.dart';
import 'package:laclassroom/screens/splash_screen.dart';
import 'package:laclassroom/utils/routes/route_paths.dart';

class Routes {
  static Route<dynamic> generate(RouteSettings settings) {
    debugPrint("ROUTE ${settings.name}");
    switch (settings.name) {
      case RoutePaths.splash:
        return CupertinoPageRoute(builder: (_) => const SplashScreen());
      case RoutePaths.introduction:
        return CupertinoPageRoute(builder: (_) => const IntroductionScreen());
      default:
        return CupertinoPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}