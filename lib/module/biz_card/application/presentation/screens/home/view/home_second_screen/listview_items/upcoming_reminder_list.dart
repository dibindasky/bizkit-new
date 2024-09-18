import 'package:bizkit/module/biz_card/application/controller/reminder/reminder_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/view/home_second_screen/listview_items/reminder_tile.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SecondAnimationPageListViewUpcomingReminders extends StatefulWidget {
  SecondAnimationPageListViewUpcomingReminders({
    this.doTransition = false,
    super.key,
  });
  final ScrollController scrollController = ScrollController();
  final bool doTransition;

  @override
  State<SecondAnimationPageListViewUpcomingReminders> createState() =>
      _SecondAnimationPageListViewUpcomingRemindersState();
}

class _SecondAnimationPageListViewUpcomingRemindersState
    extends State<SecondAnimationPageListViewUpcomingReminders>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  _scrollCallBack() {
    if (widget.scrollController.position.pixels ==
        widget.scrollController.position.maxScrollExtent) {
      // context
      //     .read<ReminderBloc>()
      //     .add(const ReminderEvent.getUpcomingRemindersEventPage());
    }
  }

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(() {
      widget.scrollController.animateTo(.1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastEaseInToSlowEaseOut);
      _scrollCallBack();
    });

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 1, end: 0).animate(_animationController);

    _animationController.forward().whenComplete(() {
      _animationController.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    final reminderController = Get.find<ReminderController>();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => reminderController.fetchHistoryReminders(),
    );
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Obx(
            () {
              if (reminderController.upcomingReminderLoading.value) {
                return ShimmerLoader(
                    seprator: kHeight10,
                    itemCount: 3,
                    height: 80.h,
                    width: double.infinity);
              }
              if (reminderController.upcomingReminders.isEmpty) {
                return const Center(child: Text('No upcoming Reminders'));
              }
              return ListView.separated(
                controller: widget.scrollController,
                separatorBuilder: (context, index) =>
                    adjustHieght(khieght * .02),
                itemCount: reminderController.upcomingReminders.length,
                // (state.upcomingRminderList?.length ?? 0) +
                //     (state.upcomingReminderLoading ? 1 : 0),
                itemBuilder: (context, index) {
                  if (widget.doTransition && index == 0) {
                    return Transform.translate(
                        offset: Offset(0, 100 * _animation.value),
                        child: ReminderTile(
                            reminder:
                                reminderController.upcomingReminders[index]));
                  } else if (widget.doTransition && index == 1) {
                    return Transform.translate(
                        offset: Offset(0, -100 * _animation.value),
                        child: ReminderTile(
                            reminder:
                                reminderController.upcomingReminders[index]));
                  }
                  return ReminderTile(
                      reminder: reminderController.upcomingReminders[index]);
                },
              );
            },
          );
        });
  }
}
