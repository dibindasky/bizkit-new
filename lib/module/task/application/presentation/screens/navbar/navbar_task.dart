import 'package:bizkit/module/module_manager/application/presentation/screen/module/module_selector.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/profile_screen/profile_screen.dart';
import 'package:bizkit/module/task/application/controller/navbar/navbar_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/calender_view.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/task_home.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/show_dialogue/show_exit_dialog.dart';
import 'package:bizkit/utils/widgets/custom_botoom_bar.dart';
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
    const TaskHomeScreen(),
    const ScreenTaskCalenderView(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskNavbarController>(
      builder: (controller) {
        return PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            // controller.handlePopInvocation(didPop, context);
            if (didPop) {
              return;
            }

            if (controller.taskBottomIndex.value == 2 ||
                controller.taskBottomIndex.value == 3) {
              controller.changeBottomIndex(1);
            } else if (controller.taskBottomIndex.value == 1) {
              controller.changeBottomIndex(0);
            } else {
              // Shows an exit confirmation dialog
              showExitDialog(context);
            }
          },
          child: Scaffold(
            body: Obx(
              () => Stack(
                children: [
                  _widgetOptions.elementAt(controller.taskBottomIndex.value),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: CustomBottomBar(
                      selectedColor: kneonDark,
                      unselectedColor: kGreyDark,
                      onTap: (index) {
                        controller.taskBottomIndex.value = index;
                      },
                      selectedIndex: controller.taskBottomIndex.value,
                      imageAssets: [
                        iconModuleSelectorBottomBar,
                        cardIconHomeBottomBar,
                        iconTaskCalenderBottomBar,
                        iconAccountBottomBar
                      ],
                      imageSizes: const [25, 25, 25, 30],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
