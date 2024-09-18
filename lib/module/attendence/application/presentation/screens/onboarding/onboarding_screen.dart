import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendenceOnboardingScreen extends StatefulWidget {
  const AttendenceOnboardingScreen({super.key});

  @override
  State<AttendenceOnboardingScreen> createState() =>
      _AttendenceOnboardingScreenState();
}

class _AttendenceOnboardingScreenState
    extends State<AttendenceOnboardingScreen> {
  late PageController _pageController;
  int selectedIndex = 0;
  final int totalPages = 2;

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
              bottom: 80,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: screenWidth,
                height: 250,
                child: Image.asset(
                  pageIndex == 0
                      ? attendenceOnboardingFirstImg
                      : attendenceOnboardingSecondImg,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
              adjustHieght(23),
              Text(
                selectedIndex == 0
                    ? 'Easy Attendance Management'
                    : 'All employee duty in one app',
                style: textHeadStyle1.copyWith(
                  color: neonShade,
                  fontSize: 19,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  selectedIndex == 0
                      ? 'Welcome to Bizkit App! elevate your attendance experience with ease and efficiency! begin your productive journey today !'
                      : 'Time management and the determination of more important tasks will give your job statistics better and always improve',
                  style: const TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
              adjustHieght(25)
            ],
          ),
        );
      },
    );
  }
}
