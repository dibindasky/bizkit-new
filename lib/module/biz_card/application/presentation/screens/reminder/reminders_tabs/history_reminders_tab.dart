import 'package:animate_do/animate_do.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/reminder/reminder_controller.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/reminders_success_responce/reminder.dart';
import 'package:bizkit/module/module_manager/application/controller/internet_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class HistoryRemindersTab extends StatelessWidget {
  const HistoryRemindersTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final reminderController = Get.find<ReminderController>();
    final internetConnectinController =
        Get.find<InternetConnectionController>();
    return Obx(
      () {
        if (reminderController.historyReminderLoading.value) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: ShimmerLoader(
                itemCount: 6,
                height: 110.h,
                width: double.infinity,
                seprator: kHeight5),
          );
        } else if (!internetConnectinController.isConnectedToInternet.value &&
            reminderController.historyReminders.isEmpty) {
          return Center(
            child: SizedBox(
              width: 300.w,
              child: InternetConnectionLostWidget(
                onTap: () {
                  reminderController.fetchHistoryReminders();
                },
              ),
            ),
          );
        } else if (reminderController.historyReminders.isEmpty) {
          return Center(
            child: Text(
              'No  history reminders found',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          );
        } else {
          return RefreshIndicator(
            onRefresh: () async {
              reminderController.fetchHistoryReminders();
            },
            child: ListView.separated(
              controller: reminderController.historyReminderScrollControler,
              itemCount: reminderController.historyReminders.length + 2,
              separatorBuilder: (context, index) => SizedBox(height: 3.h),
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (index >= reminderController.historyReminders.length &&
                    reminderController.historyReminderLoadMoreLoading.value) {
                  return ShimmerLoaderTile(
                    height: 110.h,
                    width: double.infinity,
                  );
                } else if (index >=
                        reminderController.historyReminders.length &&
                    !reminderController.historyReminderLoadMoreLoading.value) {
                  return SizedBox(
                    height: 50.h,
                  );
                }

                final Reminder historyReminder =
                    reminderController.historyReminders[index];
                return FadeInLeft(
                  animate: true,
                  child: GestureDetector(
                    onTap: () {
                      reminderController.getCardRemiderHistory(
                          id: historyReminder.id ?? '');
                      GoRouter.of(context).pushNamed(Routes.reminderDetail,
                          extra: historyReminder);
                    },
                    child: Card(
                      // margin: index ==
                      //         reminderController.historyReminders.length - 1
                      //     ? EdgeInsets.only(bottom: 100.h)
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
                                      historyReminder.meetingLabel ??
                                          'meetingLabel',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                  ],
                                ),
                                CircleAvatar(
                                  radius: 20,
                                  child: historyReminder.profilePicture != null
                                      ? NetworkImageWithLoader(
                                          historyReminder.profilePicture ??
                                              userProfileDummy,
                                          radius: 50,
                                        )
                                      : Image.asset(userProfileDummy),
                                ),
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
                                DateTimeFormater.formatTimeAMPMDate(
                                    historyReminder.reminderDate ?? ''),
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(fontSize: 10),
                              ),
                            ),
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
