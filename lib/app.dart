import 'package:flutter/material.dart';
import 'package:laclassroom/utils/routes/route_paths.dart';
import 'package:laclassroom/utils/routes/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "LA Classroom",
      initialRoute: RoutePaths.splash,
      onGenerateRoute: Routes.generate,
    );
  }
}