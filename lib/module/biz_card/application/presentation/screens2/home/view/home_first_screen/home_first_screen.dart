import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/reminder/reminder_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/home/view/home_first_screen/first_half_sction/home_first_app_bar.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/home/view/home_first_screen/first_half_sction/my_cards_and_add_card.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/home/view/home_first_screen/first_half_sction/my_connections_home_page.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/home/view/home_first_screen/second_half_section/home_screen_second_part.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/home/view/home_second_screen/home_second_screen.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// enum and notifier below are used to shift the screens in home page without shifting home bottom bar
enum HomeScreensList { first, second, third }

final GlobalKey globalKeyAddCard = GlobalKey();
final GlobalKey globalKeylevelSharingIcon = GlobalKey();
final GlobalKey globalKeynotificationIcon = GlobalKey();
final GlobalKey globalKeyaddConnections = GlobalKey();
final GlobalKey globalKeyViewAllConnections = GlobalKey();

ValueNotifier<HomeScreensList> showCardsNotifier =
    ValueNotifier(HomeScreensList.first);

class ScreenCardsHomeFirstAnimation extends StatefulWidget {
  const ScreenCardsHomeFirstAnimation({super.key});

  @override
  State<ScreenCardsHomeFirstAnimation> createState() =>
      _ScreenCardsHomeFirstAnimationState();
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

class _ScreenCardsHomeFirstAnimationState
    extends State<ScreenCardsHomeFirstAnimation> with TickerProviderStateMixin {
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation2;
  late Animation<Offset> _slideAnimation2Move;
  // bool isShowcaseSeen = false;
  // final homeScreenShowCase = 'isShowcaseSeen';
  @override
  void initState() {
    final reminderController = Get.find<ReminderController>();
    reminderController.fetchAllReminders();
    super.initState();
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
      end: const Offset(0, -1.1),
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
    final connectionsController = Get.find<ConnectionsController>();
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
                      child: ScreenCardSecondAnimation(
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
                                  child: RefreshIndicator(
                                    onRefresh: () async {
                                      Get.find<CardController>()
                                          .getAllcards(true);
                                      // connectionsController
                                      //     .fetchMyConnections(true);
                                      Get.find<ReminderController>()
                                          .fetchAllReminders();
                                    },
                                    child: ListView(
                                      children: [
                                        const HomeFirstAppBar(),
                                        adjustHieght(khieght * .02),
                                        const MyCardsAndAddCardSection(),
                                        adjustHieght(khieght * .03),
                                        const CardMyConnectionContainerHomePage()
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      // home screen second part Reminders section list view
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
    // );
  }
}
