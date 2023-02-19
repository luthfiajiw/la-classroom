
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:laclassroom/controllers/question_paper/question_paper_controller.dart';
import 'package:laclassroom/models/question_paper/question_paper_model.dart';
import 'package:laclassroom/widgets/background_question.dart';
import 'package:laclassroom/widgets/buttons/main_button.dart';
import 'package:laclassroom/widgets/content_area.dart';
import 'package:laclassroom/widgets/shimmer/question_shimmer.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shimmer/shimmer.dart';

class QuestionView extends StatefulWidget {
  final Paper paper;

  const QuestionView({super.key, required this.paper});

  @override
  State<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  @override
  void initState() {
    Future.microtask(() {
      return Provider.of<QuestionPaperController>(context, listen: false).getQuestions(widget.paper);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundQuestion(
        child: Consumer<QuestionPaperController>(
          builder: (context, value, _) {
            return SafeArea(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 16, 8, 10),
                    width: double.infinity,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 80,
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.white),
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.timer_outlined,
                                  size: getValueForScreenType(context: context, mobile: 18, tablet: 20),
                                ),
                                const SizedBox(width: 4,),
                                Text(
                                  "00:00",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: getValueForScreenType(context: context, mobile: 14, tablet: 16)
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            value.isLoading
                            ? ""
                            : "Q${value.currentQuestion.id![value.currentQuestion.id!.length - 1]}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: getValueForScreenType(context: context, mobile: 14, tablet: 16)
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Material(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                            clipBehavior: Clip.hardEdge,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.apps,
                                color: Colors.white,
                                size: getValueForScreenType(context: context, mobile: 24, tablet: 26),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: ContentArea(
                        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
                        child: Conditional.single(
                          context: context,
                          conditionBuilder: (context) => !value.isLoading,
                          widgetBuilder: (context) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  value.currentQuestion.question!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: getValueForScreenType(context: context, mobile: 16, tablet: 18)
                                  ),
                                ),
                                const SizedBox(height: 24,),
                                ...value.currentQuestion.answers!.asMap().map((key, answer) => MapEntry(key, Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: MainButton(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        Text(
                                          "${answer.identifier!}."
                                        ),
                                        const SizedBox(width: 8,),
                                        Text(
                                          answer.answer!
                                        )
                                      ],
                                    ),
                                  )
                                ))).values.toList()
                              ],
                            );
                          },
                          fallbackBuilder: (context) => const QuestionShimmer(),
                        )
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}