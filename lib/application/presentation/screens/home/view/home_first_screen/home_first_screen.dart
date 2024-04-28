import 'dart:developer';

import 'package:bizkit/application/business_logic/qr/qr_bloc.dart';
import 'package:bizkit/application/business_logic/reminder/reminder_bloc.dart';
import 'package:bizkit/application/presentation/screens/home/view/home_first_screen/widgets/home_first_app_bar.dart';
import 'package:bizkit/application/presentation/screens/connections/my_connections/my_connections_home_page.dart';
import 'package:bizkit/application/presentation/screens/home/view/home_first_screen/first_half_sction/mycards_and_add_card/my_cards_and_add_card.dart';
import 'package:bizkit/application/presentation/screens/home/view/home_first_screen/second_half_section/home_screen_second_part.dart';
import 'package:bizkit/application/presentation/screens/home/view/home_second_screen/home_second_screen.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';

// enum and notifier below are used to shift the screens in home page without shifting home bottom bar
enum HomeScreensList {
  first,
  second,
  third,
}

final GlobalKey globalKeyAddCard = GlobalKey();
final GlobalKey globalKeylevelSharingIcon = GlobalKey();
final GlobalKey globalKeynotificationIcon = GlobalKey();
final GlobalKey globalKeyaddConnections = GlobalKey();

ValueNotifier<HomeScreensList> showCardsNotifier =
    ValueNotifier(HomeScreensList.first);

class HomeScreenFirstAnimationScreen extends StatefulWidget {
  const HomeScreenFirstAnimationScreen({super.key});

  @override
  State<HomeScreenFirstAnimationScreen> createState() =>
      _HomeScreenFirstAnimationScreenState();
}

showFirstScreen() {
  homeFirstAnimationController.reverse();
  homeSecondAnimationController2
      .reverse()
      .whenComplete(() => homeSecondAnimationController.reverse());
  showCardsNotifier.value = HomeScreensList.first;
  showCardsNotifier.notifyListeners();
}

// for fade trancition and slide trancition of home screen first part
late AnimationController homeFirstAnimationController;
// for list animation in home screen first part sliding part
late AnimationController homeSecondAnimationController;
late AnimationController homeSecondAnimationController2;

class _HomeScreenFirstAnimationScreenState
    extends State<HomeScreenFirstAnimationScreen>
    with TickerProviderStateMixin {
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation2;
  late Animation<Offset> _slideAnimation2Move;
  bool isShowcaseSeen = false;
  final homeScreenShowCase = 'isShowcaseSeen';
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      SharedPreferences.getInstance().then((prefs) {
        setState(() {
          log('$isShowcaseSeen');
          isShowcaseSeen = prefs.getBool(homeScreenShowCase) ?? false;
        });
        if (!isShowcaseSeen) {
          ShowCaseWidget.of(context).startShowCase([
            globalKeynotificationIcon,
            globalKeylevelSharingIcon,
            globalKeyAddCard,
            globalKeyaddConnections,
          ]);
          prefs.setBool(homeScreenShowCase, true);
        }
      });
    });

    homeFirstAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    homeSecondAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    homeSecondAnimationController2 = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 1),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -1.1), // Move upwards by the height of the screen
    ).animate(
      CurvedAnimation(
        parent: homeFirstAnimationController,
        curve: Curves.linear,
      ),
    );

    _slideAnimation2 = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -0.22),
    ).animate(
      CurvedAnimation(
        parent: homeSecondAnimationController,
        curve: Curves.linear,
      ),
    );

    _slideAnimation2Move = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, 1.5),
    ).animate(
      CurvedAnimation(
        parent: homeSecondAnimationController2,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );

    _fadeAnimation =
        Tween<double>(begin: 1, end: 0).animate(homeFirstAnimationController);
  }

  @override
  void dispose() {
    homeFirstAnimationController.dispose();
    homeSecondAnimationController.dispose();
    homeSecondAnimationController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<ReminderBloc>()
          .add(const ReminderEvent.getAllRemindersEvent());
      context.read<QrBloc>().add(const QrEvent.getQrCodes());
    });
    final size = MediaQuery.of(context).size;
    khieght = size.height;
    kwidth = size.width;
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: showCardsNotifier,
          builder: (context, value, child) {
            if (value == HomeScreensList.first ||
                value == HomeScreensList.second ||
                value == HomeScreensList.third) {
              return Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Visibility(
                      visible: homeFirstAnimationController.isCompleted,
                      child: SecondAnimation(
                        animationController: [
                          homeFirstAnimationController,
                          homeSecondAnimationController,
                          homeSecondAnimationController2
                        ],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedBuilder(
                        animation: homeFirstAnimationController,
                        builder: (context, child) {
                          return FadeTransition(
                            opacity: _fadeAnimation,
                            child: SlideTransition(
                              position: _slideAnimation,
                              child: SizedBox(
                                height: kwidth * 1.123,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const HomeFirstAppBar(),
                                      adjustHieght(khieght * .02),
                                      const MyCardsAndAddCardSection(),
                                      adjustHieght(khieght * .03),
                                      const MyConnectionContainerHomePage(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Expanded(
                        child: AnimatedBuilder(
                          animation: Listenable.merge([
                            homeSecondAnimationController,
                            homeSecondAnimationController2
                          ]),
                          builder: (context, child) {
                            return SlideTransition(
                              position: _slideAnimation2Move,
                              child: SlideTransition(
                                position: _slideAnimation2,
                                child: HomeScreenSecondPart(
                                  animationController: [
                                    homeFirstAnimationController,
                                    homeSecondAnimationController,
                                    homeSecondAnimationController2
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
