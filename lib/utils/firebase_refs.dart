import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

Reference get firebaseStorage => FirebaseStorage.instance.ref();

final firestore = FirebaseFirestore.instance;
final paperRef = firestore.collection("papers");

DocumentReference questionRef({
  required String paperId,
  required String questionId
}) => paperRef.doc(paperId).collection("questions").doc(questionId);