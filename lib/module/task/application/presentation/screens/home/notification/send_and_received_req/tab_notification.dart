import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/notification/send_and_received_req/request_recieved.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/notification/send_and_received_req/request_sent.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
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
            onPressed: () => Get.back(id: 1),
            icon: const Icon(Icons.arrow_back_ios_new, size: 17),
          ),
          bottom: TabBar(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            dividerHeight: 0,
            dividerColor: WidgetStateColor.transparent,
            indicator: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: kwhite,
            labelStyle: Theme.of(context).textTheme.displaySmall,
            indicatorColor: knill,
            tabs: const [
              Tab(text: 'Requests Received'),
              Tab(
                text: 'Requests Sent',
              ),
            ],
          ),
          title: Text(
            'Requests',
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(fontSize: 16),
          ),
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
