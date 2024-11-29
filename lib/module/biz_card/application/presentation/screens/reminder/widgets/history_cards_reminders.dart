import 'package:bizkit/module/biz_card/application/controller/reminder/reminder_controller.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HistoryCardsReminders extends StatelessWidget {
  const HistoryCardsReminders({
    super.key,
    required this.reminderController,
  });

  final ReminderController reminderController;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Obx(() {
        if (reminderController.reminderHistoryCardLoading.value) {
          return ShimmerLoader(
              itemCount: 5,
              height: 60.h,
              width: double.infinity,
              seprator: kHeight10);
        } else if (reminderController.historyCardReminders.isEmpty) {
          return Center(
            child: Text(
              'No history available',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          );
        } else {
          return ListView.builder(
            padding: const EdgeInsets.all(0),
            itemCount: reminderController.historyCardReminders.length,
            itemBuilder: (context, index) {
              final data = reminderController.historyCardReminders[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.w),
                child: Card(
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
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
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                        kHeight5,
                        Text(
                          'Scheduled to disscuss about ${data.meetingLabel?.toUpperCase() ?? ''} at ${data.venue?.toUpperCase() ?? ''} while ${data.occasion?.toUpperCase() ?? ''}. Disscuss about ${data.description ?? ''}',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(fontSize: 11),
                        ),
                        kHeight10
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
