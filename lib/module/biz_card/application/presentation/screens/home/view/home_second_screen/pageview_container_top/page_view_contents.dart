import 'dart:convert';

import 'package:bizkit/module/biz_card/application/presentation/screens/card_view/card_detail_view.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/reminder/reminder_screen.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:bizkit/module/biz_card/domain/model/reminders/get_reminder_model/reminders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondScreenPageViewContents extends StatelessWidget {
  const SecondScreenPageViewContents({super.key});

  //Reminders? reminder = Reminders();

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    //         reminder!.image != null &&
                    //         reminder!.image!.isNotEmpty
                    child: Image.memory(
                      base64Decode(
                        imageTestingBase64.startsWith('data')
                            ? imageTestingBase64.substring(22)
                            : imageTestingBase64,
                      ),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            kWidth20,
            Expanded(
              child: Text(
                'Meeting lebel',
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
              buildTextRow('Name', 'Febin'),
              buildTextRow('Venue', 'Wayanad'),
              buildTextRow('Created', '22/08.202'),
              buildTextRow('Occation', 'Padinjarathara'),
            ],
          ),
        ),
        kHeight20,
        Row(
          children: [
            kWidth10,
            buildButton(
              borderRadius: kBorderRadius10,
              backgroundColor: neonShade,
              text: 'View card',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScreenCardDetailView(),
                ),
              ),
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
                      ScreenCardReminderCreating(reminder: Reminders()),
                ),
              ),
            ),
            kWidth10
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
            ' :  ${value ?? ''}',
            overflow: TextOverflow.ellipsis,
            style: textThinStyle1.copyWith(fontSize: 11.sp),
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
