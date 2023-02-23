import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:laclassroom/controllers/disposable_controller.dart';
import 'package:laclassroom/models/question_paper/question_paper_model.dart';
import 'package:laclassroom/repositories/firebase/firebase_storage_repository.dart';
import 'package:laclassroom/utils/const/storage_key.dart';
import 'package:laclassroom/utils/firebase_refs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuestionPaperController extends DisposableController {
  final FirebaseStorageRepository firebaseStorageRepository;

  QuestionPaperController(
    this.firebaseStorageRepository
  );

  late Timer _timer;
  late Paper _paper;
  List<Paper> papers = [];
  int currentQuestionIndex = 0;
  int secondsRemaining = 0;
  bool isLoading = false;
  bool isSubmitting = false;
  String countDown = "00:00";

  List<Question> get questions => _paper.questions!;

  int get correctAnswerCount => _paper.questions!
    .where((e) => e.correctAnswer == e.selectedAnswer)
    .toList()
    .length;
  
  num get points {
    num points = (correctAnswerCount * 2);

    return points;
  }

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
    _paper = paperArg;
    isLoading = true;
    notifyListeners();
    try {
      final data = await paperRef.doc(_paper.id).collection("questions").get();
      
      List<Question> questionList = data.docs.map((question) {
        return Question.fromJson(question.data());
      }).toList();

      _paper.questions = questionList;

      for (var question in _paper.questions!) {
        final res = await paperRef.doc(_paper.id)
        .collection("questions")
        .doc(question.id)
        .collection("answers")
        .get();

        List<Answer> answerList = res.docs.map((e) => Answer.fromJson(e.data())).toList();
        question.answers = answerList;
      }

      if (_paper.questions!.isNotEmpty) {
        currentQuestionIndex = 0;
      }
      _startCountdown(_paper.timeSeconds ?? 0);
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void _startCountdown(int seconds) {
    const duration = Duration(seconds: 1);
    secondsRemaining = seconds;
    _timer = Timer.periodic(duration, (timer) {
      if (secondsRemaining == 0) {
        timer.cancel();
      } else {
        int minutes = secondsRemaining~/60;
        int secs = secondsRemaining%60;

        countDown = "${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}";
        secondsRemaining--;
        notifyListeners();
      }
    });
    notifyListeners();
  }

  void onSelectAnswer(String answer) {
    _paper.questions![currentQuestionIndex].selectedAnswer = answer;
    notifyListeners();
  }

  void onChangeQuestion(String where) {
    if (where == "next") {
      currentQuestionIndex += 1;
    } else if (where == "prev") {
      currentQuestionIndex -= 1;
    }
    notifyListeners();
  }

  Future<void> onSubmitAnswers() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Map<String, dynamic> user = jsonDecode(prefs.getString(StorageKey.user)!);
      isSubmitting = true;
      notifyListeners();

      await paperLeaderboardRef(_paper.id!, user["email"])
        .set({
          "user": user,
          "points": points
        });
    } catch (e) {
      rethrow;
    } finally {
      isSubmitting = false;
      notifyListeners();
    }
  }
  
  @override
  void disposeValues() {
    _timer.cancel();
    countDown = "00:00";
  }
}