import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade300,
    primary: Colors.grey.shade200,
    tertiary: Colors.grey.shade100,
    secondary: Colors.white,
    inverseSurface: Colors.grey.shade900,
    inversePrimary: Colors.grey.shade800,
  ),
);

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
    tertiary: Colors.grey.shade600,
    inverseSurface: Colors.grey.shade300,
    inversePrimary: Colors.grey.shade200,
  ),
);

ThemeData changeTheme(bool isDarkMode) => isDarkMode ? darkMode : lightMode;
