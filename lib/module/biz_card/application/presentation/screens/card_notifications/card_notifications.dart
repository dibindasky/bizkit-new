import 'dart:developer';

import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/widgets/popup_button.dart';
import 'package:flutter/material.dart';

class ScreenCardNotification extends StatefulWidget {
  const ScreenCardNotification({super.key});

  @override
  State<ScreenCardNotification> createState() => _ScreenCardNotificationState();
}

class _ScreenCardNotificationState extends State<ScreenCardNotification> {
  late ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        // context
        //     .read<NotificationBloc>()
        //     .add(const NotificationEvent.getNotificationEvent());
      } else if (scrollController.position.pixels ==
          scrollController.position.minScrollExtent) {
        // context
        //     .read<NotificationBloc>()
        //     .add(const NotificationEvent.getNotification(isLoad: false));
      }
    });
    // context
    //     .read<NotificationBloc>()
    //     .add(const NotificationEvent.getNotification(isLoad: false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //     icon: const Icon(
      //       Icons.arrow_back_ios,
      //       size: 18,
      //     ),
      //   ),
      //   backgroundColor: knill,
      //   title: const Text('Notifications'),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
               const PopupBackButton(),
                Text('Notifications',style:  Theme.of(context).textTheme.titleLarge),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: RefreshIndicator(
                  onRefresh: () async {
                    // log('scroll');
                    // context.read<NotificationBloc>().add(
                    //     const NotificationEvent.getNotification(isLoad: false));
                  },
                  child: ListView.separated(
                    controller: scrollController,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return adjustHieght(10);
                    },
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      // log('notification length ${!state.notificationLoading && state.notification!.length <= index}=>$index ${state.notification!.length}');
                      // final notification = state.notification![index];
              
                      // if (state.notificationLoading &&
                      //     index >= state.notification!.length - 1) {
                      //   return const LoadingAnimation();
                      // } else {
                      log('in normal return tile $index');
                      return GestureDetector(
                        onTap: () {
                          // if (notification.tag == 'Connection request') {
                          //   Navigator.push(
                          //     context,
                          //     cardFadePageRoute(
                          //         const ScreenConnectionRequests()),
                          //   );
                          // }
                          // if (notification.tag == 'Connection accepted') {
                          //   Navigator.push(
                          //     context,
                          //     cardFadePageRoute(
                          //         const MyConnectionsViewAllContacts()),
                          //   );
                          // }
                          // if (notification.tag == 'Company Request') {
                          //   Map<String, String> map =
                          //       notification.cardId != null
                          //           ? {
                          //               'myCard': 'true',
                          //               'cardId':
                          //                   notification.cardId!.toString(),
                          //             }
                          //           : <String, String>{};
                          //   GoRouter.of(context).pushNamed(
                          //       Routes.cardDetailView,
                          //       pathParameters: map);
                          // Navigator.push(
                          //   context,
                          //   fadePageRoute(const Tabs()),
                          // );
                          // }
                          // if (notification.tag == 'Request Diclined') {}
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: kwhite, borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              adjustHieght(20),
                              Row(
                                children: [
                                  const CircleAvatar(
                                    backgroundColor: kblue,
                                    radius: 8,
                                  ),
                                  adjustWidth(10),
                                  Expanded(
                                    child: Text(
                                      "notification.title",
                                      style: textStyle1.copyWith(
                                        color: kGreyNormal,
                                        fontSize: kwidth * .034,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const Text('25m ago',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: kGreyNormal,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12)),
                                ],
                              ),
                              adjustHieght(10),
                              Text(
                                "Jaisai has shared his bizcard with you",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              // adjustHieght(4),
                              Text(
                                "you have a new connection",
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(fontSize: 11),
                              ),
                              adjustHieght(12),
                              Text(
                                'click to get more information',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(color: kGreyNormal),
                              ),
                              adjustHieght(10),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
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
