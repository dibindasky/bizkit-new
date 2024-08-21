import 'package:bizkit/module/task/application/presentation/screens/chat/widgets/message_read_marker.dart';
import 'package:bizkit/module/task/domain/model/chat/time_expence_message.dart';
import 'package:bizkit/utils/clipper/chat_pol_clipper.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeAndExpenseCard extends StatelessWidget {
  const TimeAndExpenseCard({super.key, required this.message});

  final TimeExpense message;

  @override
  Widget build(BuildContext context) {
    final sender = message.sender ?? false;
    return Padding(
      padding: EdgeInsets.only(
          top: 5.0.w,
          bottom: 5.0.w,
          left: sender ? 50.w : 0.w,
          right: !sender ? 50.w : 0.w),
      child: ClipPath(
        clipper: PollChatClipper(isSender: sender),
        child: Container(
          padding: EdgeInsets.only(
              bottom: 10.w,
              top: 10.w,
              left: sender ? 10.w : 20.w,
              right: sender ? 20.w : 10.w),
          decoration: BoxDecoration(
            color: sender ? neonShade.withGreen(190) : kwhite.withOpacity(0.3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 5.w, top: 5.w, bottom: 5.w),
                decoration: BoxDecoration(
                    borderRadius: kBorderRadius10,
                    color: sender ? kneonShade.withOpacity(0.5) : kgrey),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Update on Expense / Time",
                      style: textThinStyle1.copyWith(
                        color: Colors.white,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    kHeight5,
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(
                                child: Text(
                                  "Money Spent on Task:",
                                  style: textThinStyle1,
                                ),
                              ),
                              Text(
                                "₹ ${(message.timeExpenseData?.expense) ?? 0}",
                                style: textThinStyle1.copyWith(fontSize: 15.sp),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: ColoredBox(
                              color: kwhite,
                              child: SizedBox(
                                height: 20.w,
                                width: 1.w,
                              )),
                        ),
                        kWidth5,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(
                                child: Text(
                                  "Time Spent on Task:",
                                  style: textThinStyle1,
                                ),
                              ),
                              Text(
                                DateTimeFormater
                                    .convertMinutesToHourMinuteFormat(int.parse(
                                        (message.timeExpenseData?.time) ??
                                            '0')),
                                style: textThinStyle1.copyWith(fontSize: 15.sp),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              kHeight5,
              Padding(
                padding: EdgeInsets.only(left: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description :",
                      style: textThinStyle1,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      message.timeExpenseData?.description ?? '',
                      style: textThinStyle1.copyWith(fontSize: 10.sp),
                    ),
                  ],
                ),
              ),
              // kHeight5,
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      DateTimeFormater.formatTimeAMPM(message.timestamp),
                      style: textThinStyle1.copyWith(
                          color: sender ? kgrey : klightgrey, fontSize: 8.sp),
                    ),
                    sender ? kWidth10 : kempty,
                    sender
                        ? MessageReadMarker(read: message.readByAll ?? false)
                        : kempty
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
