import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:laclassroom/controllers/question_paper/data_uploader_controller.dart';
import 'package:laclassroom/views/data_uploader_view.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DataUploaderController>(
          create: (context) => DataUploaderController(),
        )
      ],
      child: const MaterialApp(
        title: "LA Classroom",
        home: DataUploaderView(),
      ),
    );
  }
}