import 'dart:convert';

import 'package:bizkit/application/presentation/screens/card_view/card_detail_view.dart';
import 'package:bizkit/application/presentation/screens/reminder/reminder_screen.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/intl/intl_date_formater.dart';
import 'package:bizkit/domain/model/reminders/get_reminder_model/reminders.dart';
import 'package:flutter/material.dart';

class SecondScreenPageViewContents extends StatelessWidget {
  const SecondScreenPageViewContents({super.key, required this.reminder});

  final Reminders? reminder;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(height: 20),
        Row(
          children: [
            const SizedBox(width: 30),
            CircleAvatar(
              radius: 32,
              backgroundColor: neonShade,
              child: ClipOval(
                child: CircleAvatar(
                  backgroundColor: kgrey,
                  radius: 30,
                  child: reminder != null && reminder!.image != null
                      ? Image.memory(
                          base64Decode(
                            reminder!.image!.startsWith('data')
                                ? reminder!.image!.substring(22)
                                : reminder!.image!,
                          ),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                reminder?.meetingLabel ?? '',
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontSize: kwidth * .047,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: kwidth * 0.8,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name :',
                      style: TextStyle(fontSize: kwidth * 0.03),
                    ),
                    Text(
                      'Venue :',
                      style: TextStyle(fontSize: kwidth * 0.03),
                    ),
                    Text(
                      'Created :',
                      style: TextStyle(fontSize: kwidth * 0.03),
                    ),
                    Text(
                      'Occation :',
                      style: TextStyle(fontSize: kwidth * 0.03),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        reminder?.name ?? '',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: kwidth * 0.03,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        reminder?.venue ?? '',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: kwidth * 0.03,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        DateTimeFormater.formatDateTime(
                            reminder?.date ?? '', reminder?.time ?? ''),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: kwidth * 0.03,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        reminder?.occation ?? '',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: kwidth * 0.03,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: kwidth * 0.05),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: neonShade),
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(7),
              bottomLeft: Radius.circular(7),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScreenCardDetailView(
                                  cardId: reminder!.cardId!,
                                )));
                  },
                  child: Container(
                    // height: kwidth * 0.1,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: neonShade,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(7)),
                    ),
                    child: const Center(
                      child: Text('View card'),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreviewHomeAddReminderScreen(
                                reminder: reminder)));
                  },
                  child: Container(
                    // height: kwidth * 0.1,
                    padding: const EdgeInsets.all(9),
                    // decoration: BoxDecoration(
                    //   border: Border.all(color: neonShade),
                    //   borderRadius: const BorderRadius.only(
                    //     bottomRight: Radius.circular(7),
                    //   ),
                    // ),
                    child: const Center(
                      child: Text(
                        'Postpone',
                        style: TextStyle(color: neonShade),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
