import 'package:bizkit/application/presentation/home/view/home_main_screen/widgets/home_screen_first_part.dart';
import 'package:bizkit/application/presentation/home/view/home_main_screen/widgets/home_screen_second_part.dart';
import 'package:bizkit/application/presentation/home/view/home_second_screen/second_screen_anime.dart';
import 'package:flutter/material.dart';

// enum and notifier below are used to shift the screens in home page without shifting home bottom bar
enum HomeScreensList {
  first,
  second,
  third,
}

ValueNotifier<HomeScreensList> showCardsNotifier =
    ValueNotifier(HomeScreensList.first);

class SplitScreen extends StatefulWidget {
  const SplitScreen({super.key});

  @override
  State<SplitScreen> createState() => _SplitScreenState();
}

class _SplitScreenState extends State<SplitScreen>
    with TickerProviderStateMixin {
  late AnimationController _homeFirstAnimationController;
  late AnimationController _homeSecondAnimationController;
  late AnimationController _homeSecondAnimationController2;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation2;
  late Animation<Offset> _slideAnimation2Move;

  //late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    _homeFirstAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _homeSecondAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _homeSecondAnimationController2 = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 1),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -1.1), // Move upwards by the height of the screen
    ).animate(
      CurvedAnimation(
        parent: _homeFirstAnimationController,
        curve: Curves.linear,
      ),
    );

    _slideAnimation2 = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -0.22),
    ).animate(
      CurvedAnimation(
        parent: _homeSecondAnimationController,
        curve: Curves.linear,
      ),
    );

    _slideAnimation2Move = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, 1.5),
    ).animate(
      CurvedAnimation(
        parent: _homeSecondAnimationController2,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );

    //fade the first half while scroll
    _fadeAnimation =
        Tween<double>(begin: 1, end: 0).animate(_homeFirstAnimationController);
  }

  @override
  void dispose() {
    _homeFirstAnimationController.dispose();
    _homeSecondAnimationController.dispose();
    _homeSecondAnimationController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                      visible: _homeFirstAnimationController.isCompleted,
                      child: SecondAnimation(
                        animationController: [
                          _homeFirstAnimationController,
                          _homeSecondAnimationController,
                          _homeSecondAnimationController2
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedBuilder(
                          animation: _homeFirstAnimationController,
                          builder: (context, child) {
                            return FadeTransition(
                              opacity: _fadeAnimation,
                              child: SlideTransition(
                                position: _slideAnimation,
                                child: const HomeScreenFirstPart(),
                              ),
                            );
                          },
                        ),
                        Expanded(
                          child: AnimatedBuilder(
                            animation: Listenable.merge([
                              _homeSecondAnimationController,
                              _homeSecondAnimationController2
                            ]),
                            builder: (context, child) {
                              return SlideTransition(
                                position: _slideAnimation2Move,
                                child: SlideTransition(
                                  position: _slideAnimation2,
                                  child: HomeScreenSecondPart(
                                      animationController: [
                                        _homeFirstAnimationController,
                                        _homeSecondAnimationController,
                                        _homeSecondAnimationController2
                                      ]),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
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
