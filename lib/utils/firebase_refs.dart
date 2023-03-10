import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

Reference get firebaseStorage => FirebaseStorage.instance.ref();

final firestore = FirebaseFirestore.instance;
final paperRef = firestore.collection("papers");
final userRef = firestore.collection("users");
final leaderboardRef = firestore.collection("leaderboards");

DocumentReference questionRef({
  required String paperId,
  required String questionId
}) => paperRef.doc(paperId).collection("questions").doc(questionId);

DocumentReference paperLeaderboardRef(
  String paperId,
  String email
) => leaderboardRef.doc(paperId).collection("ranks").doc(email);