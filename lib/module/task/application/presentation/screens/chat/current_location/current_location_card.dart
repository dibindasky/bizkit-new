import 'package:bizkit/module/task/application/controller/chat/chat_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/widgets/message_read_marker.dart';
import 'package:bizkit/module/task/domain/model/chat/current_location_message.dart';
import 'package:bizkit/utils/clipper/chat_pol_clipper.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CurrentLocationCard extends StatelessWidget {
  const CurrentLocationCard({super.key, required this.message});

  final CurrentLocationMessage message;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChatController>();
    final sender = message.sender;
    return Padding(
      padding: EdgeInsets.only(
          top: 5.0.w,
          bottom: 0.w,
          left: sender ? 50.w : 0.w,
          right: !sender ? 50.w : 0.w),
      child: ClipPath(
        clipper: PollChatClipper(isSender: sender),
        child: AnimatedContainer(
          padding: EdgeInsets.only(
              left: !sender ? 15.w : 5.w,
              right: sender ? 15.w : 5.w,
              top: 5.h,
              bottom: 0.h),
          decoration: BoxDecoration(
            color: sender ? neonShade.withGreen(190) : kwhite.withOpacity(0.3),
          ),
          duration: const Duration(milliseconds: 300),
          child: Column(
            crossAxisAlignment:
                sender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              sender
                  ? kempty
                  : Text(
                      message.username ?? '',
                      style: textThinStyle1.copyWith(
                          fontSize: 8.sp, color: kwhite.withOpacity(0.7)),
                    ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.h),
                decoration: BoxDecoration(
                    borderRadius: kBorderRadius5,
                    color: kwhite.withOpacity(0.3)),
                child: Text(message.place ?? ''),
              ),
              GestureDetector(
                  onTap: () {
                    controller.launchMapCurrentLocation(
                        context, message.location ?? [0.0, 0.0]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: CircleAvatar(
                        radius: 25.h,
                        backgroundImage: const AssetImage(mapMarker),
                      ),
                    ),
                  )),
              GestureDetector(
                onTap: () {
                  controller.launchMapCurrentLocation(
                      context, message.location ?? [0.0, 0.0]);
                },
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.h),
                  padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 3.h),
                  decoration: BoxDecoration(
                      borderRadius: kBorderRadius5,
                      color: kblack.withOpacity(0.3)),
                  child: const Center(child: Text('View Location')),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    DateTimeFormater.formatTimeAMPM(message.timestamp ?? ''),
                    style: textThinStyle1.copyWith(
                        color: sender ? kgrey : klightgrey, fontSize: 8.sp),
                  ),
                  sender ? kWidth10 : kempty,
                  sender
                      ? MessageReadMarker(read: message.readByAll ?? false)
                      : kempty
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}