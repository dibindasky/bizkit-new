import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ParticipantsListBottomSheet extends StatelessWidget {
  const ParticipantsListBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();
    return Obx(
      () {
        if (taskController.isLoading.value) {
          return SizedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ShimmerLoader(
                height: 50.h,
                seprator: kHeight10,
                itemCount: 5,
                width: 300.w,
              ),
            ),
          );
        } else if (taskController.singleTask.value.assignedToDetails!.isEmpty) {
          return const Center(
            child: Text('No Paricipants'),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemCount:
                  taskController.singleTask.value.assignedToDetails?.length ??
                      0,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: const BoxDecoration(
                    color: smallBigGrey,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: klightDarkGrey,
                      child: Icon(
                        Icons.person,
                        color: neonShade,
                      ),
                    ),
                    title: Text(
                      taskController.singleTask.value.assignedToDetails?[index]
                              .name ??
                          'name',
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
