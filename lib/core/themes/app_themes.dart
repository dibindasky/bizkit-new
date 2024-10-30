import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  // Light Theme Configuration
  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primaryContainer: neonShade,
        surface: kblack,
        primary: neonShade,
        secondary: kgrey,
        onPrimary: kblack,
        onSecondary: kwhite,
        onSurface: kblack,
      ),
      cardTheme: const CardTheme(
        color: kwhite,
        shadowColor: kgrey,
        elevation: 2,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: kwhite,
        foregroundColor: kblack,
        elevation: 0,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: kblack),
        displayMedium: TextStyle(color: kblack),
        displaySmall: TextStyle(color: kblack),
        headlineMedium: TextStyle(color: kblack),
        headlineSmall: TextStyle(color: kblack),
        titleLarge: TextStyle(color: kblack),
        bodyLarge: TextStyle(color: kblack),
        bodyMedium: TextStyle(color: kblack),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: neonShade,
          foregroundColor: kblack,
        ),
      ),
    );
  }

  // Dark Theme Configuration
  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        surface: klightDarkGrey,
        primary: neonShade,
        secondary: kgrey,
        onPrimary: kwhite,
        onSecondary: kblack,
        onSurface: kwhite,
      ),
      cardTheme: const CardTheme(
        color: klightDarkGrey,
        shadowColor: kblack,
        elevation: 2,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: kblack,
        foregroundColor: kwhite,
        elevation: 0,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: kwhite),
        displayMedium: TextStyle(color: kwhite),
        displaySmall: TextStyle(color: kwhite),
        headlineMedium: TextStyle(color: kwhite),
        headlineSmall: TextStyle(color: kwhite),
        titleLarge: TextStyle(color: kwhite),
        bodyLarge: TextStyle(color: kwhite),
        bodyMedium: TextStyle(color: kwhite),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: neonShade,
          foregroundColor: kwhite,
        ),
      ),
    );
  }
}
