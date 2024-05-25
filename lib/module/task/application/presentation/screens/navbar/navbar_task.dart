import 'package:bizkit/module/module_manager/application/presentation/screen/module/module_selector.dart';
import 'package:bizkit/module/task/application/controller/navbar/navbar_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/calender_view.dart';
import 'package:bizkit/module/task/application/presentation/screens/profile/task_profile.dart';
import 'package:bizkit/module/task/application/presentation/screens/task_home/task_home.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenNavbarTaskModule extends StatefulWidget {
  const ScreenNavbarTaskModule({super.key});

  @override
  State<ScreenNavbarTaskModule> createState() => _ScreenNavbarTaskModuleState();
}

class _ScreenNavbarTaskModuleState extends State<ScreenNavbarTaskModule> {
  final List<Widget> _widgetOptions = [
    ScreenModuleSelector(),
    const ScreenTaskHome(),
    CalenderView(),
    const ScreenTaskProfile(),
  ];

  // int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TaskNavbarController>();
    int selectedIndex = controller.taskBottomIndex.value;
    return Scaffold(
      body: _widgetOptions[selectedIndex],
      bottomNavigationBar: Material(
        elevation: 5,
        shadowColor: kblack,
        child: BottomBarBubble(
          color: neonShade,
          height: 55,
          backgroundColor: backgroundColour,
          selectedIndex: selectedIndex,
          items: [
            BottomBarItem(
              iconBuilder: (color) => Image.asset(
                iconModuleSelectorBottomBar,
                fit: BoxFit.cover,
                color: selectedIndex == 0 ? neonShade : color,
                height: selectedIndex == 0 ? 38 : 30,
                width: selectedIndex == 0 ? 38 : 30,
              ),
            ),
            BottomBarItem(
              iconBuilder: (color) => Image.asset(
                iconHomeBottomBar,
                fit: BoxFit.cover,
                color: selectedIndex == 1 ? neonShade : color,
                height: selectedIndex == 1 ? 32 : 26,
                width: selectedIndex == 1 ? 32 : 26,
              ),
            ),
            BottomBarItem(
              iconBuilder: (color) => Image.asset(
                iconTaskCalenderBottomBar,
                fit: BoxFit.cover,
                color: selectedIndex == 2 ? neonShade : color,
                height: selectedIndex == 2 ? 27 : 22,
                width: selectedIndex == 2 ? 27 : 22,
              ),
            ),
            BottomBarItem(
              iconBuilder: (color) => Image.asset(
                iconAccountBottomBar,
                fit: BoxFit.cover,
                color: selectedIndex == 3 ? neonShade : color,
                height: selectedIndex == 3 ? 30 : 26,
                width: selectedIndex == 3 ? 30 : 26,
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
    );
  }
}
