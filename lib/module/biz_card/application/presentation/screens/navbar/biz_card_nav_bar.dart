import 'package:bizkit/module/biz_card/application/controller/navbar/navbar_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_and_connection_tab.dart/card_and_connection_tabs.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/bizcard_home.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/scan_and_creation/scan_and_create.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/profile_screen/profile_screen.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/module/module_selector.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/show_dialogue/show_exit_dialog.dart';
import 'package:bizkit/utils/widgets/custom_botoom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BizCardNavBarScreen extends StatelessWidget {
  BizCardNavBarScreen({super.key});

  final List<Widget> _widgetOptions = [
    ScreenModuleSelector(),
    const BizCardHomeScreen(),
    const BizCardAndConnectionScreen(),
    const BizCardScanAndCreateScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NavbarController>();
    return Obx(
      () => PopScope(
        // canPop: controller.slectedtabIndex.value == 0,
        // onPopInvoked: (bool didPop) async {
        //   if (didPop) {
        //     if (didPop) true;
        //     return;
        //   } else if (controller.slectedtabIndex.value == 0 &&
        //       homeFirstAnimationController.isCompleted) {
        //     showFirstScreen();
        //   } else if (controller.slectedtabIndex.value == 0) {
        //     final bool? exit = await showDialog(
        //       context: context,
        //       builder: (context) => Dialog(
        //         child: Container(
        //           padding:
        //               const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        //           decoration: BoxDecoration(
        //             borderRadius: const BorderRadius.all(Radius.circular(20)),
        //             border: Border.all(color: neonShade),
        //           ),
        //           child: Column(
        //             mainAxisSize: MainAxisSize.min,
        //             children: [
        //               const Text('Exit From Bizkit?'),
        //               kHeight10,
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
        //                 children: [
        //                   kWidth20,
        //                   Expanded(
        //                     child: InkWell(
        //                       //onTap: () => Navigator.pop(context, false),
        //                       child: Container(
        //                         padding: const EdgeInsets.all(10),
        //                         decoration: BoxDecoration(
        //                           borderRadius: const BorderRadius.all(
        //                               Radius.circular(5)),
        //                           border: Border.all(color: neonShade),
        //                         ),
        //                         child: const Center(child: Text('Cancel')),
        //                       ),
        //                     ),
        //                   ),
        //                   kWidth20,
        //                   Expanded(
        //                     child: InkWell(
        //                       onTap: () {
        //                         //Navigator.pop(context, true);
        //                       },
        //                       child: Container(
        //                         padding: const EdgeInsets.all(10),
        //                         decoration: BoxDecoration(
        //                           color: neonShade,
        //                           borderRadius: const BorderRadius.all(
        //                               Radius.circular(5)),
        //                           border: Border.all(color: neonShade),
        //                         ),
        //                         child: const Center(child: Text('Exit')),
        //                       ),
        //                     ),
        //                   ),
        //                   kWidth20,
        //                 ],
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     );
        //     print('exit ===> $exit');
        //     if (exit == false) {
        //       return;
        //     } else {
        //       Navigator.pop(context);
        //       return;
        //     }
        //   } else if (controller.slectedtabIndex.value == 0 &&
        //       !homeFirstAnimationController.isCompleted) {
        //     Navigator.pop(context);
        //   } else {
        //     controller.changeBottomBar(0);
        //     return;
        //   }
        // },

        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) {
            return;
          } else {
            if (controller.slectedtabIndex.value == 2 ||
                controller.slectedtabIndex.value == 3 ||
                controller.slectedtabIndex.value == 4) {
              controller.changeBottomBar(1);
            } else if (controller.slectedtabIndex.value == 1) {
              controller.changeBottomBar(0);
            } else {
              // Shows an exit confirmation dialog
              showExitDialog(context);
            }
          }
        },
        child: Scaffold(
          body: Stack(
            children: [
              _widgetOptions.elementAt(controller.slectedtabIndex.value),
              // CardPromptHomePage(
              //     showPrompt: controller.slectedtabIndex.value == 1),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: CustomBottomBar(
                    selectedColor: kneonDark,
                    unselectedColor: kGreyDark,
                    onTap: (index) {
                      controller.slectedtabIndex.value = index;
                    },
                    selectedIndex: controller.slectedtabIndex.value,
                    imageAssets: [
                      iconModuleSelectorBottomBar,
                      cardIconHomeBottomBar,
                      cardIconcardIcon,
                      iconScannerBottombar,
                      iconAccountBottomBar
                    ],
                    imageSizes: const [40, 25, 25, 25, 30],
                  ))
            ],
          ),
          // bottomNavigationBar: Material(
          //   elevation: 5,
          //   shadowColor: kblack,
          //   child: BottomBarBubble(
          //     color: neonShade,
          //     height: 55,
          //     backgroundColor: backgroundColour,
          //     selectedIndex: controller.slectedtabIndex.value,
          //     items: [
          //       BottomBarItem(
          //         iconBuilder: (color) => Image.asset(
          //           iconModuleSelectorBottomBar,
          //           fit: BoxFit.cover,
          //           color: controller.slectedtabIndex.value == 0
          //               ? neonShade
          //               : color,
          //           height: controller.slectedtabIndex.value == 0 ? 36 : 30,
          //           width: controller.slectedtabIndex.value == 0 ? 36 : 30,
          //         ),
          //       ),
          //       BottomBarItem(
          //         iconBuilder: (color) => Image.asset(
          //           cardIconHomeBottomBar,
          //           fit: BoxFit.cover,
          //           color: controller.slectedtabIndex.value == 1
          //               ? neonShade
          //               : color,
          //           height: controller.slectedtabIndex.value == 1 ? 32 : 26,
          //           width: controller.slectedtabIndex.value == 1 ? 32 : 26,
          //         ),
          //       ),
          //       BottomBarItem(
          //         iconBuilder: (color) => Image.asset(
          //           cardIconcardIcon,
          //           fit: BoxFit.cover,
          //           color: controller.slectedtabIndex.value == 2
          //               ? neonShade
          //               : color,
          //           height: controller.slectedtabIndex.value == 2 ? 27 : 22,
          //           width: controller.slectedtabIndex.value == 2 ? 27 : 22,
          //         ),
          //       ),
          //       BottomBarItem(
          //         iconBuilder: (color) => Image.asset(
          //           iconScannerBottombar,
          //           fit: BoxFit.cover,
          //           color: controller.slectedtabIndex.value == 3
          //               ? neonShade
          //               : color,
          //           height: controller.slectedtabIndex.value == 3 ? 26 : 20,
          //           width: controller.slectedtabIndex.value == 3 ? 26 : 20,
          //         ),
          //       ),
          //       BottomBarItem(
          //         iconBuilder: (color) => Image.asset(
          //           iconAccountBottomBar,
          //           fit: BoxFit.cover,
          //           color: controller.slectedtabIndex.value == 4
          //               ? neonShade
          //               : color,
          //           height: controller.slectedtabIndex.value == 4 ? 32.w : 26.w,
          //           width: controller.slectedtabIndex.value == 4 ? 32.w : 26.w,
          //         ),
          //       ),
          //     ],
          //     onSelect: (index) {
          //       controller.slectedtabIndex.value = index;
          //     },
          //   ),
          // ),
        ),
      ),
    );
  }
}
