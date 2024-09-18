import 'package:bizkit/module/biz_card/application/controller/reminder/reminder_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/view/home_second_screen/listview_items/reminder_tile.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SecondAnimationPageListViewAllReminders extends StatefulWidget {
  const SecondAnimationPageListViewAllReminders({
    this.scrollController,
    this.doTransition = false,
    super.key,
  });

  final ScrollController? scrollController;
  final bool doTransition;

  @override
  State<SecondAnimationPageListViewAllReminders> createState() =>
      _SecondAnimationPageListViewAllRemindersState();
}

class _SecondAnimationPageListViewAllRemindersState
    extends State<SecondAnimationPageListViewAllReminders>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  _scrollCallBack() {
    if (widget.scrollController!.position.pixels ==
        widget.scrollController!.position.maxScrollExtent) {
      // context
      //     .read<ReminderBloc>()
      //     .add(const ReminderEvent.getAllRemindersEventPage());
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.scrollController != null) {
      widget.scrollController!.addListener(() {
        widget.scrollController!.animateTo(.1,
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastEaseInToSlowEaseOut);
        _scrollCallBack();
      });
    }

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _animation = Tween<double>(begin: 1, end: 0).animate(_animationController);

    _animationController.forward().whenComplete(() {
      _animationController.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    final reminderController = Get.find<ReminderController>();

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Obx(
          () {
            if (reminderController.allReminderLoading.value) {
              return ShimmerLoader(
                  seprator: kHeight10,
                  height: 80.h,
                  width: double.infinity,
                  itemCount: 4);
            }
            if (reminderController.allReminders.isEmpty) {
              return const Center(child: Text('No reminders'));
            }
            return ListView.separated(
              controller: widget.scrollController,
              separatorBuilder: (context, index) => adjustHieght(khieght * .02),
              itemCount: reminderController.allReminders.length,
              //  (state.allReminderList?.length ?? 0) +
              //     (state.allReminderLoading ? 1 : 0),
              itemBuilder: (context, index) {
                // if (state.allReminderLoading &&
                //     index == state.allReminderList!.length) {
                //   return const LoadingAnimation();
                if (widget.doTransition && index == 0) {
                  return Transform.translate(
                      offset: Offset(0, 100 * _animation.value),
                      child: ReminderTile(
                          reminder: reminderController.allReminders[index]));
                } else if (widget.doTransition && index == 1) {
                  return Transform.translate(
                      offset: Offset(0, -100 * _animation.value),
                      child: ReminderTile(
                          reminder: reminderController.allReminders[index]));
                }
                return ReminderTile(
                    reminder: reminderController.allReminders[index]);
              },
            );
          },
        );
      },
    );
  }
}
