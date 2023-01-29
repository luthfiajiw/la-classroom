import 'package:flutter/material.dart';
import 'package:laclassroom/repositories/firebase/firebase_storage_repository.dart';

class QuestionPaperController extends ChangeNotifier {
  final FirebaseStorageRepository firebaseStorageRepository;

  QuestionPaperController(
    this.firebaseStorageRepository
  );

  final List<String> _imgsUrl = [];

  List<String> get imgsUrl => _imgsUrl;

  Future<void> getAllPapers() async {
    List<String> imgName = [
      "biology",
      "chemistry",
      "maths",
      "physics"
    ];

    try {
      for (var img in imgName) {
        String? imgUrl = await firebaseStorageRepository.getImage(img);
        _imgsUrl.add(imgUrl!);
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }
}