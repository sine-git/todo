import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  appBarTheme: AppBarTheme(
    titleSpacing: 0,
    titleTextStyle: TextStyle(
      color: Color(0xFFFFFFFF),
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
    ),
  ),
  colorScheme: ColorScheme.dark(
    primary: Color(0xFFFF7900),
    surface: Color(0xFF444748),
    inverseSurface: Color(0xFFFFFFFF),
    onTertiary: Color(0XFF32C832),
  ),
  scaffoldBackgroundColor: Color(0xFF444748),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Color(0xFFFFFFFF)),
    bodyMedium: TextStyle(color: Color(0xFFFFFFFF)),
    bodySmall: TextStyle(color: Color(0xFFFFFFFF)),
  ),
);
