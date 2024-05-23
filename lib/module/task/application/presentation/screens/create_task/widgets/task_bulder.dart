import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';

class TaskBuilder extends StatelessWidget {
  TaskBuilder({super.key});

  final List<String> subtasks = [
    'Client meeting',
    'Refrence checking',
    'New party'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: subtasks.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 7),
          child: Container(
            decoration:
                BoxDecoration(color: lightGrey, borderRadius: kBorderRadius10),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Text(
                subtasks[index],
                style: const TextStyle(color: kwhite),
              ),
            ),
          ),
        );
      },
    );
  }
}
