import 'dart:developer';

import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubTaskDetailView extends StatelessWidget {
  const SubTaskDetailView({
    super.key,
    this.subTaskDes,
    this.subTaskTitle,
    this.duration,
  });

  final String? subTaskTitle;
  final String? duration;
  final String? subTaskDes;

  @override
  Widget build(BuildContext context) {
    String? formattedDuration = _formatDuration(duration);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: kBorderRadius10,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: kBorderRadius10,
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              adjustWidth(25.w),
              Text(
                subTaskTitle ?? 'SubTask Title',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontSize: 15),
              ),
              IconButton(
                icon: const Icon(
                  Icons.close,
                  color: kneon,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          const Divider(color: kGreyNormal, indent: 0),
          adjustHieght(10.h),
          Text(
            subTaskDes ?? 'Subtask des',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          adjustHieght(10.h),
          if (formattedDuration != null)
            Text(
              'Total Time Taken: $formattedDuration',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          adjustHieght(10.h),
        ]),
      ),
    );
  }

  String? _formatDuration(String? duration) {
    if (duration == null || duration.isEmpty) return null;

    try {
      List<String> parts = duration.split(':');
      if (parts.length < 3) return duration;

      final int hours = int.parse(parts[0]);
      final int minutes = int.parse(parts[1]);
      final List<String> secondsAndMillis = parts[2].split('.');
      final int seconds = int.parse(secondsAndMillis[0]);

      StringBuffer result = StringBuffer();

      if (hours > 0) result.write('$hours hours ');
      if (minutes > 0 || hours > 0) result.write('$minutes minutes ');
      result.write('$seconds seconds');

      return result.toString().trim();
    } catch (e) {
      log('Error formatting duration: $e');
      return duration;
    }
  }
}
