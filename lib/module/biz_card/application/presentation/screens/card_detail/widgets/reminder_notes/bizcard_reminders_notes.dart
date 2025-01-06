import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/reminder/reminder_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BizCardRminderNotes extends StatelessWidget {
  const BizCardRminderNotes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cardController = Get.find<CardController>();
    final reminderController = Get.find<ReminderController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Obx(
        () => cardController.isLoading.value ||
                reminderController.reminderHistoryCardLoading.value
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kHeight10,
                  Text('Reminders',
                      style: Theme.of(context).textTheme.titleSmall),
                  kHeight10,
                  ShimmerLoader(
                    itemCount: 6,
                    height: 40.h,
                    width: double.infinity,
                    seprator: kHeight10,
                  )
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kHeight10,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Reminders',
                        style: Theme.of(context).textTheme.titleSmall),
                  ),
                  adjustHieght(3.h),
                  if (reminderController.historyCardReminders.isEmpty)
                    Align(
                      alignment: Alignment.center,
                      child: Text('No reminders available yet!',
                          style: Theme.of(context).textTheme.displaySmall),
                    ),
                  ...List.generate(
                    reminderController.historyCardReminders.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Card(
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.1),
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    imageHistoryList[0],
                                    fit: BoxFit.cover,
                                  ),
                                  kWidth10,
                                  Text(
                                    DateTimeFormater.formatDateToDDMMYYYY(
                                        reminderController
                                                .historyCardReminders[index]
                                                .reminderDate ??
                                            ''
                                        // '0${index + 1}-0${index + 1}-2024'

                                        ),
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                  ),
                                ],
                              ),
                              adjustHieght(khieght * .006),
                              Text(
                                'Scheduled to disscuss about ${reminderController.historyCardReminders[index].meetingLabel?.toUpperCase() ?? ''} at ${reminderController.historyCardReminders[index].venue?.toUpperCase() ?? ''} while ${reminderController.historyCardReminders[index].occasion?.toUpperCase() ?? ''}. Disscuss about ${reminderController.historyCardReminders[index].description ?? ''}',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
