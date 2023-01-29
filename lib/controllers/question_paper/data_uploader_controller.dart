
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:laclassroom/models/question_paper/question_paper_model.dart';
import 'package:laclassroom/utils/firebase_refs.dart';

class DataUploaderController extends ChangeNotifier {
  Future<void> uploadData(BuildContext context) async {
    final firestore = FirebaseFirestore.instance;

    final manifestContent = await DefaultAssetBundle.of(context).loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = jsonDecode(manifestContent);
    final papersInAssets = manifestMap.keys.where((e) {
      return e.startsWith("assets/DB/paper") && e.contains(".json");
    }).toList();
    List<Paper> papers = [];

    for (String paper in papersInAssets) {
      String stringPaperContent = await rootBundle.loadString(paper);
      papers.add(Paper.fromJson(jsonDecode(stringPaperContent)));
    }

    var batch = firestore.batch();

    for (var paper in papers) {
      batch.set(paperRef.doc(paper.id), {
        "title": paper.title,
        "image_url": paper.imageUrl,
        "Description": paper.description,
        "time_seconds": paper.timeSeconds,
        "questions_count": paper.questions?.length ?? 0
      });

      for (var question in paper.questions!) {
        final questionDoc = questionRef(paperId: paper.id!, questionId: question.id!);
        batch.set(questionDoc, {
          "question": question.question,
          "correct_answer": question.correctAnswer
        });

        for (var answer in question.answers!) {
          batch.set(questionDoc.collection("answers").doc(answer.identifier), {
            "Answer": answer.answer
          });
        }
      }
    }

    await batch.commit();
  }
}