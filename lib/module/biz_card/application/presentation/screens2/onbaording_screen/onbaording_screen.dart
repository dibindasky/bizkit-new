import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/navbar/navbar_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ScreenCardOnBoarding extends StatefulWidget {
  const ScreenCardOnBoarding({Key? key}) : super(key: key);

  @override
  State<ScreenCardOnBoarding> createState() => _ScreenCardOnBoardingState();
}

class _ScreenCardOnBoardingState extends State<ScreenCardOnBoarding> {
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
    Get.find<NavbarController>().slectedtabIndex.value = 0;
    //context.read<NavCubit>().onBoardChange(index: index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
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
    );
  }

  Widget buildOnboardingScreen({
    required int selectedIndex,
    required int totalPages,
    required int pageIndex,
  }) {
    return pageIndex == 0
        ? BizkitOnBoardingScreenFirst(
            pageController: _pageController,
          )
        : pageIndex == 1
            ? BizkitOnBoardingScreenSecond(
                pageController: _pageController,
              )
            : BizkitOnBoardingScreenThird(
                pageController: _pageController,
              );
  }
}

class BizkitOnBoardingScreenFirst extends StatelessWidget {
  const BizkitOnBoardingScreenFirst({
    super.key,
    required this.pageController,
  });
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final screenHeight = constraints.maxHeight;
        return SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Column(
            children: [
              adjustHieght(screenHeight * .18),
              Text(
                'Boost your business risk-free',
                style: textHeadStyle1.copyWith(fontSize: 24),
              ),
              adjustHieght(screenHeight * .05),
              SizedBox(
                width: kwidth,
                height: 350,
                child: Image.asset(
                  onBoardScreenfirstpersonImages,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
              const Spacer(),
              EventButton(
                wdth: 330,
                borderRadius: 25,
                text: 'Next',
                onTap: () {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              adjustHieght(screenHeight * .1),
            ],
          ),
        );
      },
    );
  }
}

class BizkitOnBoardingScreenSecond extends StatelessWidget {
  const BizkitOnBoardingScreenSecond({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final screenHeight = constraints.maxHeight;
        return SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Column(
            children: [
              adjustHieght(screenHeight * 0.025),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        pageController.previousPage(
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
                        GoRouter.of(context)
                            .pushReplacementNamed(Routes.loginPage);
                        // context
                        //     .read<AuthBloc>()
                        //     .add(const AuthEvent.onBoardskip());
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(color: kwhite),
                      ),
                    ),
                  ],
                ),
              ),
              adjustHieght(screenHeight * .1),
              Text(
                'Unlock Success With Bizkit',
                style: textHeadStyle1.copyWith(fontSize: 24),
              ),
              adjustHieght(screenHeight * .2),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: neonShade.withOpacity(0.9),
                      spreadRadius: 27,
                      blurRadius: 9,
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: kblack,
                  child: SizedBox(
                    height: 100,
                    child: Image.asset(
                      onBoardScreenSecond,
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              EventButton(
                wdth: 330,
                borderRadius: 25,
                text: 'Next',
                onTap: () {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              adjustHieght(screenHeight * .1),
            ],
          ),
        );
      },
    );
  }
}

class BizkitOnBoardingScreenThird extends StatelessWidget {
  const BizkitOnBoardingScreenThird({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final screenHeight = constraints.maxHeight;
        return SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Column(
            children: [
              adjustHieght(screenHeight * 0.025),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        pageController.previousPage(
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
                        GoRouter.of(context)
                            .pushReplacementNamed(Routes.loginPage);
                        // context
                        //     .read<AuthBloc>()
                        //     .add(const AuthEvent.onBoardskip());
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(color: kwhite),
                      ),
                    ),
                  ],
                ),
              ),
              adjustHieght(screenHeight * .1),
              Text(
                'Empowering Growth Together.',
                style: textHeadStyle1.copyWith(fontSize: 24),
              ),
              adjustHieght(screenHeight * .05),
              SizedBox(
                height: 350,
                child: Image.asset(
                  onBoardScreenThird,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
              const Spacer(),
              EventButton(
                wdth: 330,
                borderRadius: 25,
                text: 'Continue',
                onTap: () {
                  GoRouter.of(context).pushReplacementNamed(Routes.loginPage);
                  //context.read<AuthBloc>().add(const AuthEvent.onBoardskip());
                },
              ),
              adjustHieght(screenHeight * .1),
            ],
          ),
        );
      },
    );
  }
}
