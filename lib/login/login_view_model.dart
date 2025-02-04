// all directly have two dart file [ class Ui & class Logic ]
// this is a class Logic of LoginScreen == provider == cubit

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:to_do/login/login_connector.dart';

class LoginViewModel extends ChangeNotifier {
  LoginConnector? loginConnector;

  Future<void> login(String email, String password) async {
    try {
      loginConnector!.onLoading();
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      loginConnector!.onSuccess();
    } on FirebaseAuthException catch (e) {
      loginConnector!.onError("Email or password is not valid");
    }
  }
}
