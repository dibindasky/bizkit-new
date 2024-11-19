import 'package:bizkit/module/task/application/controller/generate_report/generate_report.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
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
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            onCancel: () {
                              controllerr.selectedRange = null;
                              controller.fromDate.text = '';
                              controller.toDate.text = '';
                              Navigator.of(context).pop();
                            },
                            cancelText: 'Cancel',
                            confirmText: 'Ok',
                            onSubmit: (p0) {
                              Navigator.of(context).pop();
                              controllerr.selectedRange = null;
                            },
                            showActionButtons: true,
                            toggleDaySelection: true,
                            headerHeight: 30.h,
                            headerStyle: DateRangePickerHeaderStyle(
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                            ),
                            onSelectionChanged:
                                (DateRangePickerSelectionChangedArgs args) {
                              if (args.value is PickerDateRange) {
                                PickerDateRange range = args.value;
                                final DateTime startDate =
                                    range.startDate ?? DateTime.now();
                                final DateTime endDate =
                                    range.endDate ?? DateTime.now();
                                controllerr.changeFromDate(
                                    DateTimeFormater.dateTimeFormat(startDate));
                                controllerr.changeToDate(
                                    DateTimeFormater.dateTimeFormat(endDate));

                                controllerr.selectedRange = range;
                              }
                            },
                            allowViewNavigation: true,
                            extendableRangeSelectionDirection:
                                ExtendableRangeSelectionDirection.forward,
                            selectionMode: DateRangePickerSelectionMode.range,
                            initialSelectedRange: controllerr.selectedRange),
                      );
                    },
                  );
                },
                child: Card(
                  elevation: 0,
                  child: Container(
                    width: kwidth * .80,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 16),
                    decoration: BoxDecoration(
                        borderRadius: kBorderRadius10,
                        border: Border.all(color: kGreyNormal)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            controllerr.fromDate.text.isNotEmpty &&
                                    controllerr.toDate.text.isNotEmpty
                                ? '${controllerr.fromDate.text}  to  ${controllerr.toDate.text}'
                                : title ?? 'Select Date Range',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ),
                        const Icon(Iconsax.calendar_1, color: kneon),
                      ],
                    ),
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
