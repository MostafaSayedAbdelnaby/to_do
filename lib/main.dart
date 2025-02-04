import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/providers/auth_provider.dart';
import 'package:to_do/providers/my_provider.dart';
import 'package:to_do/screens/create_event.dart';
import 'package:to_do/screens/forget_password.dart';
import 'package:to_do/screens/home/home.dart';
import 'package:to_do/login/login_screen.dart';
import 'package:to_do/screens/onboarding_screen.dart';
import 'package:to_do/screens/register_screen.dart';
import 'package:to_do/theme/dark_theme.dart';
import 'package:to_do/theme/light_theme.dart';
import 'package:to_do/theme/theme.dart';

import 'firebase_options.dart';
import 'screens/intro_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // It's possible to disable network access for your Firestore client, Named with Local DataBase
  // await FirebaseFirestore.instance.disableNetwork(); // don't use with auth

  /// firebase crashlytics track (error Or exception) that in terminal
  // Non-async exceptions
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
  };
  // Async exceptions
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack);

    return true;
  };

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MyProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
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
    var authProvider = Provider.of<UserProvider>(
        context); // create object authProvider to listen on Login & sign_out
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
        IntroScreen.routeName: (context) => IntroScreen(),
        OnboardingScreen.routeName: (context) => OnboardingScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        ForgetPasswordScreen.routeName: (context) => ForgetPasswordScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        CreateEvent.routeName: (context) => CreateEvent(),
      },
      initialRoute: authProvider.currentUser != null
          ? HomeScreen.routeName
          : IntroScreen.routeName,
    );
  }
}
