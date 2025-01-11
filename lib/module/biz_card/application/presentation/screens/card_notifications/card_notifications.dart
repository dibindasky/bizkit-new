import 'package:bizkit/module/biz_card/application/controller/notifications/bizcard_notification_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

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
    final notificationController = Get.find<BizcardNotificationController>();
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(7.0),
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context).pop(context);
            },
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 18.sp,
                color: Theme.of(context).colorScheme.onTertiary,
              ),
            ),
          ),
        ),
        backgroundColor: knill,
        surfaceTintColor: knill,
        title: Text(
          'Notifications',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body: notificationController.bizcardNotifications.isEmpty
          ? Column(
              children: [
                SizedBox(child: Image.asset(emptyNodata2)),
                Text(
                  'No notifications available\n at the moment',
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.center,
                )
              ],
            )
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Obx(
                () {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          controller: scrollController,
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return adjustHieght(10);
                          },
                          itemCount: notificationController
                              .bizcardNotifications.length,
                          itemBuilder: (context, index) {
                            // log('notification length ${!state.notificationLoading && state.notification!.length <= index}=>$index ${state.notification!.length}');
                            // final notification = state.notification![index];

                            // if (state.notificationLoading &&
                            //     index >= state.notification!.length - 1) {
                            //   return const LoadingAnimation();
                            // } else {

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
                              child: Dismissible(
                                key: Key(notificationController
                                        .bizcardNotifications[index].id ??
                                    ''),
                                onDismissed: (direction) {
                                  notificationController.clearNotification([
                                    notificationController
                                            .bizcardNotifications[index].id ??
                                        ''
                                  ]);
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: kwhite,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                              notificationController
                                                      .bizcardNotifications[
                                                          index]
                                                      .title ??
                                                  "",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall
                                                  ?.copyWith(fontSize: 13),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          // Text(
                                          //   DateTimeFormater.formatTimeAMPM(
                                          //       notificationController
                                          //           .bizcardNotifications[index]
                                          //           .createdAt),
                                          //   style: Theme.of(context)
                                          //       .textTheme
                                          //       .displaySmall
                                          //       ?.copyWith(color: kGreyNormal),
                                          // ),
                                        ],
                                      ),
                                      adjustHieght(10),
                                      Text(
                                        notificationController
                                                .bizcardNotifications[index]
                                                .message ??
                                            "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall
                                            ?.copyWith(fontSize: 12),
                                      ),
                                      adjustHieght(7.h),
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
                              ),
                            );
                          },
                        ),
                      ),
                      adjustHieght(20.h),
                    ],
                  );
                },
              ),
            ),
      floatingActionButton:
          notificationController.bizcardNotifications.isNotEmpty
              ? FloatingActionButton(
                  backgroundColor: Get.isDarkMode ? kwhite : kblack,
                  child: Icon(Iconsax.close_square,
                      color: Get.isDarkMode ? kblack : kwhite),
                  onPressed: () {
                    final bizcardNotificationIds = notificationController
                        .bizcardNotifications
                        .map((notification) => notification.id)
                        .toList();

                    notificationController
                        .clearNotification(bizcardNotificationIds);
                    GoRouter.of(context).pop();
                  },
                )
              : null,
    );
  }
}

int calculateDaysBefore(DateTime currentDateTime, String notificationDate) {
  // Calculate the difference in days
  DateTime time = DateTime.parse(notificationDate);
  Duration difference = time.difference(time);
  return difference.inDays;
}
