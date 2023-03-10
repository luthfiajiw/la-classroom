import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laclassroom/models/question_paper/question_paper_model.dart';
import 'package:laclassroom/views/home_view.dart';
import 'package:laclassroom/screens/introduction_screen.dart';
import 'package:laclassroom/screens/splash_screen.dart';
import 'package:laclassroom/utils/routes/route_paths.dart';
import 'package:laclassroom/views/auth_view.dart';
import 'package:laclassroom/views/question_view.dart';

class Routes {
  static Route<dynamic> generate(RouteSettings settings) {
    debugPrint("ROUTE ${settings.name}");
    switch (settings.name) {
      case RoutePaths.splash:
        return CupertinoPageRoute(builder: (_) => const SplashScreen());
      case RoutePaths.introduction:
        return CupertinoPageRoute(builder: (_) => const IntroductionScreen());
      case RoutePaths.auth:
        return CupertinoPageRoute(builder: (_) => const AuthView());
      case RoutePaths.home:
        return CupertinoPageRoute(builder: (_) => const HomeView());
      case RoutePaths.question:
        final Paper paperArg = settings.arguments as Paper;
        return CupertinoPageRoute(builder: (_) => QuestionView(paper: paperArg,));
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