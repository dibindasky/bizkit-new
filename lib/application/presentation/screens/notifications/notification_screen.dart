import 'dart:developer';
import 'package:bizkit/application/business_logic/notification/notification_bloc.dart';
import 'package:bizkit/application/presentation/routes/routes.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/shimmier/shimmer.dart';
import 'package:bizkit/application/presentation/widgets/refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({
    super.key,
    this.scrollController,
  });

  final ScrollController? scrollController;

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  _scrollCallBack() {
    if (widget.scrollController!.position.pixels ==
        widget.scrollController!.position.maxScrollExtent) {
      context
          .read<NotificationBloc>()
          .add(const NotificationEvent.getNotificationEvent());
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.scrollController != null) {
      widget.scrollController!.addListener(() {
        _scrollCallBack();
      });
    }
  }

  @override
  void dispose() {
    if (widget.scrollController != null) {
      widget.scrollController!.removeListener(_scrollCallBack);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => context
          .read<NotificationBloc>()
          .add(const NotificationEvent.getNotification()),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: knill,
        title: const Text('Notifications'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<NotificationBloc, NotificationState>(
                builder: (context, state) {
                  if (state.notificationLoading) {
                    return ShimmerLoader(
                      itemCount: 10,
                      height: 120,
                      width: kwidth * 0.9,
                      seprator: const SizedBox(height: 10),
                    );
                  } else if (state.notification == null) {
                    //return Center();
                    RefreshIndicatorCustom(
                      message: errorMessage,
                      onRefresh: () => context
                          .read<NotificationBloc>()
                          .add(const NotificationEvent.getNotificationEvent()),
                    );
                  } else if (state.notification!.isEmpty) {
                    return SizedBox(
                      height: khieght,
                      child: const Center(
                        child: Text("You don't have Notifications now"),
                      ),
                    );
                  }
                  return ListView.separated(
                    controller: widget.scrollController,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return adjustHieght(10);
                    },
                    itemCount:
                        //   state.notification!.length,
                        (state.notification?.length ?? 0) +
                            (state.notificationLoading ? 1 : 0),
                    itemBuilder: (context, index) {
                      // DateTime currentDateTime = DateTime.now();
                      // String dateTimeString = '2024-03-26T15:30:00';

                      log('Noti length ${state.notification!.length}');
                      final notification = state.notification![index];
                      // Split the time string to get hours, minutes, seconds, and microseconds
                      List<String> parts = notification.scheduledAt!.split(':');
                      int hours = int.parse(parts[0]);
                      int minutes = int.parse(parts[1]);
                      List<String> secondsAndMicroseconds = parts[2].split('.');
                      int seconds = int.parse(secondsAndMicroseconds[0]);
                      int microseconds = int.parse(secondsAndMicroseconds[1]
                          .padRight(6,
                              '0')); // Pad with zeroes if microseconds are missing
                      DateTime now = DateTime.now();
                      DateTime dateTime = DateTime(now.year, now.month, now.day,
                          hours, minutes, seconds, microseconds);
                      // final date =
                      //     calculateDaysBefore(dateTime, dateTimeString);

                      if (state.notificationLoading &&
                          index == state.notification!.length) {
                        return const LoadingAnimation();
                      }
                      return GestureDetector(
                        onTap: () {
                          GoRouter.of(context).pushNamed(Routes.cardView);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: kblack,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              adjustHieght(20),
                              Row(
                                children: [
                                  const CircleAvatar(
                                    backgroundColor: kred,
                                    radius: 8,
                                  ),
                                  adjustWidth(10),
                                  Text(
                                    notification.title!,
                                    style: textStyle1.copyWith(
                                        color: klightgrey,
                                        fontSize: kwidth * .034),
                                  ),
                                  const Spacer(),
                                  Text(
                                    notification.scheduledAt!.substring(0, 6),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              Text(
                                notification.body!,
                                style: textHeadStyle1.copyWith(
                                    fontSize: kwidth * .040),
                              ),
                              adjustHieght(4),
                              Text(
                                notification.tag!,
                                style: textStyle1.copyWith(color: klightgrey),
                              ),
                              adjustHieght(8),
                              Text(
                                'click to get more information',
                                style: textStyle1.copyWith(color: klightgrey),
                              ),
                              adjustHieght(10),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

int calculateDaysBefore(DateTime currentDateTime, String notificationDate) {
  // Calculate the difference in days
  DateTime time = DateTime.parse(notificationDate);
  Duration difference = time.difference(time);
  return difference.inDays;
}
