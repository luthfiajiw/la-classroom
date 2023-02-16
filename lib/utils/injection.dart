import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:laclassroom/controllers/question_paper/question_paper_controller.dart';
import 'package:laclassroom/controllers/shared/drawer_controller.dart';
import 'package:laclassroom/repositories/firebase/firebase_storage_repository.dart';

class Injection {
  static QuestionPaperController provideQuestionPaperController() {
    final firebaseStorageRepository = FirebaseStorageRepository();

    return QuestionPaperController(firebaseStorageRepository);
  }

  static DrawerZoomController provideDrawerZoomController() {
    final zoomDrawerController = ZoomDrawerController();

    return DrawerZoomController(zoomDrawerController);
  }
}