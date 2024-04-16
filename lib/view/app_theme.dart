import 'package:flutter/material.dart';

class AppTheme {
  static Color primary = const Color(0xff343534);
  static Color bckGround = const Color(0xff343534);
  static Color green = const Color(0xff61E757);
  static Color red = const Color(0xffEC4B4B);
  static Color black = const Color(0xff171717);
  static Color white = const Color(0xffFFFFFF);
  static Color textGrey = const Color(0xffCBCBCB);
  static Color grey = const Color(0xffC6C6C6);
  static Color gold = const Color(0xffFFBB3B);

  static ThemeData lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
          color: primary,
          titleTextStyle: TextStyle(
              color: white, fontSize: 18, fontWeight: FontWeight.bold)),
      scaffoldBackgroundColor: black,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: primary.withOpacity(0.7),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: gold,
        unselectedItemColor: grey,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primary,
          foregroundColor: white,
          shape: CircleBorder(side: BorderSide(color: white, width: 3.5))),
      textTheme: TextTheme(
          bodyMedium: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: white),
          bodySmall: TextStyle(
              fontSize: 10, fontWeight: FontWeight.w400, color: textGrey),
          bodyLarge: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: white)));
}
