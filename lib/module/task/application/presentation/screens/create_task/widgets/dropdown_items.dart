import 'package:bizkit/module/task/application/presentation/widgets/drop_down.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class DropDownItems extends StatefulWidget {
  const DropDownItems({super.key});

  @override
  State<DropDownItems> createState() => _DropDownItemsState();
}

class _DropDownItemsState extends State<DropDownItems> {
  String priorityLevel = 'Medium';
  String recurring = 'No';
  String taskHead = 'Add Task Head';
  String assignTo = 'Search for connection';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDropDown(
            'Priority level', priorityLevel, const ['Low', 'Medium', 'High'],
            (newValue) {
          setState(() {
            priorityLevel = newValue!;
          });
        }),
        adjustHieght(20),
        CustomDropDown('Recurring', recurring, const ['No', 'Yes'], (newValue) {
          setState(() {
            recurring = newValue!;
          });
        }),
        adjustHieght(20),
        CustomDropDown('Task Head', taskHead, const ['Add Task Head'],
            (newValue) {
          setState(() {
            taskHead = newValue!;
          });
        }),
        adjustHieght(20),
        CustomDropDown('Assign to', assignTo, const [
          'Search for connection',
          'Akash',
          'Dibin',
          'Abhi',
          'Shahin',
        ], (newValue) {
          setState(() {
            assignTo = newValue!;
          });
        }),
      ],
    );
  }
}
