import 'package:bizkit/application/business_logic/auth/login/auth_bloc.dart';
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
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        onPageChanged: _onPageChanged,
        children: [
          buildOnboardingScreen(
            selectedIndex: selectedIndex,
            totalPages: totalPages,
          ),
          buildOnboardingScreen(
            selectedIndex: selectedIndex,
            totalPages: totalPages,
          ),
          buildOnboardingScreen(
            selectedIndex: selectedIndex,
            totalPages: totalPages,
          ),
        ],
      ),
    );
  }

  Widget buildOnboardingScreen({
    required int selectedIndex,
    required int totalPages,
  }) {
    return GestureDetector(
      onTap: () {
        if (selectedIndex < totalPages - 1) {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      },
      child: Column(
        children: [
          selectedIndex == 0
              ? Container(
                  width: kwidth,
                  height: khieght * .99,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(
                      onBoardScreenfirst,
                    ),
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  )),
                  // child: Image.asset(
                  //   onBoardScreenfirst,
                  //   fit: BoxFit.fill,
                  // ),
                )
              : selectedIndex == 1
                  ? SizedBox(
                      width: kwidth,
                      height: khieght * .99,
                      child: Image.asset(
                        filterQuality: FilterQuality.high,
                        onBoardScreenSecond,
                        fit: BoxFit.contain,
                      ),
                    )
                  : selectedIndex == 2
                      ? Stack(
                          children: [
                            SizedBox(
                              width: kwidth,
                              height: khieght * .99,
                              child: Image.asset(
                                onBoardScreenThird,
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 100,
                              right: 70,
                              left: 70,
                              child: AuthButton(
                                textColr: kblack,
                                onTap: () {
                                  GoRouter.of(context)
                                      .pushReplacementNamed(Routes.loginPage);
                                  context
                                      .read<AuthBloc>()
                                      .add(const AuthEvent.onBoardskip());
                                },
                                text: 'Get Started',
                              ),
                            ),
                          ],
                        )
                      : const SizedBox()
        ],
      ),
    );
  }
}
