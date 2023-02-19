import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:laclassroom/models/question_paper/question_paper_model.dart';
import 'package:laclassroom/utils/themes/dark_theme.dart';
import 'package:laclassroom/utils/themes/ui_parameters.dart';
import 'package:laclassroom/widgets/icon_text.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PaperCard extends StatelessWidget {
  final VoidCallback onTap;
  final Paper paper;

  const PaperCard({super.key, required this.paper, required this.onTap});
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
                      color: UIParameters.isDarkMode(context) ? Colors.white38 : Theme.of(context).primaryColor.withOpacity(.2),
                      width: getValueForScreenType(context: context, mobile: 45, tablet: 70),
                      height: getValueForScreenType(context: context, mobile: 45, tablet: 70),
                      child: CachedNetworkImage(
                        imageUrl: paper.imageUrl!,
                        placeholder: (context, url) {
                          return const Center(
                            child: CircularProgressIndicator(strokeWidth: 2,),
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
                            color: UIParameters.isDarkMode(context) ? primaryDarkColorDark : Theme.of(context).primaryColor,
                            fontSize: getValueForScreenType(context: context, mobile: 16, tablet: 18),
                            fontWeight: FontWeight.w800
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Text(
                            paper.description!,
                            style: TextStyle(
                              fontSize: getValueForScreenType(context: context, mobile: 14, tablet: 16)
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            IconText(
                              icon: Icon(
                                Icons.list_alt_rounded,
                                size: getValueForScreenType(context: context, mobile: 20, tablet: 22),
                                color: UIParameters.isDarkMode(context) ? primaryDarkColorDark : Theme.of(context).primaryColor,
                              ),
                              text: Text(
                                '${paper.questionsCount} questions',
                                style: TextStyle(
                                  color: UIParameters.isDarkMode(context) ? primaryDarkColorDark : Theme.of(context).primaryColor,
                                  fontSize: getValueForScreenType(context: context, mobile: 12, tablet: 14)
                                ),
                              )
                            ),
                            SizedBox(width: getValueForScreenType<double>(context: context, mobile: 8, tablet: 16),),
                            IconText(
                              icon: Icon(
                                Icons.timer_outlined,
                                size: getValueForScreenType(context: context, mobile: 20, tablet: 22),
                                color: UIParameters.isDarkMode(context) ? primaryDarkColorDark : Theme.of(context).primaryColor,
                              ),
                              text: Text(
                                '${(paper.timeSeconds! / 60).ceil()} mins',
                                style: TextStyle(
                                  color: UIParameters.isDarkMode(context) ? primaryDarkColorDark : Theme.of(context).primaryColor,
                                  fontSize: getValueForScreenType<double>(context: context, mobile: 12, tablet: 14)
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
                  padding: EdgeInsets.symmetric(
                    vertical: getValueForScreenType<double>(context: context, mobile: 6, tablet: 12),
                    horizontal: getValueForScreenType<double>(context: context, mobile: 10, tablet: 20)
                  ),
                  decoration: BoxDecoration(
                    color: UIParameters.isDarkMode(context) ? primaryDarkColorDark : Theme.of(context).primaryColor,
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
      ),
    );
  }
}