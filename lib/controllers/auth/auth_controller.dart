import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:laclassroom/utils/firebase_refs.dart';

class AuthController extends ChangeNotifier {
  late FirebaseAuth _auth;
  late Stream<User?> _authStateChanges;
  late User? _user;
  
  void initAuth() {
    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();

    _authStateChanges.listen((event) {
      _user = event;
    });
    notifyListeners();
  }

  Future signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await googleSignIn.signIn();
      if (account != null) {
        final authAccount = await account.authentication;
        final credential = GoogleAuthProvider.credential(
          idToken: authAccount.idToken,
          accessToken: authAccount.accessToken,
        );

        await _auth.signInWithCredential(credential);
        await saveUser(account);
      } 
    } on Exception catch(e) {
      rethrow;
    }
  }
  
  Future<void> saveUser(GoogleSignInAccount account) async {
    await userRef.doc(account.email).set({
      "email": account.email,
      "name": account.displayName,
      "photoUrl": account.photoUrl
    });
  }

  bool isLoggedIn() {
    return _auth.currentUser != null;
  }
}