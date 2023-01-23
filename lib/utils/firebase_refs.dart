import 'package:cloud_firestore/cloud_firestore.dart';

final firestore = FirebaseFirestore.instance;
final paperRef = firestore.collection("papers");

DocumentReference questionRef({
  required String paperId,
  required String questionId
}) => paperRef.doc(paperId).collection("questions").doc(questionId);