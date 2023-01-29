import 'package:flutter/material.dart';
import 'package:laclassroom/controllers/question_paper/question_paper_controller.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Future.microtask(() {
      Provider.of<QuestionPaperController>(context, listen: false).getAllPapers();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<QuestionPaperController>(
        builder: (context, value, child) {
          return ListView.separated(
            itemCount: value.imgsUrl.length,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 20,);
            },
            itemBuilder: (context, index) {
              String imgUrl = value.imgsUrl[index];

              return ClipRRect(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: FadeInImage(
                    image: NetworkImage(imgUrl),
                    placeholder: const AssetImage("assets/images/app_splash_logo.png"),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}