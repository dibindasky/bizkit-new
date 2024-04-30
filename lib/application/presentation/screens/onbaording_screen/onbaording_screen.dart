import 'package:bizkit/application/business_logic/auth/login/auth_bloc.dart';
import 'package:bizkit/application/business_logic/cubit/nav_cubit.dart';
import 'package:bizkit/application/presentation/routes/routes.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BizkitOnBoardingScreen extends StatefulWidget {
  const BizkitOnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<BizkitOnBoardingScreen> createState() => _BizkitOnBoardingScreenState();
}

class _BizkitOnBoardingScreenState extends State<BizkitOnBoardingScreen> {
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
    context.read<NavCubit>().onBoardChange(index: index);
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
              AuthButton(
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
                        'Go back',
                        style: TextStyle(color: kwhite),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        GoRouter.of(context)
                            .pushReplacementNamed(Routes.loginPage);
                        context
                            .read<AuthBloc>()
                            .add(const AuthEvent.onBoardskip());
                      },
                      child: const Text(
                        'skip',
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
              AuthButton(
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
                        'Go back',
                        style: TextStyle(color: kwhite),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        GoRouter.of(context)
                            .pushReplacementNamed(Routes.loginPage);
                        context
                            .read<AuthBloc>()
                            .add(const AuthEvent.onBoardskip());
                      },
                      child: const Text(
                        'skip',
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
              AuthButton(
                wdth: 330,
                borderRadius: 25,
                text: 'Continue',
                onTap: () {
                  GoRouter.of(context).pushReplacementNamed(Routes.loginPage);
                  context.read<AuthBloc>().add(const AuthEvent.onBoardskip());
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
