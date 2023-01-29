import 'package:laclassroom/controllers/question_paper/question_paper_controller.dart';
import 'package:laclassroom/repositories/firebase/firebase_storage_repository.dart';

class Injection {
  static QuestionPaperController provideQuestionPaperController() {
    final firebaseStorageRepository = FirebaseStorageRepository();

    return QuestionPaperController(firebaseStorageRepository);
  }
}