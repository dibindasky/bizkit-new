import 'package:bizkit/module/task/application/presentation/screens/create_task/widgets/container_textfield_dummy.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/widgets/deadline_chooser.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_textfrom_fireld.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubTaskBuilder extends StatelessWidget {
  SubTaskBuilder({super.key});

  final List<String> subtasks = [
    'Client meeting',
    'Refrence checking',
    'New party'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Subtasks',
          style: TextStyle(
            fontSize: 15.sp,
            color: neonShade,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: subtasks.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Container(
                decoration: BoxDecoration(
                    color: lightGrey, borderRadius: kBorderRadius10),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Text(
                    subtasks[index],
                    style: const TextStyle(color: kwhite),
                  ),
                ),
              ),
            );
          },
        ),
        adjustHieght(5.h),
        Align(
          alignment: Alignment.bottomRight,
          child: InkWell(
            onTap: () {
              showDialog(
                  context: context, builder: (context) => CustomDialog());
            },
            child: ClipRRect(
              borderRadius: kBorderRadius5,
              child: ColoredBox(
                color: neonShade,
                child: Padding(
                  padding: EdgeInsets.all(5.0.w),
                  child: const Icon(
                    Icons.add,
                    color: kblack,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sub Task',
                style: TextStyle(
                    color: Colors.teal,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 3.h),
            Text('Add The Subtask and assign it to the concerned person',
                style: TextStyle(color: klightgrey, fontSize: 8.h),
                textAlign: TextAlign.center),
            SizedBox(height: 20.h),
            const TaskTextField(hintText: 'Add Task Title here'),
            SizedBox(height: 10.h),
            const TaskTextField(hintText: 'Description'),
            SizedBox(height: 10.h),
            DeadlineChooserCreateTask(onPressed: (date) {}, showTitle: false),
            SizedBox(height: 10.h),
            const ContainerTextFieldDummy(
                text: 'Assign to', suffixIcon: Icons.arrow_right),
            SizedBox(height: 30.h),
            SizedBox(
                width: double.infinity,
                child: EventButton(text: 'Create Sub Task', onTap: () {})),
          ],
        ),
      ),
    );
  }
}
