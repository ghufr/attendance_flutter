
import 'package:flutter/material.dart';

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: Colors.white, backgroundColor: Colors.deepPurple,
  minimumSize: const Size(88, 48),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  ),
  textStyle: const TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 16,
  ),
);

final ButtonStyle textButtonStyle = TextButton.styleFrom(
  textStyle: const TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 16,
  ),
);

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey[100],
    brightness: Brightness.light,
    primaryColor: Colors.deepPurple,
    fontFamily: '',
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 2,
      centerTitle: true,
      foregroundColor: Colors.black,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(style: raisedButtonStyle),
    textButtonTheme: TextButtonThemeData(style: textButtonStyle),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    fontFamily: 'Poppins',
    colorScheme: const ColorScheme.dark(
      primary: Colors.deepPurple,
      onPrimary: Colors.white,
    ),
    splashColor: Colors.deepPurple.withAlpha(40),
    textTheme: const TextTheme().copyWith(
      headlineSmall: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 2,
      centerTitle: true,
      foregroundColor: Colors.white,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),
    cardColor: Colors.black,
    cardTheme: const CardTheme(
      color: Colors.black,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: Colors.grey[900],
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(style: raisedButtonStyle),
    textButtonTheme: TextButtonThemeData(style: textButtonStyle),
  );
}
