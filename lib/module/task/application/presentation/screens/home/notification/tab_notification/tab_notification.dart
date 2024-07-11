import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/notification/tab_notification/request_recieved.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/notification/tab_notification/request_sent.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TaskTabNotification extends StatelessWidget {
  TaskTabNotification({super.key});
  final taskController = Get.find<CreateTaskController>();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      taskController.fetchSendRequests();
      taskController.fetchReceivedRequests();
    });
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: knill,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new, size: 17),
          ),
          bottom: TabBar(
            dividerColor: kblack,
            indicator: BoxDecoration(
              color: neonShade,
              borderRadius: BorderRadius.circular(10),
            ),
            unselectedLabelColor: kwhite,
            labelColor: kwhite,
            indicatorColor: knill,
            tabs: [
              SizedBox(
                width: kwidth * 0.5.w,
                child: const Tab(text: 'Requests Received'),
              ),
              SizedBox(
                width: kwidth * 0.5.w,
                child: const Tab(text: 'Requests Sent'),
              ),
            ],
          ),
          title: const Text('Requests'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.filter_alt,
                color: neonShade,
              ),
            ),
            adjustWidth(10)
          ],
        ),
        body: TabBarView(
          children: [
            const TabNotificationItemBuilder(),
            RequestSentBuilder(),
          ],
        ),
      ),
    );
  }
}
