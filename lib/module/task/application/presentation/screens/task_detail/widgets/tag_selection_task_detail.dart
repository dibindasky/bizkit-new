import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskDetailTagsSection extends StatelessWidget {
  const TaskDetailTagsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kGrayLight,
        borderRadius: kBorderRadius10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tags',
            style: textHeadStyle1,
          ),
          adjustHieght(5.h),
          Wrap(
              spacing: 8.w,
              runSpacing: 8.w,
              children: List.generate(
                4,
                (index) => const TagChip(label: 'Flow'),
              )),
        ],
      ),
    );
  }
}

class TagChip extends StatelessWidget {
  final String label;

  const TagChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.w),
      decoration: BoxDecoration(
        borderRadius: kBorderRadius5,
        color: backgroundColour,
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Text(label, style: textThinStyle1),
        adjustWidth(10.w),
        GestureDetector(
            onTap: () {
              // handle tag deletion
            },
            child: const Icon(Icons.close, color: neonShade))
      ]),
    );
  }
}