import 'dart:convert';
import 'dart:developer';

import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/application/controller/reminder/reminder_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/view/home_second_screen/meeting_detail_section/meeting_detail_without_animation.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/reminders_success_responce/reminder.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReminderTile extends StatelessWidget {
  const ReminderTile({super.key, required this.reminder});
  final Reminder reminder;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.find<ReminderController>()
            .getCardRemiderHistory(id: reminder.id ?? '');
        Navigator.push(
          context,
          cardFadePageRoute(
              ScreenCardReminderDetailWithoutAnimation(reminder: reminder)),
        );
      },
      child: Container(
        padding:
            EdgeInsets.only(top: 20.w, left: 2.w, bottom: 20.w, right: 7.w),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                  blurRadius: 5.0, offset: Offset(3.0, 3.0), spreadRadius: -2.0)
            ],
            color: backgroundColour),
        child: Row(
          children: [
            kWidth5,
            SizedBox(
              width: kwidth * 0.24,
              child: reminder.profilePicture != null &&
                      reminder.profilePicture!.isNotEmpty
                  ? Image.memory(
                      base64Decode(reminder.profilePicture!.startsWith('data')
                          ? reminder.profilePicture!.substring(22)
                          : reminder.profilePicture!),
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.image),
                    )
                  : Image.memory(
                      base64Decode(imageTestingBase64.substring(22)),
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.image),
                    ),
            ),
            kWidth10,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Discussion with', style: textStyle1),
                Text(reminder.ownerName ?? '', style: textStyle1.copyWith()),
                Text(DateTimeFormater.getDDMMHHMMformat(reminder.reminderDate),
                    style: textThinerStyle1),
              ],
            ),
            const Spacer(),
            CircleAvatar(
              radius: 13,
              backgroundColor: neonShade,
              child: Icon(
                Icons.keyboard_arrow_right,
                size: 23.w,
                color: kblack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
