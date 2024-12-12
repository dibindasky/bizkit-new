import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/notification/tab_notification/request_recieved.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/notification/tab_notification/request_sent.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class TaskTabNotification extends StatelessWidget {
  TaskTabNotification({super.key});
  final taskController = Get.find<CreateTaskController>();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      taskController.fetchSendRequests();
      taskController.fetchReceivedRequests();
    });
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).pop(context);
                      },
                      child: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 18.sp,
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                      ),
                    ),
                    adjustWidth(20.w),
                    Text(
                      'Requests',
                      style: Theme.of(context).textTheme.displayMedium,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: kneon,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(23),
                    ),
                  ),
                  child: TabBar(
                    dividerHeight: 0,
                    dividerColor: WidgetStateColor.transparent,
                    indicatorPadding: const EdgeInsets.all(3),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      color: kneon,
                      borderRadius: kBorderRadius20,
                    ),
                    labelStyle: Theme.of(context).textTheme.displaySmall,
                    labelColor: kwhite,
                    indicatorColor: knill,
                    tabs: const [
                      Tab(text: 'Requests Received'),
                      Tab(
                        text: 'Requests Sent',
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    const TabNotificationItemBuilder(),
                    RequestSentBuilder(),
                  ],
                ),
              ),
              adjustHieght(3.h)
            ],
          ),
        ),
      ),
    );
  }
}
