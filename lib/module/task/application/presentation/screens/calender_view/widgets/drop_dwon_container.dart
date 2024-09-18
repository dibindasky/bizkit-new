import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TaskSortingBottomSheet extends StatelessWidget {
  TaskSortingBottomSheet({super.key});

  final taskCalenderController = Get.find<TaskCalenderViewController>();

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return GetBuilder<TaskCalenderViewController>(builder: (controlller) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Choose Dead Line', style: TextStyle(fontSize: 14.sp)),
                adjustHieght(4.h),
                ClipRRect(
                  child: DropdownButtonFormField<String>(
                    hint: const Text('Dead Line',
                        style: TextStyle(color: klightgrey)),
                    value: taskCalenderController.deadLine.value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: kBorderRadius10,
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: lightGrey,
                    ),
                    items: names.toSet().map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child:
                            Text(value, style: const TextStyle(color: kwhite)),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      taskCalenderController.changeDeadLineData(newValue ?? '');
                    },
                    dropdownColor: backgroundColour,
                    iconEnabledColor: neonShade,
                  ),
                ),
                adjustHieght(10.h),
                Text('Choose Priority', style: TextStyle(fontSize: 14.sp)),
                adjustHieght(4.h),
                ClipRRect(
                  child: DropdownButtonFormField<String>(
                    hint: const Text('Prority',
                        style: TextStyle(color: klightgrey)),
                    value: taskCalenderController.priority.value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: kBorderRadius10,
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: lightGrey,
                    ),
                    items: names.toSet().map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child:
                            Text(value, style: const TextStyle(color: kwhite)),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      taskCalenderController.changePriorityData(newValue ?? '');
                    },
                    dropdownColor: backgroundColour,
                    iconEnabledColor: neonShade,
                  ),
                ),
                adjustHieght(10.h),
                Text('Choose Task Type', style: TextStyle(fontSize: 14.sp)),
                adjustHieght(4.h),
                ClipRRect(
                  child: DropdownButtonFormField<String>(
                    hint: const Text('Task Type',
                        style: TextStyle(color: klightgrey)),
                    value: taskCalenderController.taskType.value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: kBorderRadius10,
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: lightGrey,
                    ),
                    items: names.toSet().map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child:
                            Text(value, style: const TextStyle(color: kwhite)),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      taskCalenderController.changeTaskTypeData(newValue ?? '');
                    },
                    dropdownColor: backgroundColour,
                    iconEnabledColor: neonShade,
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: EventButton(
                    wdth: 200.w,
                    text: 'Start Sorting task',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                adjustHieght(20.h)
              ],
            ),
          );
        });
      },
    );
  }
}
