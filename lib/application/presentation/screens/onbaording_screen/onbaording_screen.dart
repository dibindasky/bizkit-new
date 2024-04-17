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
    // setState(() {
    //   selectedIndex = index;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
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
    return GestureDetector(
      onTap: () {
        if (pageIndex < totalPages - 1) {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
        // else {
        //   GoRouter.of(context).pushReplacementNamed(Routes.loginPage);
        //   context.read<AuthBloc>().add(const AuthEvent.onBoardskip());
        // }
      },
      child: Column(
        children: [
          if (pageIndex != 2)
            SizedBox(
              width: kwidth,
              height: khieght,
              child: Image.asset(
                pageIndex == 0
                    ? onBoardScreenfirst
                    : pageIndex == 1
                        ? onBoardScreenSecond
                        : '',
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
              ),
            ),
          if (pageIndex == 2)
            Stack(
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
                  top: khieght * .34,
                  bottom: khieght * .6,
                  right: 100,
                  left: 100,
                  child: AuthButton(
                    textColr: kblack,
                    color: const LinearGradient(
                      colors: [
                        Color.fromRGBO(9, 29, 26, 1),
                        Color.fromRGBO(6, 199, 173, 1),
                        Color.fromRGBO(6, 199, 173, 1),
                        Color.fromRGBO(2, 41, 36, 1),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
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
            ),
        ],
      ),
    );
  }
}
