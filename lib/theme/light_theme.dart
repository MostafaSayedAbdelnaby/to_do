import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/theme/theme.dart';

class LightTheme extends BaseTheme {
  @override
  Color get backgroundColor => const Color(0xFFF2FEFF);

  @override
  Color get primaryColor => const Color(0xFF5669FF);

  @override
  Color get textColor => const Color(0xFF1C1C1C);

  @override
  ThemeData get themeData => ThemeData(
        primaryColor: primaryColor,
        splashColor: textColor, // for background OnboardingScreen
        primaryColorLight: backgroundColor, // for globalBackgroundColor in OnboardingScreen
        focusColor: const Color(0xFF7B7B7B),
        // for border of TextField
        scaffoldBackgroundColor: backgroundColor,
        // the next line for the Icon where in HomeScreen
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: primaryColor,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35),
                borderSide: const BorderSide(
                  color: Colors.white,
                  width: 4,
                ))),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: backgroundColor,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          backgroundColor: primaryColor,
        ),
        textTheme: TextTheme(
          titleSmall: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
          titleMedium: GoogleFonts.inter(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
          titleLarge: GoogleFonts.inter(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
      );
}
