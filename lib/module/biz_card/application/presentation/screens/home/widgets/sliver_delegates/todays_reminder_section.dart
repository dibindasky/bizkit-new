import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/reminder/reminder_controller.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/reminders_success_responce/reminder.dart';
import 'package:bizkit/utils/animations/todays_reminders_page_builder.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class TodaysRemindersSectionSliverHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  TodaysRemindersSectionSliverHeaderDelegate(
      this.pagevalue, this.pageController, this.onIndexChanged);

  final PageController pageController;
  final ValueChanged<int> onIndexChanged;
  final double pagevalue;
  final reminderController = Get.find<ReminderController>();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        return Obx(() {
          if (reminderController.todaysReminderLoading.value) {
            return TodaysRemindersPagviewAnimateBuilder(
              pageController: pageController,
              pageValue: pagevalue,
              pageCount: reminderController.todaysReminders.length,
              onpageCallBack: onIndexChanged,
              child: (index, context) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                  child: ShimmerLoaderTile(
                    height: 120.h,
                    width: 280.w,
                  ),
                );
              },
            );
          } else {
            return TodaysRemindersPagviewAnimateBuilder(
              pageController: pageController,
              pageValue: pagevalue,
              pageCount: reminderController.todaysReminders.length,
              onpageCallBack: onIndexChanged,
              child: (index, context) {
                // Calculate the scale and opacity based on the page value
                double scale = 1.0;
                double opacity = 1.0;

                if (pageController.position.haveDimensions) {
                  // Ensure the page value is within the valid range
                  double currentPage = pageController.page ?? 0.0;

                  // Calculate scale with bounds
                  scale = 1 - (currentPage - index).abs() * 0.2;
                  scale = scale.clamp(0.8, 1.0);

                  // Calculate opacity with bounds
                  opacity = 1 - (currentPage - index).abs() * 0.5;
                  opacity = opacity.clamp(0.0, 1.0);
                }

                final Reminder todaysReminder =
                    reminderController.todaysReminders[index];

                return Transform.scale(
                  scale: scale,
                  child: Opacity(
                    opacity: opacity,
                    child: GestureDetector(
                      onTap: () {
                        reminderController.getCardRemiderHistory(
                            id: todaysReminder.id ?? '');
                        GoRouter.of(context).pushNamed(Routes.reminderDetail,
                            extra: todaysReminder);
                      },
                      child: Card(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: kBorderRadius15,
                            image: const DecorationImage(
                              image: AssetImage(bizcardBgImage),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  adjustWidth(35.w),
                                  CircleAvatar(
                                    child: todaysReminder.profilePicture == ''
                                        ? NetworkImageWithLoader(
                                            todaysReminder.profilePicture ??
                                                chatSectionPersonDummyImg2,
                                            radius: 50,
                                          )
                                        : Image.asset(
                                            chatSectionPersonDummyImg2),
                                  ),
                                  adjustWidth(15.w),
                                  Text(
                                    todaysReminder.meetingLabel ??
                                        'meetingLabel',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              adjustHieght(15.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Venue : ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(fontSize: 11),
                                  ),
                                  Text(
                                    todaysReminder.venue ?? 'Venue',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(fontSize: 11),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Created : ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(fontSize: 11),
                                  ),
                                  Text(
                                    DateTimeFormater.getDDMMHHMMformat(
                                        todaysReminder.reminderDate ??
                                            'reminderDate'),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(fontSize: 11),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Occasion : ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(fontSize: 11),
                                  ),
                                  Text(
                                    todaysReminder.occasion ?? 'occasion',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(fontSize: 11),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        });
      },
    );
  }

  @override
  double get maxExtent =>
      reminderController.todaysReminders.isEmpty ? 0 : khieght * 0.2;

  @override
  double get minExtent =>
      reminderController.todaysReminders.isEmpty ? 0 : khieght * 0.2;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
