import 'package:bizkit/core/const.dart';
import 'package:bizkit/feature/home/view/home_second_screen/widgets/appbar_second_third.dart';
import 'package:bizkit/feature/home/view/home_second_screen/widgets/second_animation_list.dart';
import 'package:bizkit/feature/home/view/home_second_screen/widgets/pageview_animated_containers.dart';
import 'package:bizkit/feature/home/view/home_second_screen/widgets/tab_buttons_second_animation.dart';
import 'package:bizkit/feature/home/view/home_second_screen/widgets/test+list.dart';
import 'package:flutter/material.dart';

ValueNotifier<String> selectedTabNotifier = ValueNotifier(tabBarNames[1]);

class SecondAnimation extends StatelessWidget {
  const SecondAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    int count = 0;
    return Scaffold(
      appBar: homeAppbarSecondAndThird(),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const HomeScreenPageviewAnimatedContaner(),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(5),
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
                                  return TestSecondAnimationPageListView(
                                    doTransition: count > 1,
                                  );
                                }
                                return SecondAnimationPageListView(
                                  doTransition: count > 1,
                                );
                              })),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
