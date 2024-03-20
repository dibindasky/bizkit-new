import 'package:bizkit/application/presentation/screens/reminder/reminder_screen.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
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
              child: CircleAvatar(
                backgroundColor: kgrey,
                backgroundImage: reminder != null && reminder!.image != null
                    ? NetworkImage(
                        reminder!.image!,
                      )
                    : null,
                radius: 30,
              ),
            ),
            const SizedBox(width: 20),
            Text(
              'Meeting With \n${reminder?.name ?? 'Bizkit connection'}',
              style: TextStyle(
                fontSize: kwidth * .047,
                fontWeight: FontWeight.w700,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reminder?.venue ?? '',
                      style: TextStyle(
                        fontSize: kwidth * 0.03,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      DateTimeFormater.formatDateTime(
                          reminder?.date??'', reminder?.time??''),
                      style: TextStyle(
                        fontSize: kwidth * 0.03,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      reminder?.occation ?? '',
                      style: TextStyle(
                        fontSize: kwidth * 0.03,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: kwidth * 0.05),
        Row(
          children: [
            Expanded(
              child: Container(
                height: kwidth * 0.1,
                decoration: const BoxDecoration(
                  color: neonShade,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(7)),
                ),
                child: const Center(
                  child: Text('Card'),
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
                  height: kwidth * 0.1,
                  decoration: BoxDecoration(
                    border: Border.all(color: neonShade),
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(7),
                    ),
                  ),
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
      ],
    );
  }
}
