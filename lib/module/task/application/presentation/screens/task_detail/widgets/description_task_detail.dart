import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TaskDetailDescriptionSection extends StatelessWidget {
  const TaskDetailDescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();
    return Card(
      elevation: 0,
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontSize: 14),
            ),
            adjustHieght(5.h),
            Obx(
              () => taskController.isLoading.value
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ShimmerLoader(
                        itemCount: 1,
                        height: 20.h,
                        width: 200.w,
                      ),
                    )
                  : Text(
                      taskController.singleTask.value.description ??
                          'Description',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(color: kGreyNormal, fontSize: 11),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
