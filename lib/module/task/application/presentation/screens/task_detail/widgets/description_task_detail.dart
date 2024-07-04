import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskDetailDescriptionSection extends StatelessWidget {
  const TaskDetailDescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: kGrayLight,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Description', style: textHeadStyle1),
          adjustHieght(5.h),
          Text(
            'User interface (UI) design is the process designers use to build interfaces in software or computerized devices, focusing on looks or style. Designers aim to create interfaces which users find easy to use and pleasurable.',
            style: textStyle1,
          ),
        ],
      ),
    );
  }
}
