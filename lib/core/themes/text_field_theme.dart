import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';

class InputDecorationThemes {
  /// light mode inputDecorationTheme
  static final inputDecorationLightTheme = InputDecorationTheme(
    filled: true,
    fillColor: koffWhite,
    border: OutlineInputBorder(
      borderRadius: kBorderRadius15,
      borderSide: const BorderSide(color: kgrey, width: 1.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: kBorderRadius15,
      borderSide: const BorderSide(color: kgrey, width: 1.0),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: kBorderRadius15,
      borderSide: const BorderSide(color: kgrey, width: 1.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: kBorderRadius15,
      borderSide: const BorderSide(color: kneonDark, width: 1.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: kBorderRadius15,
      borderSide: const BorderSide(color: kred, width: 1.5),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: kBorderRadius15,
      borderSide: const BorderSide(color: kred, width: 1.5),
    ),
    hintStyle: const TextStyle(color: kGrayLight, fontSize: 12),
    labelStyle: const TextStyle(color: kblack, fontSize: 12),
    helperStyle: const TextStyle(color: kgrey, fontSize: 12),
    prefixIconColor: kblack,
    suffixIconColor: kblack,
    contentPadding:
        const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
  );

  /// dark mode inputDecorationTheme
  static final inputDecorationDarkTheme = InputDecorationTheme(
    filled: true,
    fillColor: koffWhite,
    border: OutlineInputBorder(
      borderRadius: kBorderRadius15,
      borderSide: const BorderSide(color: kgrey, width: 1.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: kBorderRadius15,
      borderSide: const BorderSide(color: kgrey, width: 1.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: kBorderRadius15,
      borderSide: const BorderSide(color: kneonDark, width: 1.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: kBorderRadius15,
      borderSide: const BorderSide(color: kred, width: 1.5),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: kBorderRadius15,
      borderSide: const BorderSide(color: kred, width: 1.5),
    ),
    hintStyle: const TextStyle(color: kGrayLight, fontSize: 12),
    labelStyle: const TextStyle(color: kblack, fontSize: 12),
    contentPadding:
        const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
  );
}
