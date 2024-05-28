import 'package:bizkit/module/task/application/presentation/screens/home/notification/tab_notification/request_recieved.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/notification/tab_notification/request_sent.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskTabNotification extends StatelessWidget {
  const TaskTabNotification({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: const TabBarView(
          children: [
            TabNotificationItemBuilder(),
            RequestSentBuilder(),
          ],
        ),
      ),
    );
  }
}
