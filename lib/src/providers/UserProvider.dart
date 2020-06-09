import 'package:flutter/cupertino.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';

class UserProvider with ChangeNotifier {
  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _loggedIn = false;

  bool isLoggedIn() => _loggedIn;

  void login() {
    /* var user = await _handleSignIn();
 
     if (user != null) { */
    _loggedIn = true;
    print('Te logeaste');
    print('$_loggedIn : Valor de tu sesión');
    /*  } else {
      _loggedIn = true; */
    notifyListeners();
  }

  void logout() {
    _loggedIn = false;
    print('Te deslogeaste');
    print(_loggedIn);
    notifyListeners();
  }

  /* Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    print("Iniciaste sesion " + user.displayName);
    return user;
  } */
}
