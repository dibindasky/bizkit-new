import 'dart:async';

import 'package:get/get.dart';

class AttendenceHomeConroller extends GetxController {
  var clockIn = true.obs;

  final List<String> notifications = [
    'You are late by 20:00 Mins already.',
    'Don\'t forget to check-in at 9:00 AM.',
    'Meeting with team at 11:00 AM.',
    'Submit your daily report by 5:00 PM.',
    'Lunch break is from 1:00 PM to 2:00 PM.',
    'Team building activity at 3:00 PM.',
    'Project deadline is tomorrow.',
    'Client call at 4:00 PM.',
    'Update your timesheet.',
    'Weekly review meeting on Friday.'
  ];

  var currentNotificationIndex = 0.obs;
  late Timer timer;
  var opacity = 1.0.obs;

  void clockinOrClockout() {
    clockIn.value = !clockIn.value;
  }

  @override
  void onInit() {
    super.onInit();
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      currentNotificationIndex.value =
          (currentNotificationIndex.value + 1) % notifications.length;
    });
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }
}
