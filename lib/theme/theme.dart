import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    primaryColor: const Color(0xFF7dcfff),
    primaryColorDark: const Color(0xFF7aa2f7),
    primaryColorLight: const Color(0xFFFE9AAA),
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: const Color(0xFFF5F5F5),
    fontFamily: 'Futura',
    appBarTheme: const AppBarTheme(
        //color: Color(0xFFFE3C5B),
        backgroundColor: Color(0xFF7aa2f7),
        elevation: 5.0),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Color(0xFF1B070b),
        fontWeight: FontWeight.bold,
        fontSize: 36,
      ),
      headline2: TextStyle(
        color: Color(0xFF1B070b),
        fontWeight: FontWeight.bold,
        fontSize: 36,
      ),
      headline3: TextStyle(
        color: Color(0xFF1B070b),
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      headline4: TextStyle(
        color: Color(0xFF1B070b),
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      headline5: TextStyle(
        color: Color(0xFF1B070b),
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      headline6: TextStyle(
        color: Color(0xFF1B070b),
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
      bodyText1: TextStyle(
        color: Color(0xFF1B070b),
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
      bodyText2: TextStyle(
        color: Color(0xFF1B070b),
        fontWeight: FontWeight.normal,
        fontSize: 10,
      ),
    ),
  );
}
