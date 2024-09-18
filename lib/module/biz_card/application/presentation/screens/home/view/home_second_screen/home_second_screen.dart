import 'package:bizkit/module/biz_card/application/controller/reminder/reminder_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/view/home_second_screen/listview_items/history_list_reminders.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/view/home_second_screen/listview_items/second_animation_all_reminders_list.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/view/home_second_screen/listview_items/upcoming_reminder_list.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/view/home_second_screen/meeting_detail_section/meeting_detail_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/view/home_second_screen/pageview_container_top/pageview_container.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/view/home_second_screen/widgets/tab_buttons_second_animation.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/widgets/appbar_second_third.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//used to shift the tab bar
ValueNotifier<String> selectedTabNotifier = ValueNotifier(tabBarNames[1]);

class ScreenCardSecondAnimation extends StatefulWidget {
  const ScreenCardSecondAnimation(
      {super.key, required this.animationController});

  final List<AnimationController> animationController;

  @override
  State<ScreenCardSecondAnimation> createState() =>
      _ScreenCardSecondAnimationState();
}

class _ScreenCardSecondAnimationState extends State<ScreenCardSecondAnimation>
    with TickerProviderStateMixin {
  late AnimationController _firstFadeController;
  late AnimationController _secondFadeController;
  late AnimationController _listSlideController;
  late Animation<double> _firstOpacityAnimation;
  late Animation<double> _secondOpacityAnimation;
  late Animation<Offset> _listSlideAnimation;
  bool _showFirstScreen = true;

  @override
  void initState() {
    super.initState();
    _firstFadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _secondFadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _listSlideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _firstOpacityAnimation =
        Tween<double>(begin: 0, end: 1).animate(_firstFadeController);
    _secondOpacityAnimation =
        Tween<double>(begin: 1, end: 0).animate(_secondFadeController);
    _listSlideAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, 1.1))
            .animate(
      CurvedAnimation(
        parent: _listSlideController,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    _firstFadeController.dispose();
    _secondFadeController.dispose();
    _listSlideController.dispose();
    super.dispose();
  }

  void _toggleScreen() {
    setState(() {
      _showFirstScreen = !_showFirstScreen;
    });

    if (_showFirstScreen) {
      _firstFadeController.reverse(); // Fade in
      _secondFadeController.reverse();
      _listSlideController.reverse();
    } else {
      _firstFadeController.forward(); // Fade out
      _secondFadeController.forward();
      _listSlideController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // context.read<ReminderBloc>().add(const GetTodaysRemindersEvent());
      // context
      //     .read<ReminderBloc>()
      //     .add(const ReminderEvent.getHistoryRemindersEvent());
      // context
      //     .read<ReminderBloc>()
      //     .add(const ReminderEvent.getUpcomingRemindersEvent());
    });
    int count = 0;
    List<Widget> stackChild = [
      // Align(
      //   alignment: Alignment.topLeft,
      //   child: FadeTransition(
      //     opacity: _firstOpacityAnimation,
      //     child: MeetingDetailScreen(fadeCallBack: _toggleScreen),
      //   ),
      // ),
      FadeTransition(
        opacity: _secondOpacityAnimation,
        child: Column(
          children: [
            CardTodaysRemiderBuilder(fadeCallBack: _toggleScreen),
            kHeight20,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SlideTransition(
                  position: _listSlideAnimation,
                  child: Column(
                    children: [
                      const TabButtonsSecondAnimation(),
                      adjustHieght(khieght * .02),
                      Expanded(
                        child: ValueListenableBuilder(
                          valueListenable: selectedTabNotifier,
                          builder: (context, value, _) {
                            count++;
                            value;
                            if (value == 'Reminders') {
                              return SecondAnimationPageListViewAllReminders(
                                  doTransition: count > 1);
                            } else if (value == 'Upcoming') {
                              return SecondAnimationPageListViewUpcomingReminders(
                                  doTransition: count > 1);
                            }
                            return SecondAnimationPageListViewHistoryReminders(
                                doTransition: count > 1);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ];
    // changing stack array order to show child in top
    if (!_showFirstScreen) {
      final temp = stackChild[0];
      stackChild[0] = stackChild[1];
      stackChild[1] = temp;
    }
    return Scaffold(
      appBar: homeAppbarSecondAndThird(
          animationController: widget.animationController),
      body: SafeArea(
        child: SizedBox(
          height: khieght,
          width: kwidth,
          child: Stack(
            children: stackChild,
          ),
        ),
      ),
    );
  }
}
