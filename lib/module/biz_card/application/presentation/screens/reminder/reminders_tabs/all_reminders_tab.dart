import 'package:animate_do/animate_do.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/reminder/reminder_controller.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/reminders_success_responce/reminder.dart';
import 'package:bizkit/module/module_manager/application/controller/internet_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class AllRemindersTab extends StatelessWidget {
  const AllRemindersTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final reminderController = Get.find<ReminderController>();
    final internetConnectinController =
        Get.find<InternetConnectionController>();
    return Obx(
      () {
        if (reminderController.allReminderLoading.value) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: ShimmerLoader(
                itemCount: 6,
                height: 110.h,
                width: double.infinity,
                seprator: kHeight5),
          );
        } else if (!internetConnectinController.isConnectedToInternet.value &&
            reminderController.allReminders.isEmpty) {
          return Center(
            child: SizedBox(
              width: 300.w,
              child: InternetConnectionLostWidget(
                onTap: () {
                  reminderController.fetchAllReminders();
                },
              ),
            ),
          );
        } else if (reminderController.allReminders.isEmpty) {
          return Center(
            child: Text(
              'No all reminders found',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          );
        } else {
          return RefreshIndicator(
            onRefresh: () async {
              reminderController.fetchAllReminders();
            },
            child: ListView.separated(
              controller: reminderController.allReminderScrollControler,
              itemCount: reminderController.allReminders.length + 2,
              separatorBuilder: (context, index) => SizedBox(
                height: 2.h,
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (index >= reminderController.allReminders.length &&
                    reminderController.allReminderLoadMoreLoading.value) {
                  return ShimmerLoaderTile(
                    height: 110.h,
                    width: double.infinity,
                  );
                } else if (index >= reminderController.allReminders.length &&
                    !reminderController.allReminderLoadMoreLoading.value) {
                  return SizedBox(
                    height: 50.h,
                  );
                }

                final Reminder allReminder =
                    reminderController.allReminders[index];
                return FadeIn(
                  animate: true,
                  child: GestureDetector(
                    onTap: () {
                      reminderController.getCardRemiderHistory(
                          id: allReminder.id ?? '');
                      GoRouter.of(context)
                          .pushNamed(Routes.reminderDetail, extra: allReminder);
                    },
                    child: Card(
                      // margin: index == reminderController.allReminders.length
                      //     ? const EdgeInsets.only(bottom: 150)
                      //     : null,
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
                                      allReminder.meetingLabel ??
                                          'meetingLabel',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                  ],
                                ),
                                const CircleAvatar(
                                  radius: 15,
                                  backgroundImage:
                                      AssetImage(chatSectionPersonDummyImg2),
                                )
                              ],
                            ),
                            adjustHieght(10.h),
                            Text(
                              allReminder.description ?? 'description',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(fontSize: 10, color: kGreyNormal),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                DateTimeFormater.formatTimeAMPMDate(
                                    allReminder.reminderDate ?? ''),
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
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
