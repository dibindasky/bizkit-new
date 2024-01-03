import 'package:bizkit/feature/home/view/home_main_screen/widgets/home_screen_first_part.dart';
import 'package:bizkit/feature/home/view/home_main_screen/widgets/home_screen_second_part.dart';
import 'package:bizkit/feature/home/view/home_second_screen/second_screen_anime.dart';
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
    with SingleTickerProviderStateMixin {
  late AnimationController _homeFirstAnimationController;
  late Animation<Offset> _slideAnimation;

  //late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    _homeFirstAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    //This is for full screen fade effect
    // animation =
    //     Tween<double>(end: 1, begin: 0).animate(_homeFirstAnimationController);
    // _homeFirstAnimationController.forward();

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -1.1), // Move upwards by the height of the screen
    ).animate(
      CurvedAnimation(
        parent: _homeFirstAnimationController,
        curve: Curves.linear,
      ),
    );
  }

  // @override
  // void dispose() {
  //   _homeFirstAnimationController.dispose();
  //   super.dispose();
  // }

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
                        animationController: _homeFirstAnimationController,
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
                            return SlideTransition(
                              position: _slideAnimation,
                              child: const HomeScreenFirstPart(),
                            );
                          },
                        ),
                        Visibility(
                          visible: !_homeFirstAnimationController.isCompleted,
                          child: HomeScreenSecondPart(
                            animationController: _homeFirstAnimationController,
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
