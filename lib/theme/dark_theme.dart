import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/theme/theme.dart';

class DarkTheme extends BaseTheme{
  @override
  Color get backgroundColor => const Color(0xFF101127);

  @override
  Color get primaryColor =>const Color(0xFF5669FF);

  @override
  Color get textColor => const Color(0xFFF4EBDC);

  @override
  ThemeData get themeData => ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: backgroundColor,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: Colors.white,
      backgroundColor: backgroundColor,
    ),
    textTheme: TextTheme(
      titleSmall: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),titleMedium: GoogleFonts.inter(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      color: textColor,
    ),titleLarge: GoogleFonts.inter(
      fontSize: 30,
      fontWeight: FontWeight.w500,
      color: textColor,
    ),
    ),

  );

}