import 'package:animate_do/animate_do.dart';
import 'package:bizkit/fade_transition/fade_transition.dart';
import 'package:bizkit/feature/authentication/view/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => _navigateToSignInPage(context),
    );
    return Scaffold(
      body: FadeInUp(
        duration: const Duration(milliseconds: 800),
        delay: const Duration(milliseconds: 800),
        child: Center(
          child: Image.asset('asset/images/Bizkit.png'),
        ),
      ),
    );
  }

  void _navigateToSignInPage(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.pushReplacement(
        context,
        fadePageRoute(const LoGInScreen()),
      );
    });
  }
}
