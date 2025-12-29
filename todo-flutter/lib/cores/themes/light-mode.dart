import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  appBarTheme: AppBarTheme(
    //titleSpacing: 0,
    titleTextStyle: TextStyle(
      color: Color(0xFF444748),
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
    ),
  ),
  colorScheme: ColorScheme.light(
    primary: Colors.deepPurple,
    surface: Color(0xFFFFFFFF),
    inverseSurface: Color(0xFF444748),
    onTertiary: Color(0XFF32C832),
  ),
  scaffoldBackgroundColor: Color(0xFFFFFFFF),
  textTheme: TextTheme(),
);
