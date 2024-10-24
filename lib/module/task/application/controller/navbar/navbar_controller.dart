import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskNavbarController extends GetxController {
  RxInt taskBottomIndex = 1.obs;

  changeBottomIndex(int index) {
    taskBottomIndex.value = index;
    update();
  }

  // Function to handle back button navigation
  Future<bool> handleBackNavigation(
      int selectedIndex, BuildContext context) async {
    if (selectedIndex == 0) {
      // Show exit confirmation dialog for the first tab
      return await exitConfirmationDialog(context) ?? false;
    } else if (selectedIndex == 1) {
      changeBottomIndex(0);
      return false; // Prevent default back behavior
    } else if (selectedIndex == 2 || selectedIndex == 3) {
      changeBottomIndex(1);
      return false; // Prevent default back behavior
    }
    return true; // Allow default back behavior for other cases
  }

  // Exit confirmation dialog
  Future<bool?> exitConfirmationDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        elevation: 8,
        surfaceTintColor: kblack,
        titleTextStyle: textHeadStyle1.copyWith(fontWeight: FontWeight.w300),
        contentTextStyle: textThinStyle1,
        shadowColor: neonShade,
        title: const Text('Exit App'),
        content: const Text('Are you sure you want to exit the app?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              'Cancel',
              style: textThinStyle1,
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(
              'Exit',
              style: textThinStyle1,
            ),
          ),
        ],
      ),
    );
  }
}
