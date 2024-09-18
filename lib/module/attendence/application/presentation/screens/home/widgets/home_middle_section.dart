import 'package:bizkit/module/attendence/application/presentation/screens/home/widgets/clocks_widget.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/home/widgets/three_cards.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../../../utils/constants/colors.dart';
import '../../../../controller/home/home_controller.dart';
import 'home_dialogs/break_dialog.dart';
import 'home_dialogs/clockout_success_dialog.dart';
import 'home_dialogs/location_dialog.dart';

class AttendenceHomeMiddleSection extends StatelessWidget {
  AttendenceHomeMiddleSection({super.key});
  final controller = Get.find<AttendenceHomeConroller>();

  @override
  Widget build(BuildContext context) {
    var time = DateFormat.jm().format(DateTime.now());
    var date = DateFormat('EEEE, d MMM').format(DateTime.now());
    return Obx(
      () {
        return Column(
          children: [
            adjustHieght(14.h),
            Center(
              child: Obx(
                () => Text(
                  controller
                      .notifications[controller.currentNotificationIndex.value],
                  key: ValueKey<int>(controller.currentNotificationIndex.value),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: neonShade,
                  ),
                ),
              ),
            ),
            adjustHieght(16.h),
            Center(
              child: Text(
                time,
                style: const TextStyle(fontSize: 40),
              ),
            ),
            Center(
              child: Text(
                date,
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w100,
                    color: klightgrey),
              ),
            ),
            adjustHieght(19.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AttendenceHSThreeCard(
                  width: 80,
                  height: 80,
                  imageUrl: attendenceBreakBtn,
                  onTap: () {
                    showBreakDialog(context: context);
                  },
                ),
                AttendenceHSThreeCard(
                  width: 130,
                  height: 130,
                  imageUrl: controller.clockIn.value
                      ? attendenceClockInBtn
                      : attendenceClockOutBtn,
                  onTap: () {
                    if (controller.clockIn.value) {
                      showTrunOnLocationDialog(context: context);
                    } else {
                      showClockOutSuccessDialog(
                        context: context,
                        attendenceHomeConroller: controller,
                      );
                    }
                  },
                ),
                AttendenceHSThreeCard(
                  width: 80,
                  height: 80,
                  imageUrl: attendenceLeaveBtn,
                  onTap: () {},
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  size: 21,
                ),
                Text(
                  'Zikrabyte Technologies',
                  style: TextStyle(fontWeight: FontWeight.w200, fontSize: 13),
                ),
              ],
            ),
            adjustHieght(19.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClocksContainerWidget(
                  attendenceHomeConroller: controller,
                  imageUrl: clockImg,
                  text1: controller.clockIn.value ? '00:00' : '09:20',
                  text2: 'Clock-In',
                  decoration: controller.clockIn.value ? true : false,
                ),
                ClocksContainerWidget(
                  attendenceHomeConroller: controller,
                  imageUrl: afternoonClockImg,
                  text1: controller.clockIn.value ? '00:00' : '18:00',
                  text2: 'Clock-Out',
                  decoration: controller.clockIn.value ? false : true,
                ),
                ClocksContainerWidget(
                  attendenceHomeConroller: controller,
                  imageUrl: countDownClockImg,
                  text1: controller.clockIn.value ? '00h 00m' : '09h 23m',
                  text2: 'Working Hrs',
                  decoration: controller.clockIn.value ? false : false,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
