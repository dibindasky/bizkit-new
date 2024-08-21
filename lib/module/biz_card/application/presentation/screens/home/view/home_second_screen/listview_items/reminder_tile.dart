import 'dart:convert';

import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/view/home_second_screen/meeting_detail_section/meeting_detail_without_animation.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReminderTile extends StatelessWidget {
  const ReminderTile({super.key});
  // final Reminders reminder;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // context
        //     .read<ReminderBloc>()
        //     .add(ReminderEvent.getReminderDetails(id: reminder.id!));
        Navigator.push(
          context,
          cardFadePageRoute(const ScreenCardReminderDetailWithoutAnimation()),
        );
      },
      child: Container(
        padding:
            EdgeInsets.only(top: 20.w, left: 2.w, bottom: 20.w, right: 7.w),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                blurRadius: 5.0,
                offset: Offset(3.0, 3.0),
                spreadRadius: -2.0,
              )
            ],
            color: backgroundColour),
        child: Row(
          children: [
            kWidth5,
            Image.memory(base64Decode(imageTestingBase64.substring(22)),
                height: 50.h),
            // SizedBox(
            //   width: kwidth * 0.24,
            //   // decoration: BoxDecoration(
            //   //   image: reminder.image != null
            //   //       ? DecorationImage(
            //   //           image: NetworkImage(
            //   //             reminder.image!,
            //   //           ),
            //   //           fit: BoxFit.cover,
            //   //         )
            //   //       : null,
            //   //   borderRadius: const BorderRadius.only(
            //   //     topLeft: Radius.circular(12),
            //   //     bottomLeft: Radius.circular(12),
            //   //   ),
            //   // ),
            //   child:
            //       //  reminder.image != null && reminder.image!.isNotEmpty
            //       //     ? Image.memory(base64Decode(reminder.image!.startsWith('data')
            //       //         ? reminder.image!.substring(22)
            //       //         : reminder.image!))
            //       //     :
            //       const Icon(Icons.person_2),
            // ),
            kWidth10,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Discussion with', style: textHeadStyle1),
                Text('Date', style: textStyle1.copyWith(fontSize: 11.sp)),
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
