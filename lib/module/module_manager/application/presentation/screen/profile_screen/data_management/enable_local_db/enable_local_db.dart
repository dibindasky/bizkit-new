import 'package:bizkit/module/biz_card/application/presentation/screens/card_and_connection_tab.dart/widgets/connection_accept_dialog.dart';
import 'package:bizkit/module/module_manager/application/controller/profile_controller/profile_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class EnableLocalDbScreen extends StatelessWidget {
  const EnableLocalDbScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = Get.find<ProfileController>();
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(7.0),
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context).pop(context);
            },
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 18.sp,
                color: Theme.of(context).colorScheme.onTertiary,
              ),
            ),
          ),
        ),
        backgroundColor: knill,
        title: Text(
          'Enable Local Save Option',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SafeArea(
            child: Column(
          children: [
            Obx(() => Card(
                  elevation: 0,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
                    child: buildSwitch("Enable BizCard Storage",
                        profileController.isBizCardStorageEnabled.value,
                        (value) {
                      profileController.isBizCardStorageEnabled.value = value;
                      profileController.saveBizCardStoragePreference();
                    }),
                  ),
                )),
            adjustHieght(3.h),
            Obx(() => Card(
                  elevation: 0,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
                    child: buildSwitch("Enable Task Storage",
                        profileController.isTaskStorageEnabled.value, (value) {
                      profileController.isTaskStorageEnabled.value = value;
                      profileController.saveTaskStoragePreference();
                    }),
                  ),
                )),
          ],
        )),
      ),
    );
  }
}
