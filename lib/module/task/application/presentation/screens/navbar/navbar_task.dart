import 'package:bizkit/core/routes/indexed_stack_route/on_generate_route.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/module/module_selector.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/profile_screen/profile_screen.dart';
import 'package:bizkit/module/task/application/controller/navbar/navbar_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/calender_view.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/task_home.dart';
import 'package:bizkit/utils/clipper/bottom_bar_clipper.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/widgets/custom_botoom_bar.dart';
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
  final List<Widget> _widgetOptions = [
    ScreenModuleSelector(),
    // const TaskHomeScreen(),
    // const ScreenTaskCalenderView(),
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
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskNavbarController>(
      builder: (controller) {
        return PopScope(
          canPop: false,
          onPopInvoked: (didPop) =>
              controller.handlePopInvocation(didPop, context),
          child: Scaffold(
              // body: IndexedStack(index: selectedIndex, children: [
              //   ScreenModuleSelector(),
              //   Navigator(
              //     key: Get.nestedKey(1),
              //     initialRoute: Routes.taskHome,
              //     onGenerateRoute: RouteGenerator().onGenerateRoute,
              //   ),
              //   Navigator(
              //     key: Get.nestedKey(2),
              //     initialRoute: Routes.cardDetailView,
              //     onGenerateRoute: RouteGenerator().onGenerateRoute,
              //   ),
              //   //ScreenTaskCalenderView(),
              //   const ProfileScreen(),
              // ]),
              // bottomNavigationBar: ClipPath(
              //   clipper: CurvedTopClipper(),
              //   child: Material(
              //     elevation: 5,
              //     shadowColor: kblack,
              //     // color: lightGrey,
              //     borderRadius: BorderRadius.only(
              //         topLeft: Radius.circular(40.w),
              //         topRight: Radius.circular(40.w)),
              //     child: BottomBarBubble(
              //       color: kneon,
              //       height: 60.h,
              //       backgroundColor:
              //           Theme.of(context).navigationBarTheme.backgroundColor ??
              //               klightDarkGrey,
              //       selectedIndex: selectedIndex,
              //       items: [
              //         BottomBarItem(
              //           iconBuilder: (color) => CircleAvatar(
              //             backgroundColor: kblack,
              //             child: Image.asset(
              //               iconModuleSelectorBottomBar,
              //               fit: BoxFit.cover,
              //               color: selectedIndex == 0 ? kneon : color,
              //               height: selectedIndex == 0 ? 40.w : 40.w,
              //               width: selectedIndex == 0 ? 40.w : 40.w,
              //             ),
              //           ),
              //         ),
              //         BottomBarItem(
              //           iconBuilder: (color) => Image.asset(
              //             cardIconHomeBottomBar,
              //             fit: BoxFit.cover,
              //             color: selectedIndex == 1 ? kneon : color,
              //             height: selectedIndex == 1 ? 32.w : 28.w,
              //             width: selectedIndex == 1 ? 32.w : 28.w,
              //           ),
              //         ),
              //         BottomBarItem(
              //           iconBuilder: (color) => Image.asset(
              //             iconTaskCalenderBottomBar,
              //             fit: BoxFit.cover,
              //             color: selectedIndex == 2 ? kneon : color,
              //             height: selectedIndex == 2 ? 27.w : 22.w,
              //             width: selectedIndex == 2 ? 27.w : 22.w,
              //           ),
              //         ),
              //         BottomBarItem(
              //           iconBuilder: (color) => Image.asset(
              //             iconAccountBottomBar,
              //             fit: BoxFit.cover,
              //             color: selectedIndex == 3 ? kneon : color,
              //             height: selectedIndex == 3 ? 32.w : 26.w,
              //             width: selectedIndex == 3 ? 32.w : 26.w,
              //           ),
              //         ),
              //       ],
              //       onSelect: (index) {
              //         controller.changeBottomIndex(index);
              //       },
              //     ),
              //   ),
              // ),
              body: Obx(() => Stack(
                    children: [
                      _widgetOptions
                          .elementAt(controller.taskBottomIndex.value),
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
                          imageSizes: const [40, 25, 25, 30],
                        ),
                      )
                    ],
                  ))),
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
