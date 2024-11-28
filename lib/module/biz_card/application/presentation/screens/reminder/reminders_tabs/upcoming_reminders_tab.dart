import 'package:animate_do/animate_do.dart';
import 'package:bizkit/module/biz_card/application/controller/reminder/reminder_controller.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/reminders_success_responce/reminder.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UpcomingRemindersTab extends StatelessWidget {
  const UpcomingRemindersTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final reminderController = Get.find<ReminderController>();
    return Obx(
      () {
        if (reminderController.upcomingReminderLoading.value) {
          return ShimmerLoader(
              itemCount: 6,
              height: 65.h,
              width: double.infinity,
              seprator: kHeight10);
        } else if (reminderController.upcomingReminders.isEmpty) {
          return Column(
            children: [
              Expanded(child: Image.asset(emptyNodata2)),
              Text(
                'No Reminders Found',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          );
        } else {
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final Reminder upcomingReminder =
                  reminderController.upcomingReminders[index];
              return FadeInRight(
                animate: true,
                child: Card(
                  margin: index == reminderController.upcomingReminders.length
                      ? const EdgeInsets.only(bottom: 150)
                      : null,
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Iconsax.calendar_tick),
                                adjustWidth(10.w),
                                Text(
                                  upcomingReminder.meetingLabel ??
                                      'meetingLabel',
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                              ],
                            ),
                            const CircleAvatar(
                              radius: 15,
                              backgroundImage:
                                  AssetImage(chatSectionPersonDummyImg1),
                            )
                          ],
                        ),
                        adjustHieght(10.h),
                        Text(
                          upcomingReminder.description ?? 'description',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(fontSize: 10, color: kGreyNormal),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            DateTimeFormater.getDDMMHHMMformat(
                                upcomingReminder.reminderDate ?? ''),
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(fontSize: 10),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: reminderController.upcomingReminders.length,
            separatorBuilder: (context, index) => SizedBox(
              height: 2.h,
            ),
          );
        }
      },
    );
  }
}
