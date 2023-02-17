import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:laclassroom/controllers/question_paper/question_paper_controller.dart';
import 'package:laclassroom/controllers/shared/drawer_controller.dart';
import 'package:laclassroom/models/question_paper/question_paper_model.dart';
import 'package:laclassroom/screens/menu_screen.dart';
import 'package:laclassroom/utils/themes/palette.dart';
import 'package:laclassroom/widgets/app_icons.dart';
import 'package:laclassroom/widgets/content_area.dart';
import 'package:laclassroom/widgets/paper_card.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
      body: Consumer<DrawerZoomController>(
        builder:(context, drawer, child) => ZoomDrawer(
          borderRadius: 24,
          showShadow: true,
          angle: 0.0,
          slideWidth: MediaQuery.of(context).size.width * .4,
          controller: drawer.zoomDrawerController,
          style: DrawerStyle.Style5,
          menuScreen: MenuScreen(
            onClose: () => drawer.toggleDrawer(),
          ),
          mainScreen: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: mainGradient(context)
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 22.0, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () => drawer.toggleDrawer(),
                          child: const Icon(AppIcons.menuDrawer, color: onSurfaceTextColor, size: 16,),
                        ),
                        const SizedBox(height: 22,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Icon(AppIcons.peace, color: onSurfaceTextColor, size: 16,),
                            const SizedBox(width: 2,),
                            Text(
                              "Hello, Luthfi Aji W!",
                              style: TextStyle(
                                color: onSurfaceTextColor,
                                fontSize: getValueForScreenType(context: context, mobile: 14, tablet: 16)
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8,),
                        Text(
                          "What do you want to learn today?",
                          style: TextStyle(
                            color: onSurfaceTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: getValueForScreenType(context: context, mobile: 22, tablet: 24)
                          ),
                        ),
                        const SizedBox(height: 16,)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ContentArea(
                        child: Consumer<QuestionPaperController>(
                          builder: (context, value, child) {
                            return ListView.builder(
                              padding: EdgeInsets.all(getValueForScreenType<double>(context: context, mobile: 0, tablet: 16)),
                              itemCount: value.papers.length,
                              itemBuilder: (context, index) {
                                Paper paper = value.papers[index];

                                return Column(
                                  children: [
                                    PaperCard(paper: paper),
                                    SizedBox(height: getValueForScreenType<double>(context: context, mobile: 16, tablet: 20),)
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}