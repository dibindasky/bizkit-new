import 'package:bizkit/module/biz_card/application/controller/reminder/reminder_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MeetingDetailHistoryLogTabBuilder extends StatelessWidget {
  const MeetingDetailHistoryLogTabBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ReminderController>();
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Obx(() {
        if (controller.reminderHistoryCardLoading.value) {
          return ShimmerLoader(
              itemCount: 5,
              height: 50.h,
              width: double.infinity,
              seprator: kHeight10);
        } else if (controller.historyCardReminders.isEmpty) {
          return const Center(
            child: Text('No history available'),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(0),
          itemCount: controller.historyCardReminders.length,
          itemBuilder: (context, index) {
            final data = controller.historyCardReminders[index];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.w),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: ColoredBox(
                  color: smallBigGrey,
                  child: Column(
                    children: [
                      kHeight5,
                      Row(
                        children: [
                          kWidth5,
                          Image.asset(imageHistoryList[index % 4],
                              fit: BoxFit.cover, height: 15.w),
                          kWidth5,
                          Text(
                              DateTimeFormater.formatDateToDDMMYYYY(
                                  data.reminderDate ?? ''),
                              style: textThinStyle1),
                        ],
                      ),
                      kHeight5,
                      Text(
                          'Scheduled to disscuss about ${data.meetingLabel} at ${data.venue ?? ''} while ${data.occasion}. Disscuss about ${data.description ?? ''}',
                          style: textThinStyle1),
                      kHeight10
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
