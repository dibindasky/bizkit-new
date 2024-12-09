import 'package:bizkit/module/task/application/presentation/screens/generate_report/generate_repor.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenerateReportButton extends StatelessWidget {
  const GenerateReportButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: EventButton(
        hieght: 40.h,
        width: 320.w,
        borderRadius: 10,
        text: 'Generate Report',
        textColr: kblack,
        onTap: () {
          showModalBottomSheet(
            context: context,
            enableDrag: true,
            isDismissible: true,
            showDragHandle: true,
            isScrollControlled: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            builder: (BuildContext context) {
              return const ScreenTaskReportGenerator();
            },
          );
        },
        color: neonNewLinearGradient,
      ),
    );
  }
}
