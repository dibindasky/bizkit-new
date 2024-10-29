import 'dart:developer';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TaskNavbarController extends GetxController {
  RxInt taskBottomIndex = 1.obs;

  void changeBottomIndex(int index) {
    taskBottomIndex.value = index;
    update();
  }

  Future<void> handlePopInvocation(bool didPop, BuildContext context) async {
    if (didPop) return;

    final selectedIndex = taskBottomIndex.value;
    final logString1 = "${Get.nestedKey(1)?.currentState.toString()}";
    final logString2 = "${Get.nestedKey(2)?.currentState.toString()}";

    final regex = RegExp(r'tracking (\d+) ticker');
    final match1 = regex.firstMatch(logString1);
    final match2 = regex.firstMatch(logString2);

    if (match1 == null || match2 == null) return;

    final nestedIndex1 = int.tryParse(match1.group(1)!) ?? 0;
    final nestedIndex2 = int.tryParse(match2.group(1)!) ?? 0;

    // Handle different navigation scenarios
    if (_shouldNavigateToHome(nestedIndex1, selectedIndex)) {
      changeBottomIndex(0);
      return;
    }

    if (_shouldNavigateToSecondTab(nestedIndex2, selectedIndex)) {
      changeBottomIndex(1);
      return;
    }

    if (selectedIndex == 0) {
      await _showExitDialog(context);
      return;
    }

    if (selectedIndex == 3) {
      changeBottomIndex(1);
      return;
    }

    await _handleNestedNavigation(nestedIndex1, nestedIndex2);
  }

  bool _shouldNavigateToHome(int nestedIndex1, int selectedIndex) {
    return nestedIndex1 == 2 && selectedIndex == 1;
  }

  bool _shouldNavigateToSecondTab(int nestedIndex2, int selectedIndex) {
    return nestedIndex2 == 2 && selectedIndex == 2;
  }

  Future<void> _handleNestedNavigation(
      int nestedIndex1, int nestedIndex2) async {
    bool canPop1 = Get.nestedKey(1)?.currentState?.canPop() ?? false;
    bool canPop2 = Get.nestedKey(2)?.currentState?.canPop() ?? false;

    if (nestedIndex1 == 2 && canPop1) {
      canPop1 = false;
    }
    if (nestedIndex2 == 2 && canPop2) {
      canPop2 = false;
    }

    if (canPop1) {
      Get.nestedKey(1)?.currentState?.pop();
    } else if (canPop2) {
      Get.nestedKey(2)?.currentState?.pop();
    } else {
      log('Navigation not possible');
    }
  }

  Future<bool?> _showExitDialog(BuildContext context) {
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
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Cancel',
              style: textThinStyle1,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              SystemNavigator.pop(); // Exit app
            },
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
