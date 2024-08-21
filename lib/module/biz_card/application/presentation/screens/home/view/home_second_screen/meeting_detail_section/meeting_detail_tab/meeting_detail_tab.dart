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
