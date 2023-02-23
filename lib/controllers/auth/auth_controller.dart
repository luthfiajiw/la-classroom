import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:laclassroom/utils/const/storage_key.dart';
import 'package:laclassroom/utils/firebase_refs.dart';
import 'package:laclassroom/utils/routes/route_paths.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends ChangeNotifier {
  late FirebaseAuth auth;
  late Stream<User?> _authStateChanges;
  late User? _user;
  
  void initAuth() {
    auth = FirebaseAuth.instance;
    _authStateChanges = auth.authStateChanges();

    _authStateChanges.listen((event) {
      _user = event;
    });
    notifyListeners();
  }

  Future signInWithGoogle(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await googleSignIn.signIn();
      if (account != null) {
        final authAccount = await account.authentication;
        final credential = GoogleAuthProvider.credential(
          idToken: authAccount.idToken,
          accessToken: authAccount.accessToken,
        );

        auth.signInWithCredential(credential).then((value) {
          saveUser(context, account);
        });
      } 
    } on Exception catch(e) {
      rethrow;
    }
  }

  void signOut(BuildContext context) {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    auth.signOut();
    googleSignIn.disconnect();
    Navigator.of(context).pushNamedAndRemoveUntil(RoutePaths.auth, (route) => false);
  }
  
  void saveUser(BuildContext context, GoogleSignInAccount account) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> data = {
      "email": account.email,
      "name": account.displayName,
      "photoUrl": account.photoUrl
    };

    userRef.doc(account.email).set(data)
      .then((value) {
        prefs.setString(StorageKey.user, jsonEncode(data));
        Navigator.of(context).pushNamedAndRemoveUntil(RoutePaths.home, (route) => false);
      });
  }

  bool isLoggedIn() {
    return auth.currentUser != null;
  }
}