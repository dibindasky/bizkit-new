import 'package:animate_do/animate_do.dart';
import 'package:bizkit/module/biz_card/application/controller/reminder/reminder_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/widgets/scroll_to_top_button.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class RemindersTabsSectionSliverHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  RemindersTabsSectionSliverHeaderDelegate(
      this.tabController, this.scrollController);

  final TabController tabController;
  final ScrollController scrollController;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final reminderController = Get.find<ReminderController>();
    return Column(
      children: [
        adjustHieght(10.h),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: kneon,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(23),
              ),
            ),
            child: TabBar(
              indicatorPadding: const EdgeInsets.all(3),
              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.tab,
              controller: tabController,
              indicator: BoxDecoration(
                color: kneon,
                borderRadius: kBorderRadius20,
              ),
              labelStyle: textThinStyle1.copyWith(color: kwhite),
              labelColor: kwhite,
              tabs: [
                Tab(
                  child: Text(
                    'History',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
                Tab(
                  child: Text(
                    'All reminders',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
                Tab(
                  child: Text(
                    'Upcoming',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
            child: Stack(
          children: [
            TabBarView(
              controller: tabController,
              children: [
                ListView.separated(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => FadeInLeft(
                    animate: true,
                    child: Card(
                      margin: index == 10
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
                                      'History',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
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
                              "Your subscription payment is due tomorrow. Please ensure your payment method is up to date to avoid any interruption.",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(fontSize: 10, color: kGreyNormal),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  itemCount: 11,
                  separatorBuilder: (context, index) => SizedBox(height: 3.h),
                ),
                Obx(
                  () {
                    if (reminderController.allReminderLoading.value) {
                      return ShimmerLoader(
                          itemCount: 6,
                          height: 65.h,
                          width: double.infinity,
                          seprator: kHeight10);
                    } else if (reminderController.allReminders.isEmpty) {
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 10.h),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => FadeIn(
                          animate: true,
                          child: Card(
                            margin:
                                index == reminderController.allReminders.length
                                    ? const EdgeInsets.only(bottom: 150)
                                    : null,
                            elevation: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(Iconsax.calendar_tick),
                                          adjustWidth(10.w),
                                          Text(
                                            'All reminders',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall,
                                          ),
                                        ],
                                      ),
                                      const CircleAvatar(
                                        radius: 15,
                                        backgroundImage: AssetImage(
                                            chatSectionPersonDummyImg2),
                                      )
                                    ],
                                  ),
                                  adjustHieght(10.h),
                                  Text(
                                    "Your subscription payment is due tomorrow. Please ensure your payment method is up to date to avoid any interruption.",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall
                                        ?.copyWith(
                                            fontSize: 10, color: kGreyNormal),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        itemCount: reminderController.allReminders.length,
                        separatorBuilder: (context, index) => SizedBox(
                          height: 2.h,
                        ),
                      );
                    }
                  },
                ),
                ListView.separated(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => FadeInRight(
                    animate: true,
                    child: Card(
                      margin: index == 10
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
                                      'Upcoming',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
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
                              "Your subscription payment is due tomorrow. Please ensure your payment method is up to date to avoid any interruption.",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(fontSize: 10, color: kGreyNormal),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  itemCount: 11,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 2.h,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ScrollToTopButton(scrollController: scrollController),
                  kHeight40
                ],
              ),
            ),
          ],
        )),
      ],
    );
  }

  @override
  double get maxExtent => khieght;

  @override
  double get minExtent => khieght * 0.5;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
