import 'package:bizkit/module/biz_card/application/controller/reminder/reminder_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TodaysRemindersSectionSliverHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  TodaysRemindersSectionSliverHeaderDelegate(
      this.pageController, this.onIndexChanged);
  final PageController pageController;

  final ValueChanged<int> onIndexChanged;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final reminderController = Get.find<ReminderController>();
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        return Obx(
          () {
            if (reminderController.todaysReminderLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else if (reminderController.todaysReminders.isEmpty) {
              return Column(
                children: [
                  Expanded(child: Image.asset(emptyNodata2)),
                  Text(
                    'No Reminders Found',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  adjustHieght(20.h),
                ],
              );
            } else {
              return PageView.builder(
                allowImplicitScrolling: true,
                controller: pageController,
                onPageChanged: (index) {
                  onIndexChanged(index);
                },
                itemCount: reminderController.todaysReminders.length,
                itemBuilder: (BuildContext context, int index) {
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

                  return Transform.scale(
                    scale: scale,
                    child: Opacity(
                      opacity: opacity,
                      child: Card(
                        child: Container(
                          height: 100.h,
                          padding: EdgeInsets.all(15.w),
                          decoration: BoxDecoration(
                            borderRadius: kBorderRadius15,
                            image: const DecorationImage(
                              image: AssetImage(bizcardBgImage),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Client Meeting',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                '1 week',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: kwhite,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                'Quarterly business review',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: kwhite,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        );
      },
    );
  }

  @override
  double get maxExtent => khieght * 0.2;

  @override
  double get minExtent => khieght * 0.2;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
