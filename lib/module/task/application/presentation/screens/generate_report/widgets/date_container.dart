import 'package:bizkit/module/task/application/controller/generate_report/generate_report.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/date_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DateContainer extends StatelessWidget {
  DateContainer({super.key});

  final controllerr = Get.find<TaskGenerateReportController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Select Date Range', style: TextStyle(color: kwhite)),
        adjustHieght(8.h),
        GetBuilder<TaskGenerateReportController>(
          builder: (controller) => Row(
            children: [
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    enableDrag: true,
                    isDismissible: true,
                    showDragHandle: true,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return DatePickingBottomSheet(
                        year: 500,
                        last: 500,
                        onPressed: (date) {
                          controllerr.changeGenareteDate(date);
                        },
                        datePicker: controllerr.genaretesDate,
                      );
                    },
                  );
                },
                child: Container(
                  width: kwidth * .98,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  decoration: BoxDecoration(
                    color: lightGrey,
                    borderRadius: kBorderRadius10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.genaretesDate.text.isEmpty
                            ? 'Select Date Range'
                            : controller.genaretesDate.text,
                        style: const TextStyle(color: kwhite),
                      ),
                      const Icon(Icons.calendar_month_rounded,
                          color: neonShade),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
