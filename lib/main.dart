import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/providers/my_provider.dart';
import 'package:to_do/screens/login_screen.dart';
import 'package:to_do/theme/dark_theme.dart';
import 'package:to_do/theme/light_theme.dart';
import 'package:to_do/theme/theme.dart';

import 'screens/introduction_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      // I'm create MyProvider to knows all Screen on it
      create: (context) => MyProvider(),
      child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(
        context); // create object provider from MyProvider to used in ThemeMode & listen on ThemeMode
    BaseTheme lightTheme = LightTheme();
    BaseTheme darkTheme = DarkTheme();
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: lightTheme.themeData,
      darkTheme: darkTheme.themeData,
      // provider.themeMode in class MyProvider
      themeMode: provider.themeMode,
      routes: {
        IntroductionScreen.routeName: (context) => IntroductionScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        // LoginScreen.routeName: (context) => LoginScreen(),
      },
      initialRoute:
          IntroductionScreen.routeName,
    );
  }
}
