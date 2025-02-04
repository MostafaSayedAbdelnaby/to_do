import 'package:flutter/material.dart';

import '../../../firebase/firebase_manager.dart';
import '../../../login/login_screen.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        color: Colors.cyan,
        child: ElevatedButton(
            onPressed: () {
              FirebaseManager.logOut();
              Navigator.pushNamedAndRemoveUntil(
                context,
                LoginScreen.routeName,
                    (route) => false,
              );
            },
            child: Text("Logout")),
      ),
    );
  }
}
