import 'package:bizkit/module/task/application/presentation/screens/create_task/widgets/container_textfield_dummy.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/date_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeadlineChooserCreateTask extends StatelessWidget {
  const DeadlineChooserCreateTask(
      {super.key, required this.onPressed, this.showTitle = true});

  final Function(String) onPressed;
  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    final dateController = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        showTitle ? adjustHieght(10.h) : kempty,
        showTitle
            ? Text('Deadline',
                style: TextStyle(
                  fontSize: 15.sp,
                  color: neonShade,
                ))
            : kempty,
        showTitle ? adjustHieght(3.h) : kempty,
        InkWell(
          onTap: () => showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return DatePickingBottomSheet(
                year: 500,
                last: 500,
                onPressed: onPressed,
                datePicker: dateController,
              );
            },
          ),
          child: ContainerTextFieldDummy(
              text: dateController.text.isEmpty
                  ? 'Choose Deadline'
                  : dateController.text,
              suffixIcon: Icons.calendar_month),
        ),
      ],
    );
  }
}
