import 'package:bizkit/module/module_manager/application/controller/internet_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/notification/send_and_received_req/widget/request_dicline_dailog.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/notification/send_and_received_req/widget/request_mark_dailog.dart';
import 'package:bizkit/utils/snackbar/flutter_toast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationRequestCard extends StatelessWidget {
  const NotificationRequestCard(
      {super.key,
      this.title,
      this.priorityLevel,
      this.deadline,
      this.taskId,
      this.acceptanceStatus,
      this.taskType,
      this.isAccepted,
      this.name,
      this.des});
  final String? title;
  final String? priorityLevel;
  final String? deadline;
  final String? isAccepted;
  final String? taskId;
  final String? acceptanceStatus;
  final String? taskType;
  final String? des;
  final String? name;

  @override
  Widget build(BuildContext context) {
    final internetConnectinController =
        Get.find<InternetConnectionController>();
    return GestureDetector(
      onTap: () {
        // log('Task id ------- >>> $taskId');
      },
      child: Card(
        elevation: 0,
        child: Container(
          padding: EdgeInsets.all(13.0.w),
          decoration: BoxDecoration(
            // color: klightDarkGrey,

            borderRadius: BorderRadius.circular(10.0.h),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? '',
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                    adjustHieght(4.h),
                    Text(
                      des ?? '',
                      maxLines: 3,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    adjustHieght(8.h),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          radius: 13.0.w,
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: CircleAvatar(
                              backgroundColor: kblack,
                              child: Text(
                                name!.substring(0, 2).toUpperCase(),
                                style: textThinerStyle1.copyWith(color: kwhite),
                              ),
                            ),
                          ),
                        ),
                        adjustWidth(8.w),
                        Expanded(
                          child: Text(
                            name ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                        ),
                        adjustWidth(16.w),
                        Icon(
                          Icons.calendar_today,
                          color: Theme.of(context).colorScheme.primary,
                          size: 12.0.w,
                        ),
                        adjustWidth(4.w),
                        Expanded(
                          child: Text(
                            deadline ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                radius: 17.w,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: IconButton(
                  icon: Icon(
                    Icons.check,
                    color: kblack,
                    size: 19.w,
                    weight: 800,
                  ),
                  color: neonShade,
                  onPressed: () {
                    if (internetConnectinController
                        .isConnectedToInternet.value) {
                      requestMarkingDailog(
                        context,
                        taskId: taskId,
                      );
                    } else {
                      showCustomToast(
                          message:
                              'You must be online to accept this task. Please check your internet connection.',
                          backgroundColor: kred);
                    }
                  },
                ),
              ),
              adjustWidth(10.w),
              CircleAvatar(
                radius: 17.w,
                backgroundColor: kred,
                child: IconButton(
                  icon: Icon(
                    Icons.cancel,
                    size: 19.w,
                    weight: 800,
                  ),
                  color: const Color.fromARGB(255, 255, 169, 169),
                  onPressed: () {
                    if (internetConnectinController
                        .isConnectedToInternet.value) {
                      requestDiclineShowDailog(
                        context,
                        taskId: taskId,
                        isAccepted: isAccepted,
                      );
                    } else {
                      showCustomToast(
                          message:
                              'You must be online to rejected this task. Please check your internet connection.',
                          backgroundColor: kred);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
