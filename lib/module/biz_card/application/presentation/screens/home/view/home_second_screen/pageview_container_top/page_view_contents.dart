import 'dart:convert';

import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail_view/card_detail_view.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/reminder/reminder_create_update.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/reminders_success_responce/reminder.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondScreenPageViewContents extends StatelessWidget {
  const SecondScreenPageViewContents({super.key, this.reminder});

  final Reminder? reminder;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
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
                        //  reminder != null &&
                        //         reminder!.profilePicture != null &&
                        //         reminder!.profilePicture!.isNotEmpty? ,
                        child: Image.memory(
                          base64Decode(
                            reminder != null &&
                                    reminder!.profilePicture != null &&
                                    reminder!.profilePicture!.isNotEmpty
                                ? reminder!.profilePicture!.startsWith('data')
                                    ? reminder!.profilePicture!.replaceAll(
                                        'data:image/png;base64,', '')
                                    : reminder!.profilePicture!
                                : imageTestingBase64,
                          ),
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                kWidth20,
                Expanded(
                  child: Text(
                    reminder?.meetingLabel ?? 'Lebel',
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontSize: kwidth * .047,
                      fontWeight: FontWeight.w700,
                    ),
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
                  buildTextRow('Name', reminder?.ownerName ?? ''),
                  buildTextRow('Description', reminder?.description ?? ''),
                  buildTextRow('Venue', reminder?.venue ?? ''),
                  buildTextRow('Created', reminder?.reminderDate ?? ''),
                  buildTextRow('Occation', reminder?.occasion ?? ''),
                ],
              ),
            ),
            kHeight10,
            Row(
              children: [
                kWidth10,
                buildButton(
                  borderRadius: kBorderRadius10,
                  backgroundColor: neonShade,
                  text: 'View card',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScreenCardDetailView(
                            cardId: reminder?.cardId ?? '', myCard: false),
                      ),
                    );
                  },
                ),
                kWidth5,
                buildButton(
                  borderRadius: kBorderRadius10,
                  border: Border.all(color: neonShade),
                  text: 'Postpone',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ScreenCardReminderCreating(reminder: reminder),
                    ),
                  ),
                ),
                kWidth10,
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget buildTextRow(String label, String? value) {
    return Row(
      children: [
        Expanded(
          child: Text(
            '$label ',
            style: TextStyle(fontSize: 11.sp),
          ),
        ),
        Expanded(
          child: Text(
            value ?? '',
            overflow: TextOverflow.ellipsis,
            style: textThinStyle1.copyWith(fontSize: 11.sp),
            maxLines: 2,
          ),
        ),
      ],
    );
  }

  Widget buildButton({
    required String text,
    required VoidCallback onTap,
    Color? backgroundColor,
    Color? textColor,
    Border? border,
    BorderRadius? borderRadius,
    EdgeInsets? padding,
  }) {
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
            child: Text(text, style: textThinStyle1.copyWith(color: textColor)),
          ),
        ),
      ),
    );
  }
}
