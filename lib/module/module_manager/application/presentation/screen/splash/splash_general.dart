import 'package:animate_do/animate_do.dart';
import 'package:bizkit/module/module_manager/application/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenGeneralSplash extends StatelessWidget {
  const ScreenGeneralSplash({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigateToSignInPage(context);
    });
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

  void _navigateToSignInPage(BuildContext context) async {
    Future.delayed(const Duration(milliseconds: 2000), () {
      // GoRouter.of(context).pushReplacementNamed(Routes.taskNavbar);
      Get.find<AuthenticationController>().checkLoginStatus(context);
    });
  }
}
