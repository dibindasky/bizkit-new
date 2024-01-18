import 'package:bizkit/application/commen/const.dart';
import 'package:bizkit/application/presentation/home/view/home_second_screen/widgets/appbar_second_third.dart';
import 'package:bizkit/application/presentation/home/view/home_second_screen/widgets/pageview_detail_screen.dart';
import 'package:bizkit/application/presentation/home/view/home_second_screen/widgets/second_animation_list.dart';
import 'package:bizkit/application/presentation/home/view/home_second_screen/widgets/pageview_animated_containers.dart';
import 'package:bizkit/application/presentation/home/view/home_second_screen/widgets/tab_buttons_second_animation.dart';
import 'package:bizkit/application/presentation/home/view/home_second_screen/widgets/test+list.dart';
import 'package:flutter/material.dart';

//used to shift the tab bar
ValueNotifier<String> selectedTabNotifier = ValueNotifier(tabBarNames[1]);

class SecondAnimation extends StatefulWidget {
  const SecondAnimation({super.key, required this.animationController});

  final List<AnimationController> animationController;

  @override
  State<SecondAnimation> createState() => _SecondAnimationState();
}

class _SecondAnimationState extends State<SecondAnimation>
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
        vsync: this, duration: const Duration(milliseconds: 500));

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
    int count = 0;
    List<Widget> stackChild = [
      Align(
        alignment: Alignment.topLeft,
        child: FadeTransition(
          opacity: _firstOpacityAnimation,
          child: SecondHomeScreenPAgeviewMeetingScreen(
            fadeCallBack: _toggleScreen,
          ),
        ),
      ),
      FadeTransition(
        opacity: _secondOpacityAnimation,
        child: Column(
          children: [
            HomeScreenPageviewAnimatedContaner(
              fadeCallBack: _toggleScreen,
            ),
            const SizedBox(
              height: 20,
            ),
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
                            // only SecondAnimationPageListView is needed TestSecondAnimationPageListView is for demo
                            if (value != 'Reminders') {
                              return TestSecondAnimationPageListView(
                                doTransition: count > 1,
                              );
                            }
                            return SecondAnimationPageListView(
                              doTransition: count > 1,
                            );
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
    if(!_showFirstScreen){
      final temp=stackChild[0];
      stackChild[0]=stackChild[1];
      stackChild[1]=temp;
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
