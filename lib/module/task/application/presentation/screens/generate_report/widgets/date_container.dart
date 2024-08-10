// import 'package:bizkit/module/task/application/controller/generate_report/generate_report.dart';
// import 'package:bizkit/utils/constants/colors.dart';
// import 'package:bizkit/utils/constants/contants.dart';
// import 'package:bizkit/utils/date_bottom_sheet.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class DateContainer extends StatelessWidget {
//   DateContainer({super.key, this.title, this.isFromDate});

//   final String? title;
//   final bool? isFromDate;

//   final controllerr = Get.find<TaskGenerateReportController>();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Text(title ?? '', style: const TextStyle(color: kwhite)),
//         adjustHieght(8.h),
//         GetBuilder<TaskGenerateReportController>(
//           builder: (controller) => Row(
//             children: [
//               InkWell(
//                 onTap: () {
//                   showModalBottomSheet(
//                     context: context,
//                     enableDrag: true,
//                     isDismissible: true,
//                     showDragHandle: true,
//                     isScrollControlled: true,
//                     builder: (BuildContext context) {
//                       return DatePickingBottomSheet(
//                         year: 500,
//                         last: 500,
//                         onPressed: (date) {
//                           if (isFromDate == true) {
//                             controllerr.changeFromDate(date);
//                           } else {
//                             controllerr.changeToDate(date);
//                           }
//                         },
//                         datePicker: isFromDate == true
//                             ? controllerr.fromDate
//                             : controllerr.toDate,
//                       );
//                     },
//                   );
//                 },
//                 child: Container(
//                   width: kwidth * .80,
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
//                   decoration: BoxDecoration(
//                     color: lightGrey,
//                     borderRadius: kBorderRadius10,
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         // controller.fromDate.text.isEmpty
//                         //     ? title ?? ''
//                         //     : controller.fromDate.text,
//                         isFromDate == true
//                             ? controller.fromDate.text.isEmpty
//                                 ? title ?? ''
//                                 : controller.fromDate.text
//                             : controller.toDate.text.isEmpty
//                                 ? title ?? ''
//                                 : controller.toDate.text,
//                         style: const TextStyle(color: kwhite),
//                       ),
//                       const Icon(Icons.calendar_month_rounded,
//                           color: neonShade),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'dart:developer';

import 'package:bizkit/module/task/application/controller/generate_report/generate_report.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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
                      return SizedBox(
                        width: double.infinity,
                        height: khieght * 0.6,
                        child: SfDateRangePicker(
                          backgroundColor: kblack,
                          onCancel: () {
                            Navigator.of(context).pop();
                          },

                          // selectionColor: neonShade,
                          rangeSelectionColor: neonShade,
                          headerStyle: const DateRangePickerHeaderStyle(
                              backgroundColor: kblack),
                          onSelectionChanged:
                              (DateRangePickerSelectionChangedArgs args) {
                            if (args.value is PickerDateRange) {
                              PickerDateRange range = args.value;
                              final DateTime startDate =
                                  range.startDate ?? DateTime.now();
                              final DateTime endDate =
                                  range.endDate ?? DateTime.now();

                              // Log the selected date range
                              // log('Selected Range ======>>>> : $startDate to $endDate');

                              // Update the controller based on the selection
                              controllerr.changeFromDate(
                                  DateTimeFormater.dateTimeFormat(startDate));
                              controllerr.changeToDate(
                                  DateTimeFormater.dateTimeFormat(endDate));
                            }
                          },
                          allowViewNavigation: true,
                          extendableRangeSelectionDirection:
                              ExtendableRangeSelectionDirection.forward,
                          selectionMode: DateRangePickerSelectionMode.range,
                          initialDisplayDate: DateTime.now(),
                          initialSelectedRange: PickerDateRange(
                            DateTime.now().subtract(const Duration(days: 31)),
                            DateTime.now(),
                          ),
                        ),
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
                      Expanded(
                        child: Text(
                          controllerr.fromDate.text.isNotEmpty &&
                                  controllerr.toDate.text.isNotEmpty
                              ? '${controllerr.fromDate.text}  to  ${controllerr.toDate.text}'
                              : title ?? 'Select Date Range',
                          style: const TextStyle(color: kwhite),
                        ),
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
