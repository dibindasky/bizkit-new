import 'dart:developer';

import 'package:bizkit/core/routes/indexed_stack_route/on_generate_route.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/module/module_selector.dart';
import 'package:bizkit/module/task/application/controller/navbar/navbar_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/profile/task_profile.dart';
import 'package:bizkit/utils/clipper/bottom_bar_clipper.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScreenNavbarTaskModule extends StatefulWidget {
  const ScreenNavbarTaskModule({super.key});

  @override
  State<ScreenNavbarTaskModule> createState() => _ScreenNavbarTaskModuleState();
}

class _ScreenNavbarTaskModuleState extends State<ScreenNavbarTaskModule> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskNavbarController>(
      builder: (controller) {
        int selectedIndex = controller.taskBottomIndex.value;

        return PopScope(
          canPop: false,
          onPopInvoked: (didPop) async {
            if (!didPop) {
              final logString1 = "${Get.nestedKey(1)?.currentState.toString()}";
              final logString2 = "${Get.nestedKey(2)?.currentState.toString()}";

              final regex = RegExp(r'tracking (\d+) ticker');

              final match1 = regex.firstMatch(logString1);
              final match2 = regex.firstMatch(logString2);

              if (match1 != null && match2 != null) {
                final nestedIndex1 = int.tryParse(match1.group(1)!) ?? 0;
                final nestedIndex2 = int.tryParse(match2.group(1)!) ?? 0;

                if (nestedIndex1 == 2 && selectedIndex == 1) {
                  controller.changeBottomIndex(0);
                  return;
                } else if (nestedIndex2 == 2 && selectedIndex == 2) {
                  controller.changeBottomIndex(1);
                  return;
                } else if (selectedIndex == 0) {
                  await exitConfirmationDialog(context) ?? false;
                  return;
                } else if (selectedIndex == 3) {
                  controller.changeBottomIndex(1);
                  return;
                } else {
                  bool canPop1 =
                      Get.nestedKey(1)?.currentState?.canPop() ?? false;
                  bool canPop2 =
                      Get.nestedKey(2)?.currentState?.canPop() ?? false;

                  if (nestedIndex1 == 2 && canPop1 == true) {
                    canPop1 = false;
                  }
                  if (nestedIndex2 == 2 && canPop2 == true) {
                    canPop2 = false;
                  }
                  if (canPop1 == true) {
                    Get.nestedKey(1)?.currentState?.pop();
                    return;
                  } else if (canPop2 == true) {
                    Get.nestedKey(2)?.currentState?.pop();
                    return;
                  } else {
                    log('Not working');
                  }
                }
              }
            }
          },
          child: Scaffold(
            body: IndexedStack(index: selectedIndex, children: [
              ScreenModuleSelector(),
              Navigator(
                key: Get.nestedKey(1),
                initialRoute: Routes.taskHome,
                onGenerateRoute: RouteGenerator().onGenerateRoute,
              ),
              Navigator(
                key: Get.nestedKey(2),
                initialRoute: Routes.cardDetailView,
                onGenerateRoute: RouteGenerator().onGenerateRoute,
              ),
              //ScreenTaskCalenderView(),
              const ScreenTaskProfile(),
            ]),
            bottomNavigationBar: ClipPath(
              clipper: CurvedTopClipper(),
              child: Material(
                elevation: 5,
                shadowColor: kblack,
                // color: lightGrey,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.w),
                    topRight: Radius.circular(40.w)),
                child: BottomBarBubble(
                  color: neonShade,
                  height: 60.h,
                  backgroundColor: klightDarkGrey,
                  selectedIndex: selectedIndex,
                  items: [
                    BottomBarItem(
                      iconBuilder: (color) => CircleAvatar(
                        backgroundColor: kblack,
                        child: Image.asset(
                          iconModuleSelectorBottomBar,
                          fit: BoxFit.cover,
                          color: selectedIndex == 0 ? neonShade : color,
                          height: selectedIndex == 0 ? 40.w : 40.w,
                          width: selectedIndex == 0 ? 40.w : 40.w,
                        ),
                      ),
                    ),
                    BottomBarItem(
                      iconBuilder: (color) => Image.asset(
                        cardIconHomeBottomBar,
                        fit: BoxFit.cover,
                        color: selectedIndex == 1 ? neonShade : color,
                        height: selectedIndex == 1 ? 32.w : 28.w,
                        width: selectedIndex == 1 ? 32.w : 28.w,
                      ),
                    ),
                    BottomBarItem(
                      iconBuilder: (color) => Image.asset(
                        iconTaskCalenderBottomBar,
                        fit: BoxFit.cover,
                        color: selectedIndex == 2 ? neonShade : color,
                        height: selectedIndex == 2 ? 27.w : 22.w,
                        width: selectedIndex == 2 ? 27.w : 22.w,
                      ),
                    ),
                    BottomBarItem(
                      iconBuilder: (color) => Image.asset(
                        iconAccountBottomBar,
                        fit: BoxFit.cover,
                        color: selectedIndex == 3 ? neonShade : color,
                        height: selectedIndex == 3 ? 32.w : 26.w,
                        width: selectedIndex == 3 ? 32.w : 26.w,
                      ),
                    ),
                  ],
                  onSelect: (index) {
                    controller.changeBottomIndex(index);
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
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
