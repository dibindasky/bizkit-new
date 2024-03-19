import 'package:bizkit/application/business_logic/reminder/reminder_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/home/view/home_second_screen/meeting_detail_section/meeting_detail_screen.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/domain/model/reminders/get_reminder_model/reminders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReminderTile extends StatelessWidget {
  const ReminderTile({super.key, required this.reminder});
  final Reminders reminder;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context
            .read<ReminderBloc>()
            .add(ReminderEvent.getReminderDetails(id: reminder.id!));
        Navigator.push(
          context,
          fadePageRoute(const MeetingDetailScreen()),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
        padding: const EdgeInsets.only(right: 8),
        height: 100,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              blurRadius: 5.0,
              offset: Offset(3.0, 3.0),
              spreadRadius: -2.0,
            )
          ],
          color: backgroundColour,
        ),
        child: Row(
          children: [
            Container(
              width: kwidth * 0.24,
              decoration: BoxDecoration(
                image: reminder.image != null
                    ? DecorationImage(
                        image: NetworkImage(
                          reminder.image!,
                        ),
                        fit: BoxFit.cover,
                      )
                    : null,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              child: reminder.image != null ? null : const Icon(Icons.person_2),
            ),
            adjustWidth(kwidth * .02),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Discussion with \n${reminder.name ?? ''}',
                  style: textHeadStyle1,
                ),
                Text(
                  reminder.date!,
                  style: textStyle1,
                ),
              ],
            ),
            const Spacer(),
            const CircleAvatar(
              radius: 13,
              backgroundColor: neonShade,
              child: Icon(
                Icons.keyboard_arrow_right,
                size: 23,
                color: kblack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
