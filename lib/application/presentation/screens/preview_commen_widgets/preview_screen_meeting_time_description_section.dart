import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class PreviewScreenMeetingTimeDescriptionSection extends StatelessWidget {
  const PreviewScreenMeetingTimeDescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: ColoredBox(
        color: bottomsheetContainerclr,
        child: SingleChildScrollView(
          child: Column(
            children: [
              historyLog(
                'asset/images/meeting profile png1.png',
                '1-10-23 | 11:40 AM',
                'Scheduled on 16-10-23 to discuss about features and pipeline details of project at office location.',
              ),
              historyLog(
                'asset/images/meeting profile png2.png',
                '22-10-23 | 1:40 PM',
                'Scheduled on 16-10-23 to discuss about features and pipeline details of project at office location.',
              ),
              historyLog(
                'asset/images/meeting profile png3.png',
                '16-10-23 | 7:40 PM',
                'Scheduled on 16-10-23 to discuss about features and pipeline details of project at office location.',
              ),
              historyLog(
                'asset/images/meeting profile png4.png',
                '19-10-23 | 5:40 PM',
                'Scheduled on 16-10-23 to discuss about features and pipeline details of project at office location.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget historyLog(String image, String date, String detail) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
              ),
              adjustWidth(kwidth * .004),
              Text(
                date,
                style: TextStyle(fontSize: kwidth * .035),
              ),
            ],
          ),
          adjustHieght(khieght * .006),
          Text(
            detail,
            style: TextStyle(fontSize: kwidth * .035),
          ),
        ],
      ),
    );
  }
}
