import 'package:animate_do/animate_do.dart';
import 'package:bizkit/module/biz_card/application/controller/reminder/reminder_controller.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/reminders_success_responce/reminder.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HistoryRemindersTab extends StatelessWidget {
  const HistoryRemindersTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final reminderController = Get.find<ReminderController>();
    return Obx(
      () {
        if (reminderController.historyReminderLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (reminderController.historyReminders.isEmpty) {
          return Center(
            child: Text(
              'No  history reminders found',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          );
        } else {
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final Reminder historyReminder =
                  reminderController.historyReminders[index];
              return FadeInLeft(
                animate: true,
                child: Card(
                  margin: index == reminderController.historyReminders.length
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
                                  historyReminder.meetingLabel ??
                                      'meetingLabel',
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                              ],
                            ),
                            const CircleAvatar(
                              radius: 15,
                              backgroundImage: AssetImage(personDemoImg),
                            )
                          ],
                        ),
                        adjustHieght(10.h),
                        Text(
                          historyReminder.description ?? 'description',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(fontSize: 10, color: kGreyNormal),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            DateTimeFormater.getDDMMHHMMformat(
                                historyReminder.reminderDate ?? ''),
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
            itemCount: reminderController.historyReminders.length,
            separatorBuilder: (context, index) => SizedBox(height: 3.h),
          );
        }
      },
    );
  }
}
