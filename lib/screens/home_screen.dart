import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:laclassroom/controllers/question_paper/question_paper_controller.dart';
import 'package:laclassroom/models/question_paper/question_paper_model.dart';
import 'package:laclassroom/widgets/content_area.dart';
import 'package:laclassroom/widgets/paper_card.dart';
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
      body: ContentArea(
        child: Consumer<QuestionPaperController>(
          builder: (context, value, child) {
            return ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              itemCount: value.papers.length,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 20,);
              },
              itemBuilder: (context, index) {
                Paper paper = value.papers[index];

                return PaperCard(paper: paper);
              },
            );
          },
        ),
      ),
    );
  }
}