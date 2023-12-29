import 'package:bizkit/core/const.dart';
import 'package:bizkit/feature/home/view/home_main_screen/home_screen_main.dart';
import 'package:bizkit/feature/home/view/home_second_screen/widgets/archieved_tiles.dart';
import 'package:bizkit/feature/home/view/home_second_screen/widgets/pageview_animated_containers.dart';
import 'package:bizkit/feature/home/view/home_second_screen/widgets/reminder_screen.dart';
import 'package:bizkit/feature/home/view/home_second_screen/widgets/upcoming_tiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      appBar: AppBar(
        leadingWidth: kwidth *0.25,
        leading: Row(
          children: [
            SizedBox(width: kwidth * 0.05),
            Text(
              'Todays\nReminders',
              style: TextStyle(fontFamily: 'Euclid', fontWeight: FontWeight.w700,fontSize: 17.sp),
            ),
          ],
        ),actions: [],
      ),
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
