import 'package:bizkit/module/module_manager/application/controller/auth_controller.dart';
import 'package:bizkit/module/task/application/controller/navbar/navbar_controller.dart';
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
              // LocalStoragePreference.setName('checkname');
              Get.find<AuthenticationController>().logOut(context);
              Get.find<TaskNavbarController>().taskBottomIndex.value = 1;
            },
            child: const Text('Profile task')),
      ),
    );
  }
}
