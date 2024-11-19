import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class BottomSheetThemes {
  static const bottomSheetLightTheme = BottomSheetThemeData(
    backgroundColor: koffWhite, // Background color of the bottom sheet
    modalBackgroundColor: koffWhite, // Background color for modal bottom sheet
    elevation: 8.0, // Elevation of the bottom sheet
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30.0), // Rounded corners at the top
      ),
    ),
    clipBehavior: Clip.antiAlias, // Clip behavior for the bottom sheet
    modalElevation: 10.0, // Elevation for modal bottom sheets
  );

  static const bottomSheetDarkTheme = BottomSheetThemeData(
    backgroundColor: koffWhite, // Background color of the bottom sheet
    modalBackgroundColor: koffWhite, // Background color for modal bottom sheet
    elevation: 8.0, // Elevation of the bottom sheet
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30.0), // Rounded corners at the top
      ),
    ),
    clipBehavior: Clip.antiAlias, // Clip behavior for the bottom sheet
    modalElevation: 10.0, // Elevation for modal bottom sheets
  );
}
