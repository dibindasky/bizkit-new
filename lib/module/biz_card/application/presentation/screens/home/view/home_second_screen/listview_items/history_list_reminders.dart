import 'package:bizkit/module/biz_card/application/controller/reminder/reminder_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/view/home_second_screen/listview_items/reminder_tile.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondAnimationPageListViewHistoryReminders extends StatefulWidget {
  SecondAnimationPageListViewHistoryReminders({
    this.doTransition = false,
    super.key,
  });
  final ScrollController scrollController = ScrollController();
  final bool doTransition;

  @override
  State<SecondAnimationPageListViewHistoryReminders> createState() =>
      _SecondAnimationPageListViewHistoryRemindersState();
}

class _SecondAnimationPageListViewHistoryRemindersState
    extends State<SecondAnimationPageListViewHistoryReminders>
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
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          final reminderController = Get.find<ReminderController>();
          return Obx(
            () => ListView.separated(
              controller: widget.scrollController,
              separatorBuilder: (context, index) => adjustHieght(khieght * .02),
              itemCount: reminderController.historyReminders.length,
              itemBuilder: (context, index) {
                if (widget.doTransition && index == 0) {
                  return Transform.translate(
                      offset: Offset(0, 100 * _animation.value),
                      child: ReminderTile(
                          reminder:
                              reminderController.historyReminders[index]));
                } else if (widget.doTransition && index == 1) {
                  return Transform.translate(
                      offset: Offset(0, -100 * _animation.value),
                      child: ReminderTile(
                          reminder:
                              reminderController.historyReminders[index]));
                }
                return ReminderTile(
                    reminder: reminderController.historyReminders[index]);
              },
            ),
          );
        });
  }
}
