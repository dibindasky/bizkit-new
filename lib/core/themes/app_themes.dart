import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  // Light Theme Configuration
  static ThemeData lightTheme() {
    return ThemeData(
      fontFamily: fontPoppins,
      scaffoldBackgroundColor: koffWhite,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: kneon,
        onPrimary: kblack,
        secondary: kgrey,
        surface: kneonDark,
      ),
      cardColor: kwhite,
      textTheme: const TextTheme(
          headlineLarge: TextStyle(
              color: kblack, fontSize: 32, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(
              color: kwhite, fontSize: 14, fontWeight: FontWeight.bold),
          bodySmall: TextStyle(color: kwhite, fontSize: 12),
          displaySmall: TextStyle(color: kblack, fontSize: 12),
          displayMedium: TextStyle(
              fontWeight: FontWeight.bold, color: kblack, fontSize: 14),
          titleLarge: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 17, color: kblack),
          titleMedium: TextStyle(
              fontSize: 15, color: kblack, fontWeight: FontWeight.bold),
          titleSmall: TextStyle(fontSize: 13, color: kblack)),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: kblack,
        refreshBackgroundColor: kblack,
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
      fontFamily: fontPoppins,
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
