import 'package:bizkit/module/task/application/presentation/screens/create_task/pop_up/sub_task_creation.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/pop_up/sub_task_detail_view.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
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
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const SubTaskDetailView(),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: lightGrey, borderRadius: kBorderRadius10),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.h),
                    child: Text(
                      subtasks[index],
                      style: const TextStyle(color: kwhite),
                    ),
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
                  context: context,
                  builder: (context) => SubTaskCreationCustomDialog());
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
