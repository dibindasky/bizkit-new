import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  // Light Theme Configuration
  static ThemeData lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: koffWhite,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primaryContainer: kneon,
        surface: kblack,
        primary: kneon,
        secondary: kwhite,
        secondaryContainer: koffWhite,
        onPrimary: kblack,
        onSecondary: kwhite,
        onSurface: kblack,
      ),
      cardTheme: const CardTheme(
        color: kwhite,
        shadowColor: kgrey,
        elevation: 2,
      ),
      navigationBarTheme: const NavigationBarThemeData(backgroundColor: kwhite),
      appBarTheme: const AppBarTheme(
        backgroundColor: kwhite,
        foregroundColor: kblack,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: neonShade,
          foregroundColor: kblack,
        ),
      ),
      extensions: const <ThemeExtension<dynamic>>[
        ContainerThemeData(
          backgroundColor: kred,
        ),
      ],
    );
  }

  // Dark Theme Configuration
  static ThemeData darkTheme() {
    return ThemeData(
      scaffoldBackgroundColor: kblack,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        surface: klightDarkGrey,
        primary: neonShade,
        primaryContainer: kblack,
        secondary: neonShade,
        onPrimary: kwhite,
        secondaryContainer: klightDarkGrey,
        onSecondary: kblack,
        onSurface: kwhite,
      ),
      cardTheme: const CardTheme(
        color: klightDarkGrey,
        shadowColor: kblack,
        elevation: 2,
      ),
      navigationBarTheme:
          const NavigationBarThemeData(backgroundColor: klightDarkGrey),
      appBarTheme: const AppBarTheme(
        backgroundColor: kblack,
        foregroundColor: kwhite,
        elevation: 0,
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

// Container Theme Extension (custom solution)
class ContainerThemeData extends ThemeExtension<ContainerThemeData> {
  final Color backgroundColor;

  const ContainerThemeData({
    required this.backgroundColor,
  });

  @override
  ContainerThemeData copyWith({Color? backgroundColor}) {
    return ContainerThemeData(
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  ContainerThemeData lerp(ThemeExtension<ContainerThemeData>? other, double t) {
    if (other is! ContainerThemeData) {
      return this;
    }
    return ContainerThemeData(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
    );
  }
}
