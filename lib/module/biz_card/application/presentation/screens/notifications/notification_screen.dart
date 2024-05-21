import 'dart:developer';

import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/business_logic/notification/notification_bloc.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/connections/connection_request_sscreen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/connections/view_all_connection_contacts.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:bizkit/utils/shimmier/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      log('call');
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        context
            .read<NotificationBloc>()
            .add(const NotificationEvent.getNotificationEvent());
      }
    });
    context
        .read<NotificationBloc>()
        .add(const NotificationEvent.getNotification(isLoad: false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
          ),
        ),
        backgroundColor: knill,
        title: const Text('Notifications'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: RefreshIndicator(
          onRefresh: () async {
            log('scroll');
            context
                .read<NotificationBloc>()
                .add(const NotificationEvent.getNotification(isLoad: false));
          },
          child: ListView(
            controller: scrollController,
            children: [
              BlocBuilder<NotificationBloc, NotificationState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return ShimmerLoader(
                      itemCount: 6,
                      height: 120,
                      width: kwidth * 0.9,
                      seprator: const SizedBox(height: 10),
                    );
                  } else if (state.notification != null &&
                      state.notification!.isNotEmpty) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        log('scroll');
                        context.read<NotificationBloc>().add(
                            const NotificationEvent.getNotification(
                                isLoad: false));
                      },
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return adjustHieght(10);
                        },
                        itemCount: (state.notification?.length ?? 0) +
                            (state.notificationLoading ? 1 : 0) -
                            1,
                        itemBuilder: (context, index) {
                          final notification = state.notification![index];
                          if (state.notificationLoading &&
                              index == state.notification!.length - 1) {
                            return const LoadingAnimation();
                          }
                          return GestureDetector(
                            onTap: () {
                              if (notification.tag == 'Connection request') {
                                Navigator.push(
                                  context,
                                  fadePageRoute(
                                      const ScreenConnectionRequests()),
                                );
                              }
                              if (notification.tag == 'Connection accepted') {
                                Navigator.push(
                                  context,
                                  fadePageRoute(
                                      const MyConnectionsViewAllContacts()),
                                );
                              }
                              if (notification.tag == 'Company Request') {
                                Map<String, String> map =
                                    notification.cardId != null
                                        ? {
                                            'myCard': 'true',
                                            'cardId':
                                                notification.cardId!.toString(),
                                          }
                                        : <String, String>{};
                                GoRouter.of(context).pushNamed(
                                  Routes.cardDetailView,
                                  pathParameters: map,
                                );
                                // Navigator.push(
                                //   context,
                                //   fadePageRoute(const Tabs()),
                                // );
                              }
                              if (notification.tag == 'Request Diclined') {}
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
                                      Expanded(
                                        child: Text(
                                          notification.title!,
                                          style: textStyle1.copyWith(
                                            color: klightgrey,
                                            fontSize: kwidth * .034,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        notification.scheduledAt!
                                            .substring(0, 5),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  adjustHieght(10),
                                  Text(
                                    notification.body!,
                                    style: textHeadStyle1.copyWith(
                                        fontSize: kwidth * .040),
                                  ),
                                  adjustHieght(4),
                                  Text(
                                    notification.tag!,
                                    style:
                                        textStyle1.copyWith(color: klightgrey),
                                  ),
                                  adjustHieght(4),
                                  Text(
                                    'click to get more information',
                                    style:
                                        textStyle1.copyWith(color: klightgrey),
                                  ),
                                  adjustHieght(10),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return ErrorRefreshIndicator(
                      shrinkWrap: true,
                      image: emptyNodata2,
                      errorMessage: 'No Notifications found',
                      onRefresh: () {
                        context.read<NotificationBloc>().add(
                            const NotificationEvent.getNotification(
                                isLoad: false));
                      },
                    );
                  }
                },
              ),
              adjustHieght(20)
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
