import 'package:bizkit/application/business_logic/reminder/reminder_bloc.dart';
import 'package:bizkit/application/presentation/screens/home/view/home_second_screen/listview_items/reminder_tile.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/shimmier/shimmer.dart';
import 'package:bizkit/application/presentation/widgets/refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      context
          .read<ReminderBloc>()
          .add(const ReminderEvent.getUpcomingRemindersEventPage());
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
          return BlocBuilder<ReminderBloc, ReminderState>(
            builder: (context, state) {
              if (state.isLoading) {
                return ShimmerLoader(
                  itemCount: 10,
                  height: 100,
                  width: kwidth * 0.9,
                  seprator: const SizedBox(height: 10),
                );
              } else if (state.historyReminderList != null &&
                  state.historyReminderList!.isNotEmpty) {
                return ListView.separated(
                  controller: widget.scrollController,
                  separatorBuilder: (context, index) =>
                      adjustHieght(khieght * .02),
                  itemCount: (state.historyReminderList?.length ?? 0) +
                      (state.historyLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (state.historyLoading &&
                        index == state.historyReminderList!.length) {
                      return const LoadingAnimation();
                    }
                    if (widget.doTransition && index == 0) {
                      return Transform.translate(
                          offset: Offset(0, 100 * _animation.value),
                          child: ReminderTile(
                              reminder: state.historyReminderList![index]));
                    } else if (widget.doTransition && index == 1) {
                      return Transform.translate(
                          offset: Offset(0, -100 * _animation.value),
                          child: ReminderTile(
                              reminder: state.historyReminderList![index]));
                    }
                    return ReminderTile(
                        reminder: state.historyReminderList![index]);
                  },
                );
              } else {
                return RefreshIndicatorCustom(
                    image: emptyNodata2,
                    message: 'No History',
                    onRefresh: () {
                      context
                          .read<ReminderBloc>()
                          .add(const ReminderEvent.getHistoryRemindersEvent());
                    });
              }
            },
          );
        });
  }
}
