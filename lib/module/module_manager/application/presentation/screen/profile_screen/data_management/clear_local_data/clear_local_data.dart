import 'package:bizkit/module/module_manager/application/controller/profile_controller/profile_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import 'package:bizkit/utils/show_dialogue/dailog.dart';

class ClearAllLocalDataScreen extends StatelessWidget {
  const ClearAllLocalDataScreen({super.key});

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
          'Clear Local Storage Preferences',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SafeArea(
            child: Column(
          children: [
            Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Clear Bizcard Local Storage',
                          style: Theme.of(context).textTheme.displaySmall),
                      IconButton(
                          onPressed: () {
                            showConfirmationDialog(
                              actionButton: 'Yes',
                              heading:
                                  'Are you sure want to clear "Bizcard Module" all local data ?',
                              context,
                              onPressed: () {
                                profileController
                                    .deleteAllDataFromLocal(context);
                              },
                            );
                          },
                          icon: const Icon(Iconsax.trash))
                    ],
                  ),
                ),
              ),
            ),
            adjustHieght(3.h),
            Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Clear Task Local Storage',
                          style: Theme.of(context).textTheme.displaySmall),
                      IconButton(
                          onPressed: () {
                            showConfirmationDialog(
                              actionButton: 'Yes',
                              heading:
                                  'Are you sure want to clear "Task Module" all local data ?',
                              context,
                              onPressed: () {
                                profileController
                                    .deleteAllDataFromLocal(context);
                              },
                            );
                          },
                          icon: const Icon(Iconsax.trash))
                    ],
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
