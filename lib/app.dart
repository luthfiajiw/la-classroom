import 'package:flutter/material.dart';
import 'package:laclassroom/controllers/shared/theme_controller.dart';
import 'package:laclassroom/utils/routes/route_paths.dart';
import 'package:laclassroom/utils/routes/routes.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
      builder: (context, value, child) {
        return MaterialApp(
          title: "LA Classroom",
          theme: context.read<ThemeController>().activeTheme,
          initialRoute: RoutePaths.splash,
          onGenerateRoute: Routes.generate,
        );
      },
    );
  }
}