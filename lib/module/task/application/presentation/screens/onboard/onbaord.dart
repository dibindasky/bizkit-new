import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenTaskOnBoardingScreen extends StatefulWidget {
  const ScreenTaskOnBoardingScreen({super.key});

  @override
  State<ScreenTaskOnBoardingScreen> createState() => _ScreenTaskOnBoardingScreenState();
}

class _ScreenTaskOnBoardingScreenState extends State<ScreenTaskOnBoardingScreen> {
  late PageController _pageController;
  int selectedIndex = 0;
  final int totalPages = 3;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget buildIndicator(bool isActive) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: CircleAvatar(
        radius: 7,
        backgroundColor: neonShade,
        child: CircleAvatar(
          radius: 6,
          backgroundColor: isActive ? neonShade : kblack,
        ),
      ),
    );
  }

  Widget buildIndicators() {
    List<Widget> indicators = [];
    for (int i = 0; i < totalPages; i++) {
      indicators.add(buildIndicator(i == selectedIndex));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: indicators,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              onPageChanged: _onPageChanged,
              itemCount: totalPages,
              itemBuilder: (context, index) {
                return buildOnboardingScreen(
                  selectedIndex: selectedIndex,
                  totalPages: totalPages,
                  pageIndex: index,
                );
              },
            ),
            selectedIndex != 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: const Text(
                          'Go Back',
                          style: TextStyle(color: kwhite),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _pageController.jumpToPage(totalPages - 1);
                        },
                        child: const Text(
                          'Skip',
                          style: TextStyle(color: kwhite),
                        ),
                      ),
                    ],
                  )
                : kempty,
            Positioned(
              bottom: 160,
              left: 0,
              right: 0,
              child: Center(
                child: buildIndicators(),
              ),
            ),
            Positioned(
              bottom: 100,
              left: 0,
              right: 0,
              child: Center(
                child: EventButton(
                  wdth: 100,
                  borderRadius: 10,
                  text: 'Next',
                  onTap: () {
                    if (selectedIndex < totalPages - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Get.offAllNamed(Routes.taskHome);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOnboardingScreen({
    required int selectedIndex,
    required int totalPages,
    required int pageIndex,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final screenHeight = constraints.maxHeight;
        return SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: screenWidth,
                height: 350,
                child: Image.asset(
                  pageIndex == 0
                      ? taskOnbaordfirst
                      : pageIndex == 1
                          ? taskOnbaordSecond
                          : taskOnbaordThird,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
              adjustHieght(16),
              Text(
                selectedIndex == 0
                    ? 'Easy Time Management'
                    : selectedIndex == 1
                        ? 'Increase Work Effectiveness'
                        : 'Reminder Notification',
                style: textHeadStyle1.copyWith(fontSize: 24),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(selectedIndex == 0
                    ? 'With management based on priority and daily tasks, it will give you convenience in managing and determining the tasks that must be done first '
                    : selectedIndex == 1
                        ? 'Time management and the determination of more important tasks will give your job statistics better and always improve'
                        : 'The advantage of this application is that it also provides reminders for you so you dont forget to keep doing your assignments well and according to the time you have set'),
              ),
              adjustHieght(16)
            ],
          ),
        );
      },
    );
  }
}
