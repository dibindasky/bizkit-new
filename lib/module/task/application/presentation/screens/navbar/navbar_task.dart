import 'package:bizkit/core/routes/indexed_stack_route/on_generate_route.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/module/module_selector.dart';
import 'package:bizkit/module/task/application/controller/navbar/navbar_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/calender_view.dart';
import 'package:bizkit/module/task/application/presentation/screens/profile/task_profile.dart';
import 'package:bizkit/utils/clipper/bottom_bar_clipper.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:flutter/material.dart';
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
    final controller = Get.find<TaskNavbarController>();
    int selectedIndex = controller.taskBottomIndex.value;
    return Scaffold(
      body: IndexedStack(index: selectedIndex, children: [
        ScreenModuleSelector(),
        Navigator(
          key: Get.nestedKey(1),
          initialRoute: Routes.taskHome,
          onGenerateRoute: RouteGenerator().onGenerateRoute,
        ),
        ScreenTaskCalenderView(),
        const ScreenTaskProfile(),
      ]),
      bottomNavigationBar: ClipPath(
        clipper: CurvedTopClipper(),
        child: Material(
          elevation: 5,
          shadowColor: kblack,
          // color: lightGrey,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.w), topRight: Radius.circular(40.w)),
          child: BottomBarBubble(
            color: neonShade,
            height: 60.h,
            backgroundColor: lightGrey,
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
                  iconHomeBottomBar,
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
              setState(() {
                selectedIndex = index;
              });
              controller.changeBottomIndex(index);
            },
          ),
        ),
      ),
    );
  }
}
