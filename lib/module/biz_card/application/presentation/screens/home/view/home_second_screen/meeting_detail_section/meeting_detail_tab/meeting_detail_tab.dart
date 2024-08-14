import 'package:bizkit/module/biz_card/application/presentation/screens/home/view/home_second_screen/meeting_detail_section/meeting_detail_tab/history_log_tab_builder.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:flutter/material.dart';

class MeetingDetailTabBarItems extends StatelessWidget {
  const MeetingDetailTabBarItems({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: double.infinity),
            //EventButton(text: 'History', onTap: () {}),
            //Expanded(child: MeetingDetailHistoryLogTabBuilder())
          ],
        ),
      ),
    );
  }
}
