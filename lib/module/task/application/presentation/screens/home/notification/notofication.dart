import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';

class NotoficationBuilder extends StatelessWidget {
  const NotoficationBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 17,
          ),
        ),
        title: const Text('Notifications'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return const NotificationCard();
          },
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: kBorderRadius15,
      ),
      child: Row(
        children: [
          SizedBox(
            width: kwidth * .7,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 6.0,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'Task',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Text(
                  'Click to get more information',
                  style: TextStyle(color: Colors.grey, fontSize: 12.0),
                ),
                SizedBox(height: 4.0),
                Text(
                  'New project task assigned to imran',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  'meeting about the new movie details',
                  style: TextStyle(color: Colors.grey, fontSize: 12.0),
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '25m ago',
                style: TextStyle(color: Colors.grey, fontSize: 12.0),
              ),
              const SizedBox(height: 8.0),
              CircleAvatar(
                radius: 20.0,
                child: Image.asset(dummyPersonImage),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
