import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:laclassroom/utils/firebase_refs.dart';

class AuthController extends ChangeNotifier {
  late FirebaseAuth auth;
  late Stream<User?> authStateChanges;
  late User? user;
  
  void initAuth() {
    auth = FirebaseAuth.instance;
    authStateChanges = auth.authStateChanges();

    authStateChanges.listen((event) {
      user = event;
    });
    notifyListeners();
  }

  Future signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        final _authAccount = await account.authentication;
        final _credential = GoogleAuthProvider.credential(
          idToken: _authAccount.idToken,
          accessToken: _authAccount.accessToken,
        );

        await auth.signInWithCredential(_credential);
        await saveUser(account);
      } 
    } on Exception catch(e) {
      rethrow;
    }
  }
  
  saveUser(GoogleSignInAccount account) {
    userRef.doc(account.email).set({
      "email": account.email,
      "name": account.displayName,
      "photoUrl": account.photoUrl
    });
  }
}