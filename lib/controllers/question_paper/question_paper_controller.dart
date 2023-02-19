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

  late Question currentQuestion;
  late Paper paper;
  List<Paper> papers = [];
  bool isLoading = false;

  Future<void> getAllPapers() async {
    try {
      QuerySnapshot<Map<String, dynamic>> data = await paperRef.get();
      final paperList = data.docs.map((paper) => Paper.fromJson(paper.data())).toList();

      for (var paper in paperList) {
        String? imgUrl = await firebaseStorageRepository.getImage(paper.title!.toLowerCase());
        paper.imageUrl = imgUrl;

        papers.add(paper);
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getQuestions(Paper paperArg) async {
    paper = paperArg;
    isLoading = true;
    notifyListeners();
    try {
      final data = await paperRef.doc(paper.id).collection("questions").get();
      
      List<Question> questionList = data.docs.map((question) {
        return Question.fromJson(question.data());
      }).toList();

      paper.questions = questionList;

      for (var question in paper.questions!) {
        final res = await paperRef.doc(paper.id)
        .collection("questions")
        .doc(question.id)
        .collection("answers")
        .get();

        List<Answer> answerList = res.docs.map((e) => Answer.fromJson(e.data())).toList();
        question.answers = answerList;
      }

      if (paper.questions!.isNotEmpty) {
        currentQuestion = paper.questions![0];
      }
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}