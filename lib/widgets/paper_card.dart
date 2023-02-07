import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:laclassroom/models/question_paper/question_paper_model.dart';
import 'package:laclassroom/widgets/icon_text.dart';

class PaperCard extends StatelessWidget {
  final Paper paper;

  const PaperCard({super.key, required this.paper});
  
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).cardColor
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Theme.of(context).primaryColor.withOpacity(.2),
                    width: screenWidth * .10,
                    height: screenWidth * .10,
                    child: CachedNetworkImage(
                      imageUrl: paper.imageUrl!,
                      placeholder: (context, url) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      errorWidget: (context, url, error) {
                        return Image.asset("assets/images/app_splash_logo.png");
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 16,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        paper.title!,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: screenWidth * .03,
                          fontWeight: FontWeight.w800
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          paper.description!,
                          style: TextStyle(
                            fontSize: screenWidth * .02
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          IconText(
                            icon: Icon(
                              Icons.help_outline_rounded,
                              color: Theme.of(context).primaryColor,
                            ),
                            text: Text(
                              '${paper.questionsCount} questions',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: screenWidth * .02
                              ),
                            )
                          ),
                          const SizedBox(width: 16,),
                          IconText(
                            icon: Icon(
                              Icons.timer_outlined,
                              color: Theme.of(context).primaryColor,
                            ),
                            text: Text(
                              '${(paper.timeSeconds! / 60).ceil()} mins',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: screenWidth * .02
                              ),
                            )
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )
                ),
                child: const Icon(Icons.leaderboard_outlined),
              ),
            ),
          )
        ],
      ),
    );
  }
}