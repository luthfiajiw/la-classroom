import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:laclassroom/controllers/shared/theme_controller.dart';
import 'package:laclassroom/firebase_options.dart';
import 'package:laclassroom/utils/injection.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeController()),
        ChangeNotifierProvider(create: (_) => Injection.provideQuestionPaperController()),
      ],
      child: const App()
    )
  );
}
