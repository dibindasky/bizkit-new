import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class NotificationSettings extends StatelessWidget {
  const NotificationSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: kwhite,
          ),
        ),
        backgroundColor: knill,
        title: const Text(
          'Notification settings',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text('Commen'),
          ),
          SwitchListTile(
            title: const Text('General notification'),
            value: true, // Set initial value here
            onChanged: (bool value) {},
          ),
          SwitchListTile(
            title: const Text('Sound'),
            value: true, // Set initial value here
            onChanged: (bool value) {},
          ),
          SwitchListTile(
            title: const Text('Vibrate'),
            value: true, // Set initial value here
            onChanged: (bool value) {},
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              thickness: .2,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text('System & services updates'),
          ),
          SwitchListTile(
            title: const Text('All updates'),
            value: true, // Set initial value here
            onChanged: (bool value) {},
          ),
          SwitchListTile(
            title: const Text('Feature updates'),
            value: true, // Set initial value here
            onChanged: (bool value) {},
          ),
          SwitchListTile(
            title: const Text('Promotios'),
            value: true, // Set initial value here
            onChanged: (bool value) {},
          ),
        ],
      ),
    );
  }
}
