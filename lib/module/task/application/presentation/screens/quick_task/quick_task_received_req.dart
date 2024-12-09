import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/domain/model/quick_task/quick_task_accept_or_reject/quick_task_accept_or_reject.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:bizkit/utils/show_dialogue/dailog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class QuickTaskReceivedReqScreen extends StatelessWidget {
  const QuickTaskReceivedReqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
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
                adjustWidth(20.w),
                Text(
                  'Received Requests',
                  style: Theme.of(context).textTheme.displayMedium,
                )
              ],
            ),
            adjustHieght(30.h),
            Expanded(
              child: Obx(
                () {
                  if (taskController.loadingForQuickTaskReceivedReq.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (taskController.receivedQuickTasksReqs.isEmpty) {
                    return ErrorRefreshIndicator(
                      image: emptyNodata2,
                      errorMessage: 'No Recieved Requests',
                      onRefresh: () {
                        taskController.fetchQuickTaskRequests();
                      },
                    );
                  } else {
                    return RefreshIndicator(
                      onRefresh: () async {
                        taskController.fetchQuickTaskRequests();
                      },
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 3,
                        ),
                        itemCount: taskController.receivedQuickTasksReqs.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Card(
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            taskController
                                                    .receivedQuickTasksReqs[
                                                        index]
                                                    .title ??
                                                '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          adjustHieght(4.h),
                                          Text(
                                            taskController
                                                    .receivedQuickTasksReqs[
                                                        index]
                                                    .description ??
                                                '',
                                            maxLines: 3,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall
                                                ?.copyWith(
                                                    fontSize: 11,
                                                    color: kGreyNormal),
                                          ),
                                          adjustHieght(8.h),
                                          Row(
                                            children: [
                                              if (taskController
                                                      .receivedQuickTasksReqs[
                                                          index]
                                                      .createdBy
                                                      ?.profilePicture !=
                                                  null)
                                                CircleAvatar(
                                                  backgroundColor:
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                  radius: 13.0.w,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            1.0),
                                                    child: CircleAvatar(
                                                      backgroundColor: kblack,
                                                      child:
                                                          NetworkImageWithLoader(
                                                        taskController
                                                                .receivedQuickTasksReqs[
                                                                    index]
                                                                .createdBy
                                                                ?.profilePicture ??
                                                            '',
                                                        radius: 50,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              else
                                                CircleAvatar(
                                                  backgroundColor:
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                  radius: 13.0.w,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            1.0),
                                                    child: CircleAvatar(
                                                      backgroundColor: kblack,
                                                      child: Text(
                                                        taskController
                                                                .receivedQuickTasksReqs[
                                                                    index]
                                                                .createdBy
                                                                ?.name
                                                                ?.substring(
                                                                    0, 2)
                                                                .toUpperCase() ??
                                                            '',
                                                        style: textThinerStyle1
                                                            .copyWith(
                                                                color: kwhite),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              adjustWidth(8.w),
                                              Text(
                                                  taskController
                                                          .receivedQuickTasksReqs[
                                                              index]
                                                          .createdBy
                                                          ?.name ??
                                                      '',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displaySmall),
                                              adjustWidth(16.w),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    CircleAvatar(
                                      radius: 17.w,
                                      backgroundColor:
                                          Theme.of(context).colorScheme.primary,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.check,
                                          color: kblack,
                                          size: 19.w,
                                          weight: 800,
                                        ),
                                        color: neonShade,
                                        onPressed: () {
                                          showConfirmationDialog(
                                            context,
                                            heading:
                                                'Do you want to accept this task?',
                                            actionButton: 'Accept',
                                            onPressed: () {
                                              taskController.acceptQuickTaskRequest(
                                                  acceptOrRejct:
                                                      QuickTaskAcceptOrReject(
                                                          quickTaskId:
                                                              taskController
                                                                      .receivedQuickTasksReqs[
                                                                          index]
                                                                      .id ??
                                                                  '',
                                                          status: 'accepted'),
                                                  context: context);
                                              Navigator.pop(context);
                                            },
                                          );
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
                                        color: const Color.fromARGB(
                                            255, 255, 169, 169),
                                        onPressed: () {
                                          showConfirmationDialog(
                                            context,
                                            heading:
                                                'Are you sure do you want to decline this task',
                                            actionButton: 'Reject',
                                            onPressed: () {
                                              taskController.rejectQuickTaskRequest(
                                                  acceptOrRejct:
                                                      QuickTaskAcceptOrReject(
                                                          quickTaskId:
                                                              taskController
                                                                      .receivedQuickTasksReqs[
                                                                          index]
                                                                      .id ??
                                                                  '',
                                                          status: 'rejected'),
                                                  context: context);
                                              Navigator.pop(context);
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                        },
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
