import 'package:animate_do/animate_do.dart';
import 'package:bizkit/module/module_manager/application/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenAccountSwitchingLoader extends StatelessWidget {
  const ScreenAccountSwitchingLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthenticationController>();
    return Scaffold(
      body: Builder(builder: (context) {
        if (controller.doAccountSwitching.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return FadeInUp(
          duration: const Duration(milliseconds: 800),
          delay: const Duration(milliseconds: 800),
          child: Center(
            child: Image.asset('asset/images/Bizkit.png'),
          ),
        );
      }),
    );
  }
}
