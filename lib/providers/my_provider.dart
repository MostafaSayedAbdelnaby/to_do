import 'package:flutter/material.dart';

// put in this class Anything done listening from any file || any things
/// put all Logics in Provider
class MyProvider extends ChangeNotifier {
  // all Screens are listen to ThemeMode if light Or dark.
  ThemeMode themeMode = ThemeMode.light; // default value light

  // this function change from light to dark & oppositely
  changeTheme() {
    // if(themeMode==ThemeMode.light){
    //     themeMode=ThemeMode.dark;
    // }else{
    //   themeMode=ThemeMode.light;
    // }

    themeMode =
        (themeMode == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;

    // notifyListeners knows all some thing (Screens) is listen on ThemeMode that ThemeMode has changed
    // ThemeMode has changed on all Screen so I'm rap ChangeNotifierProvider() on MyApp
    notifyListeners();
  }
}
