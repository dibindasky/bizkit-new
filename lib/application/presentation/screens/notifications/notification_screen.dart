import 'package:bizkit/application/business_logic/notification/notification_bloc.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/shimmier/shimmer.dart';
import 'package:bizkit/application/presentation/widgets/refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    context
        .read<NotificationBloc>()
        .add(const NotificationEvent.getNotification());
    if (widget.scrollController != null) {
      widget.scrollController!.addListener(() {
        widget.scrollController!.animateTo(.1,
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastEaseInToSlowEaseOut);
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
    // WidgetsBinding.instance.addPersistentFrameCallback(
    //   (timeStamp) {

    //   },
    // );
    return Scaffold(
      appBar: AppBar(
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
                    return RefreshIndicatorCustom(
                      message: errorMessage,
                      onRefresh: () => context
                          .read<NotificationBloc>()
                          .add(const NotificationEvent.getNotificationEvent()),
                    );
                  } else if (state.notification!.isEmpty) {
                    return SizedBox(
                      height: khieght,
                      child: const Center(
                        child: Text("You don't have Notification now"),
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
                    itemCount: (state.notification?.length ?? 0) +
                        (state.notificationLoading ? 1 : 0),
                    itemBuilder: (context, index) {
                      final notification = state.notification![index];
                      if (state.notificationLoading &&
                          index == state.notification!.length) {
                        return const LoadingAnimation();
                      }
                      return Container(
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
                                      fontSize: kwidth * .038),
                                ),
                                const Spacer(),
                                const Text('25 M ago'),
                              ],
                            ),
                            Text(
                              notification.body!,
                              style: textHeadStyle1.copyWith(
                                  fontSize: kwidth * .050),
                            ),
                            adjustHieght(4),
                            Text(
                              notification.tag!,
                              style: textStyle1.copyWith(color: klightgrey),
                            ),
                            adjustHieght(8),
                            Text(
                              'click to get more inforation',
                              style: textStyle1.copyWith(color: klightgrey),
                            ),
                            adjustHieght(10),
                          ],
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
