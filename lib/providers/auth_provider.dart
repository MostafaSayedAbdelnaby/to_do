import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do/firebase/firebase_manager.dart';
import 'package:to_do/model/user_model.dart';

// used provider as sharedReference
// used this provider for sign-out
class UserProvider extends ChangeNotifier {
  UserModel? userModel;
  User? currentUser;

  UserProvider() {
    currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      initUser();
    }
  }

  // Read User from dateBase
  initUser() async {
    // if occur login after sign_out so at get initUser() in LoginScreen , for update dataUser
    currentUser = FirebaseAuth.instance.currentUser;
    userModel = await FirebaseManager.readUserDate(currentUser!.uid);
    notifyListeners();
  }
}
