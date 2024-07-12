import 'package:bizkit/module/module_manager/application/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenTaskProfile extends StatelessWidget {
  const ScreenTaskProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
            onTap: () {
              Get.find<AuthenticationController>().logOut(context);
            },
            child: const Text('Profile task')),
      ),
    );
  }
}
