import 'package:bizkit/module/biz_card/application/presentation/screens/home/view/home_second_screen/meeting_detail_section/meeting_detail_tab/history_log_tab_builder.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/view/home_second_screen/pageview_container_top/page_view_contents.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/reminders_success_responce/reminder.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenCardReminderDetailWithoutAnimation extends StatelessWidget {
  const ScreenCardReminderDetailWithoutAnimation(
      {super.key, required this.reminder});
  final Reminder reminder;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            kHeight20,
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  height: khieght * .7,
                  padding: EdgeInsets.all(7.w),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: neonShade,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    children: [
                      SecondScreenPageViewContents(reminder: reminder),
                      kHeight20,
                      // const Expanded(
                      //   child: MeetingDetailTabBarItems(),
                      // ),
                      const Expanded(child: MeetingDetailHistoryLogTabBuilder())
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      radius: 15.w,
                      backgroundColor: neonShade,
                      child: const Icon(Icons.close),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
