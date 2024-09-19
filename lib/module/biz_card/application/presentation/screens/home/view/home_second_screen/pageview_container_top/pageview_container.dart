import 'package:bizkit/module/biz_card/application/controller/reminder/reminder_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/view/first_and_second_commen/pageview_animated_builder.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/view/home_first_screen/home_first_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/view/home_second_screen/pageview_container_top/page_view_contents.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CardTodaysRemiderBuilder extends StatefulWidget {
  const CardTodaysRemiderBuilder({super.key, required this.fadeCallBack});

  final VoidCallback fadeCallBack;

  @override
  State<CardTodaysRemiderBuilder> createState() =>
      _CardTodaysRemiderBuilderState();
}

class _CardTodaysRemiderBuilderState extends State<CardTodaysRemiderBuilder> {
  late PageController pageController;
  int currentIndex = 0;
  double pageValue = 0.0;

  @override
  void initState() {
    final reminderCOntroller = Get.find<ReminderController>();
    reminderCOntroller.fetchTodaysReminders();
    super.initState();
    pageController = PageController(
      viewportFraction: 0.8,
    )..addListener(() {
        setState(() {
          pageValue = pageController.page!;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    final reminderCOntroller = Get.find<ReminderController>();

    return Obx(
      () {
        if (reminderCOntroller.todaysReminderLoading.value) {
          return SizedBox(
            height: 220.h,
            child: ShimmerLoader(
              itemCount: 4,
              height: 220.h,
              width: double.infinity,
              scrollDirection: Axis.horizontal,
            ),
          );
        } else if (reminderCOntroller.todaysReminders.isEmpty) {
          return Center(
            child: ErrorRefreshIndicator(
                onRefresh: () => reminderCOntroller.fetchTodaysReminders()),
          );
        }
        return SizedBox(
          height: 230.h,
          child: HomeScreenPagviewAnimateBuilder(
            pageController: pageController,
            pageValue: pageValue,
            pageCount: reminderCOntroller.todaysReminders.length,
            onpageCallBack: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            child: (index, _) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    showCardsNotifier.value = HomeScreensList.third;
                    widget.fadeCallBack();
                  },
                  child: Container(
                    padding: EdgeInsets.only(bottom: 6.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: neonShade, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SecondScreenPageViewContents(
                        reminder: reminderCOntroller.todaysReminders[index]),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
