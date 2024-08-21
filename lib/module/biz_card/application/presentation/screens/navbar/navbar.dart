import 'package:bizkit/module/biz_card/application/business_logic/cubit/nav_cubit.dart';
import 'package:bizkit/module/biz_card/application/business_logic/promt/promt_bloc.dart';
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
import 'package:showcaseview/showcaseview.dart';

class CardBottomNavigationBar extends StatefulWidget {
  const CardBottomNavigationBar({super.key});

  @override
  State<CardBottomNavigationBar> createState() =>
      _CardBottomNavigationBarState();
}

class _CardBottomNavigationBarState extends State<CardBottomNavigationBar> {
  final List<Widget> _widgetOptions = [
    //ScreenModuleSelector(),
    const ScreenCardsHomeFirstAnimation(),
    const ScreenCardsLists(),
    const ScreenCardSelfie(),
    const ProfileScreen()
  ];
  int slectedtabIndex = 0;

  void _onItemTapped(int index) {
    context.read<NavCubit>().navbarChange(index: index);
    setState(() {
      slectedtabIndex = index;
    });
  }

  @override
  void initState() {
    slectedtabIndex = 0;
    context.read<PromtBloc>().add(const PromtEvent.checkPrompt());
    context.read<NavCubit>().navbarChange(index: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, NavState>(
      builder: (context, state) {
        return PopScope(
          canPop: state.slectedtabIndex == 0,
          onPopInvoked: (bool didPop) async {
            if (didPop) {
              if (didPop) true;
              return;
            } else if (state.slectedtabIndex == 0 &&
                homeFirstAnimationController.isCompleted) {
              showFirstScreen();
            } else if (state.slectedtabIndex == 0) {
              final bool? exit = await showDialog(
                context: context,
                builder: (context) => Dialog(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
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
            } else if (state.slectedtabIndex == 0 &&
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
                    _widgetOptions.elementAt(state.slectedtabIndex),
                    CardPromptHomePage(showPrompt: state.slectedtabIndex == 0)
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
                selectedIndex: state.slectedtabIndex,
                items: [
                  // BottomBarItem(
                  //   iconBuilder: (color) => Image.asset(
                  //     iconModuleSelectorBottomBar,
                  //     fit: BoxFit.cover,
                  //     color: state.slectedtabIndex == 0 ? neonShade : color,
                  //     height: state.slectedtabIndex == 0 ? 36 : 30,
                  //     width: state.slectedtabIndex == 0 ? 36 : 30,
                  //   ),
                  // ),
                  BottomBarItem(
                    iconBuilder: (color) => Image.asset(
                      cardIconHomeBottomBar,
                      fit: BoxFit.cover,
                      color: state.slectedtabIndex == 0 ? neonShade : color,
                      height: state.slectedtabIndex == 0 ? 32 : 26,
                      width: state.slectedtabIndex == 0 ? 32 : 26,
                    ),
                  ),
                  BottomBarItem(
                    iconBuilder: (color) => Image.asset(
                      cardIconcardIcon,
                      fit: BoxFit.cover,
                      color: state.slectedtabIndex == 1 ? neonShade : color,
                      height: state.slectedtabIndex == 1 ? 27 : 22,
                      width: state.slectedtabIndex == 1 ? 27 : 22,
                    ),
                  ),
                  BottomBarItem(
                    iconBuilder: (color) => Image.asset(
                      iconScannerBottombar,
                      fit: BoxFit.cover,
                      color: state.slectedtabIndex == 2 ? neonShade : color,
                      height: state.slectedtabIndex == 2 ? 26 : 20,
                      width: state.slectedtabIndex == 2 ? 26 : 20,
                    ),
                  ),
                  BottomBarItem(
                    iconBuilder: (color) => Image.asset(
                      iconAccountBottomBar,
                      fit: BoxFit.cover,
                      color: state.slectedtabIndex == 3 ? neonShade : color,
                      height: state.slectedtabIndex == 3 ? 32.w : 26.w,
                      width: state.slectedtabIndex == 3 ? 32.w : 26.w,
                    ),
                  ),
                ],
                onSelect: (index) {
                  _onItemTapped(index);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
