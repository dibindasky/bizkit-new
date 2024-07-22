import 'package:bizkit/module/task/application/controller/generate_report/generate_report.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/date_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DateContainer extends StatelessWidget {
  DateContainer({super.key, this.title, this.isFromDate});

  final String? title;
  final bool? isFromDate;

  final controllerr = Get.find<TaskGenerateReportController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(title ?? '', style: const TextStyle(color: kwhite)),
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
                          if (isFromDate == true) {
                            controllerr.changeFromDate(date);
                          } else {
                            controllerr.changeToDate(date);
                          }
                        },
                        datePicker: isFromDate == true
                            ? controllerr.fromDate
                            : controllerr.toDate,
                      );
                    },
                  );
                },
                child: Container(
                  width: kwidth * .80,
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
                        // controller.fromDate.text.isEmpty
                        //     ? title ?? ''
                        //     : controller.fromDate.text,
                        isFromDate == true
                            ? controller.fromDate.text.isEmpty
                                ? title ?? ''
                                : controller.fromDate.text
                            : controller.toDate.text.isEmpty
                                ? title ?? ''
                                : controller.toDate.text,
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
