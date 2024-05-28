import 'package:bizkit/module/task/application/presentation/screens/create_task/pop_up/sub_task_creation.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/widgets/container_textfield_dummy.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskDetailSubtasksSection extends StatelessWidget {
  const TaskDetailSubtasksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Subtasks',
              style: textHeadStyle1,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => const SubTaskCreationCustomDialog());
              },
              child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 3.h, horizontal: 10.w),
                  decoration: BoxDecoration(
                      color: neonShade, borderRadius: kBorderRadius5),
                  child: Row(children: [
                    const Icon(Icons.add, color: kwhite),
                    adjustWidth(5.w),
                    const Text('Add Sub Task')
                  ])),
            )
          ],
        ),
        adjustHieght(5.h),
        ListView.builder(
          itemCount: 2,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => const SubTaskTileDetailPage(),
        )
      ],
    );
  }
}

class SubTaskTileDetailPage extends StatelessWidget {
  const SubTaskTileDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => Dialog(
              backgroundColor: kblack,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Text('New Project user flow', style: textHeadStyle1),
                  adjustHieght(10.h),
                  const ContainerTextFieldDummy(
                      text: 'Task Start Date',
                      suffixIcon: Icons.calendar_month_outlined),
                  adjustHieght(10.h),
                  const ContainerTextFieldDummy(
                      text: 'Total Time Taken', suffixIcon: Icons.alarm_sharp),
                  adjustHieght(30.h),
                  EventButton(
                    text: 'Complete',
                    onTap: () {},
                    wdth: double.infinity,
                  )
                ]),
              )),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.w),
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: kGrayLight,
          borderRadius: kBorderRadius10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset('asset/images/icon/Vector.png', scale: 2),
                adjustWidth(10.w),
                Text(
                  'new project user flow',
                  style: textHeadStyle1.copyWith(color: neonShade),
                ),
                const Spacer(),
                Checkbox(
                  value: false,
                  onChanged: (bool? value) {},
                  activeColor: Colors.teal,
                  checkColor: Colors.white,
                ),
              ],
            ),
            Text(
              'User interface (UI) design is the process designers use to build interfaces in software or computerized devices.',
              style: textThinStyle1,
            ),
            adjustHieght(5.h),
            Text(
              'Deadline : 16 May 2024',
              style: textStyle1,
            ),
          ],
        ),
      ),
    );
  }
}
