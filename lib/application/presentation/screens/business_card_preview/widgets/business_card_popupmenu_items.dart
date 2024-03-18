import 'package:bizkit/application/presentation/screens/profile_screen/view/screen/account_settings/inner_screens/report_a_problem.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class BusinessCardCreationPreviewAppBar extends StatelessWidget {
  const BusinessCardCreationPreviewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        PopupMenuButton<String>(
          color: backgroundColour,
          icon: const Icon(
            Icons.more_vert,
            size: 23,
            color: kwhite,
          ),
          onSelected: (value) {
            handlePopupMenuSelection(context, value);
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'Edit Bizkit card',
              child: Text('Edit Bizkit card'),
            ),
            const PopupMenuItem(
              value: 'Add information',
              child: Text('Add information'),
            ),
            const PopupMenuItem(
              value: 'Report a problem',
              child: Text('Report a problem'),
            ),
          ],
        ),
      ],
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 17,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
        color: kwhite,
      ),
      backgroundColor: knill,
      title: Text(
        'My Bizkit Card Preview',
        style: textHeadStyle1,
      ),
    );
  }

  void handlePopupMenuSelection(BuildContext context, String value) {
    switch (value) {
      case 'Edit Bizkit card':
        // Handle Edit Bizkit card action
        break;
      case 'Add information':
        // Handle Add information action
        break;
      case 'Report a problem':
        // Navigate to the Report a Problem page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReportProblemPage(),
          ),
        );
        break;
    }
  }
}
