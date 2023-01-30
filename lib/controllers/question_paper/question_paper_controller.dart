import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:laclassroom/models/question_paper/question_paper_model.dart';
import 'package:laclassroom/repositories/firebase/firebase_storage_repository.dart';
import 'package:laclassroom/utils/firebase_refs.dart';

class QuestionPaperController extends ChangeNotifier {
  final FirebaseStorageRepository firebaseStorageRepository;

  QuestionPaperController(
    this.firebaseStorageRepository
  );

  final List<Paper> _papers = [];

  List<Paper> get papers => _papers;

  Future<void> getAllPapers() async {
    try {
      QuerySnapshot<Map<String, dynamic>> data = await paperRef.get();
      final paperList = data.docs.map((paper) => Paper.fromJson(paper.data())).toList();

      for (var paper in paperList) {
        String? imgUrl = await firebaseStorageRepository.getImage(paper.title!.toLowerCase());
        paper.imageUrl = imgUrl;

        _papers.add(paper);
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }
}