import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/card_detail_page.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/reminder/reminder_create_update.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/reminders_success_responce/reminder.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:bizkit/module/biz_card/application/presentation/screens2/home/view/home_second_screen/meeting_detail_section/meeting_detail_tab/history_log_tab_builder.dart';

class BizcardReminderDetails extends StatelessWidget {
  const BizcardReminderDetails({super.key, required this.reminder});
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
                      BizcardReminderDetailsContent(reminder: reminder),
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

class BizcardReminderDetailsContent extends StatelessWidget {
  const BizcardReminderDetailsContent({super.key, this.reminder});

  final Reminder? reminder;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        kHeight10,
        Row(
          children: [
            kWidth10,
            CircleAvatar(
              radius: 32,
              backgroundColor: neonShade,
              child: ClipOval(
                child: CircleAvatar(
                  backgroundColor: kgrey,
                  radius: 25.w,
                  child: Image.asset(chatSectionPersonDummyImg2),
                ),
              ),
            ),
            kWidth20,
            Expanded(
              child: Text(
                reminder?.meetingLabel ?? 'Lebel',
                overflow: TextOverflow.clip,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ],
        ),
        kHeight20,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextRow('Name', reminder?.ownerName ?? '', context),
              buildTextRow('Description', reminder?.description ?? '', context),
              buildTextRow('Venue', reminder?.venue ?? '', context),
              buildTextRow(
                  'Created',
                  DateTimeFormater.getDDMMHHMMformat(
                      reminder?.reminderDate ?? ''),
                  context),
              buildTextRow('Occation', reminder?.occasion ?? '', context),
            ],
          ),
        ),
        kHeight10,
        Row(
          children: [
            kWidth10,
            buildButton(
              context: context,
              borderRadius: kBorderRadius10,
              backgroundColor: neonShade,
              text: 'View card',
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BizCardDetailScreen(
                        cardId: reminder?.cardId ?? '', myCard: false),
                  ),
                );
              },
            ),
            kWidth5,
            buildButton(
              context: context,
              borderRadius: kBorderRadius10,
              border: Border.all(color: neonShade),
              text: 'Postpone',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      BizcardReminderCreateUpdateScreen(reminder: reminder),
                ),
              ),
            ),
            kWidth10,
          ],
        ),
      ],
    );
  }

  Widget buildTextRow(String label, String? value, BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            '$label ',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        Expanded(
          child: Text(
            value ?? '',
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.displaySmall,
            maxLines: 2,
          ),
        ),
      ],
    );
  }

  Widget buildButton(
      {required String text,
      required VoidCallback onTap,
      Color? backgroundColor,
      Color? textColor,
      Border? border,
      BorderRadius? borderRadius,
      EdgeInsets? padding,
      required BuildContext context}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: padding ?? const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: backgroundColor,
            border: border,
            borderRadius: borderRadius,
          ),
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
        ),
      ),
    );
  }
}
