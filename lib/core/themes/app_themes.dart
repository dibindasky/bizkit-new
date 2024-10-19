import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
          primaryContainer: neonShade,
          surface: kblack,
          primary: neonShade,
          secondary: kgrey),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
          surface: klightDarkGrey, primary: neonShade, secondary: kgrey),
    );
  }
}
