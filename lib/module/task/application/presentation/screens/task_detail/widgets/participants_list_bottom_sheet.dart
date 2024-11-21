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
          return Center(
            child: Text(
              'No Paricipants',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemCount:
                  taskController.singleTask.value.assignedToDetails?.length ??
                      0,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 0,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: ListTile(
                      leading: const CircleAvatar(
                        child: Icon(
                          Icons.person,
                          color: kblack,
                        ),
                      ),
                      title: Text(
                        taskController.singleTask.value
                                .assignedToDetails?[index].name ??
                            'name',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(fontSize: 14),
                      ),
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
