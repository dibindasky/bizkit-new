import 'package:bizkit/core/const.dart';
import 'package:bizkit/feature/home/view/home_second_screen/widgets/archieved_tiles.dart';
import 'package:bizkit/feature/home/view/home_second_screen/widgets/pageview_animated_containers.dart';
import 'package:bizkit/feature/home/view/home_second_screen/widgets/reminder_screen.dart';
import 'package:bizkit/feature/home/view/home_second_screen/widgets/upcoming_tiles.dart';
import 'package:flutter/material.dart';

class SecondAnimation extends StatefulWidget {
  const SecondAnimation({super.key});

  @override
  State<SecondAnimation> createState() => _SecondAnimationState();
}

class _SecondAnimationState extends State<SecondAnimation>
    with TickerProviderStateMixin {
  List names = [
    'Archived',
    'Reminders',
    'Upcoming',
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              adjustHieght(khieght * .04),
              Column(
                children: [
                  SizedBox(
                    height: 260.5,
                    child: GestureDetector(
                      onVerticalDragStart: (details) async {
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pop();
                      },
                      child: const HomeScreenPageviewAnimatedContaner(),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          textChange(index: 0),
                          textChange(index: 1),
                          textChange(index: 2),
                        ],
                      ),
                      adjustHieght(khieght * .02),
                      Expanded(
                        child: Builder(
                          builder: (BuildContext context) {
                            if (selectedIndex == 0) {
                              return const ArchiedTilesHomeScreen();
                            } else if (selectedIndex == 1) {
                              return const RemindersTilesHomeScreen();
                            } else if (selectedIndex == 2) {
                              return const UpcomingTiles();
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),
                      ),
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

  Widget textChange({required int index}) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: () {
        setState(() {
          String temp = names[index];
          names[index] = names[1];
          names[1] = temp;
          selectedIndex = index;
        });
      },
      child: Text(
        names[index],
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}
