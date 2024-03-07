import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class PreviewHomeContactDetailAddReminderContainer extends StatelessWidget {
  const PreviewHomeContactDetailAddReminderContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   fadePageRoute(PreviewHomeAddReminderScreen()),
        // );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(7),
          ),
          border: Border.all(
            color: textFieldFillColr,
          ),
        ),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 10,
              backgroundImage: AssetImage(
                'asset/images/addButtunIconImage.png',
              ),
            ),
            adjustWidth(kwidth * .03),
            Text('Add Reminder', style: textHeadStyle1),
          ],
        ),
      ),
    );
  }
}
