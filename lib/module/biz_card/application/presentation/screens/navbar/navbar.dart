import 'package:bizkit/module/biz_card/application/business_logic/cubit/nav_cubit.dart';
import 'package:bizkit/module/biz_card/application/business_logic/promt/promt_bloc.dart';
import 'package:bizkit/module/biz_card/application/controller/navbar/navbar_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/cards_listing/view/screen/card_screen_main.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/view/home_first_screen/home_first_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/navbar/widgets/prompt.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/profile_screen/view/screen/profile_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/visiting_cards/visiting_screen.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:showcaseview/showcaseview.dart';

class CardBottomNavigationBar extends StatefulWidget {
  const CardBottomNavigationBar({super.key});

  @override
  State<CardBottomNavigationBar> createState() =>
      _CardBottomNavigationBarState();
}

class _CardBottomNavigationBarState extends State<CardBottomNavigationBar> {
  final controller = Get.put(NavbarController());
  final List<Widget> _widgetOptions = [
    //ScreenModuleSelector(),
    const ScreenCardsHomeFirstAnimation(),
    const ScreenCardsLists(),
    const ScreenCardSelfie(),
    const ProfileScreen()
  ];
  //int slectedtabIndex = 0;

  void _onItemTapped(int index) {
    context.read<NavCubit>().navbarChange(index: index);
    setState(() {
      controller.slectedtabIndex.value = index;
    });
  }

  @override
  void initState() {
    controller.slectedtabIndex.value = 0;
    context.read<PromtBloc>().add(const PromtEvent.checkPrompt());
    context.read<NavCubit>().navbarChange(index: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PopScope(
        canPop: controller.slectedtabIndex.value == 0,
        onPopInvoked: (bool didPop) async {
          if (didPop) {
            if (didPop) true;
            return;
          } else if (controller.slectedtabIndex.value == 0 &&
              homeFirstAnimationController.isCompleted) {
            showFirstScreen();
          } else if (controller.slectedtabIndex.value == 0) {
            final bool? exit = await showDialog(
              context: context,
              builder: (context) => Dialog(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: neonShade),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Exit From Bizkit?'),
                      kHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          kWidth20,
                          Expanded(
                            child: InkWell(
                              //onTap: () => Navigator.pop(context, false),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  border: Border.all(color: neonShade),
                                ),
                                child: const Center(child: Text('Cancel')),
                              ),
                            ),
                          ),
                          adjustWidth(20),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                //Navigator.pop(context, true);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: neonShade,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  border: Border.all(color: neonShade),
                                ),
                                child: const Center(child: Text('Exit')),
                              ),
                            ),
                          ),
                          adjustWidth(20),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
            print('exit ===> $exit');
            if (exit == false) {
              return;
            } else {
              Navigator.pop(context);
              return;
            }
          } else if (controller.slectedtabIndex.value == 0 &&
              !homeFirstAnimationController.isCompleted) {
            Navigator.pop(context);
          } else {
            context.read<NavCubit>().navbarChange(index: 0);
            return;
          }
        },
        child: Scaffold(
          body: ShowCaseWidget(
            builder: Builder(
              builder: (context) => Stack(
                children: [
                  _widgetOptions.elementAt(controller.slectedtabIndex.value),
                  CardPromptHomePage(
                      showPrompt: controller.slectedtabIndex.value == 0)
                ],
              ),
            ),
          ),
          bottomNavigationBar: Material(
            elevation: 5,
            shadowColor: kblack,
            child: BottomBarBubble(
              color: neonShade,
              height: 55,
              backgroundColor: backgroundColour,
              selectedIndex: controller.slectedtabIndex.value,
              items: [
                // BottomBarItem(
                //   iconBuilder: (color) => Image.asset(
                //     iconModuleSelectorBottomBar,
                //     fit: BoxFit.cover,
                //     color: state.controller.slectedtabIndex.value == 0 ? neonShade : color,
                //     height: state.controller.slectedtabIndex.value == 0 ? 36 : 30,
                //     width: state.controller.slectedtabIndex.value == 0 ? 36 : 30,
                //   ),
                // ),
                BottomBarItem(
                  iconBuilder: (color) => Image.asset(
                    cardIconHomeBottomBar,
                    fit: BoxFit.cover,
                    color: controller.slectedtabIndex.value == 0
                        ? neonShade
                        : color,
                    height: controller.slectedtabIndex.value == 0 ? 32 : 26,
                    width: controller.slectedtabIndex.value == 0 ? 32 : 26,
                  ),
                ),
                BottomBarItem(
                  iconBuilder: (color) => Image.asset(
                    cardIconcardIcon,
                    fit: BoxFit.cover,
                    color: controller.slectedtabIndex.value == 1
                        ? neonShade
                        : color,
                    height: controller.slectedtabIndex.value == 1 ? 27 : 22,
                    width: controller.slectedtabIndex.value == 1 ? 27 : 22,
                  ),
                ),
                BottomBarItem(
                  iconBuilder: (color) => Image.asset(
                    iconScannerBottombar,
                    fit: BoxFit.cover,
                    color: controller.slectedtabIndex.value == 2
                        ? neonShade
                        : color,
                    height: controller.slectedtabIndex.value == 2 ? 26 : 20,
                    width: controller.slectedtabIndex.value == 2 ? 26 : 20,
                  ),
                ),
                BottomBarItem(
                  iconBuilder: (color) => Image.asset(
                    iconAccountBottomBar,
                    fit: BoxFit.cover,
                    color: controller.slectedtabIndex.value == 3
                        ? neonShade
                        : color,
                    height: controller.slectedtabIndex.value == 3 ? 32.w : 26.w,
                    width: controller.slectedtabIndex.value == 3 ? 32.w : 26.w,
                  ),
                ),
              ],
              onSelect: (index) {
                _onItemTapped(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
