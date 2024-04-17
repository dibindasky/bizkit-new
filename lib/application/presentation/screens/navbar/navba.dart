import 'package:bizkit/application/business_logic/cubit/nav_cubit.dart';
import 'package:bizkit/application/business_logic/promt/promt_bloc.dart';
import 'package:bizkit/application/presentation/screens/navbar/widgets/prompt.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/screens/card_share/view/screen/card_screen_main.dart';
import 'package:bizkit/application/presentation/screens/home/view/home_first_screen/home_first_screen.dart';
import 'package:bizkit/application/presentation/screens/profile_screen/view/screen/profile_screen.dart';
import 'package:bizkit/application/presentation/screens/selfie_card/selfie_screen.dart';
import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BizkitBottomNavigationBar extends StatefulWidget {
  const BizkitBottomNavigationBar({super.key});

  @override
  State<BizkitBottomNavigationBar> createState() =>
      _BizkitBottomNavigationBarState();
}

class _BizkitBottomNavigationBarState extends State<BizkitBottomNavigationBar> {
  final List<Widget> _widgetOptions = [
    const HomeScreenFirstAnimationScreen(),
    const CardShareMainScreen(),
    const SelfieScreen(),
    const ProfileScreen()
  ];

  void _onItemTapped(int index) {
    context.read<NavCubit>().navbarChange(index: index);
    // setState(() {
    //   state.slectedtabIndex = index;
    // });
  }

  @override
  void initState() {
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
                        adjustHieght(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            adjustWidth(20),
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
            body: Stack(
              children: [
                _widgetOptions.elementAt(state.slectedtabIndex),
                PromptHomePage(showPrompt: state.slectedtabIndex == 0)
              ],
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
                  BottomBarItem(
                    iconBuilder: (color) => Image.asset(
                      'asset/images/NavPngs/—Pngtree—vector house icon_4013710.png',
                      fit: BoxFit.cover,
                      color: state.slectedtabIndex == 0 ? neonShade : color,
                      height: state.slectedtabIndex == 0 ? 38 : 30,
                      width: state.slectedtabIndex == 0 ? 38 : 30,
                    ),
                  ),
                  BottomBarItem(
                    iconBuilder: (color) => Image.asset(
                      'asset/images/NavPngs/my connection selected.png',
                      fit: BoxFit.cover,
                      color: state.slectedtabIndex == 1 ? neonShade : color,
                      height: state.slectedtabIndex == 1 ? 32 : 26,
                      width: state.slectedtabIndex == 1 ? 32 : 26,
                    ),
                  ),
                  BottomBarItem(
                    iconBuilder: (color) => Image.asset(
                      'asset/images/NavPngs/selfie selected.png',
                      fit: BoxFit.cover,
                      color: state.slectedtabIndex == 2 ? neonShade : color,
                      height: state.slectedtabIndex == 2 ? 27 : 22,
                      width: state.slectedtabIndex == 2 ? 27 : 22,
                    ),
                  ),
                  BottomBarItem(
                    iconBuilder: (color) => Image.asset(
                      'asset/images/NavPngs/account un selected.png',
                      fit: BoxFit.cover,
                      color: state.slectedtabIndex == 3 ? neonShade : color,
                      height: state.slectedtabIndex == 3 ? 30 : 26,
                      width: state.slectedtabIndex == 3 ? 30 : 26,
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
