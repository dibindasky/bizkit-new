import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/domain/model/dashboard/genearate_report_model/genearate_report_model.dart';

import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';

import 'package:bizkit/utils/event_button.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReportsView extends StatelessWidget {
  const ReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskHomeScreenController controller =
        Get.find<TaskHomeScreenController>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
            controller.selectedTaskIds.clear();
            controller.selectedFields.clear();
            controller.selectedReportType.value = '';
            // Get.back(id: 1);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('Tasks'),
        backgroundColor: knill,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              adjustHieght(15.h),
              Expanded(
                child: Obx(
                  () {
                    if (controller.isLoading.value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (controller.reportTasks.isEmpty) {
                      return ErrorRefreshIndicator(
                        image: emptyNodata2,
                        errorMessage: 'No Tasks',
                        onRefresh: () {},
                      );
                    } else {
                      return ListView.builder(
                        itemCount: controller.reportTasks.length,
                        itemBuilder: (context, index) {
                          return Obx(
                            () => Card(
                              child: ListTile(
                                leading: Checkbox(
                                  value: controller.selectedTaskIds.contains(
                                      controller.reportTasks[index].taskId),
                                  onChanged: (bool? value) {
                                    if (value != null) {
                                      if (value) {
                                        controller.selectedTaskIds.add(
                                            controller.reportTasks[index]
                                                    .taskId ??
                                                '');
                                      } else {
                                        controller.selectedTaskIds.remove(
                                            controller
                                                .reportTasks[index].taskId);
                                      }
                                    }
                                  },
                                ),
                                title: Text(
                                  controller.reportTasks[index].taskTitle ??
                                      'title',
                                ),
                                subtitle: Text(
                                  controller.reportTasks[index].deadLine ??
                                      'deadLine',
                                  style: textThinStyle1,
                                ),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Created by',
                                    ),
                                    Text(
                                      controller.reportTasks[index].createdBy ??
                                          'createdBy',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
              EventButton(
                text: 'Confirm to generate report',
                onTap: () {
                  Navigator.of(context).pop();
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Container(
                          width: double.infinity.w,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            border: Border.all(color: neonShade),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Center(
                                        child: Text(
                                          'Select fields for\ngenerating a report',
                                          style: TextStyle(
                                              fontSize: 18, color: neonShade),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.close,
                                          color: neonShade),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Close the dialog
                                      },
                                    ),
                                  ],
                                ),
                                adjustHieght(10.h),
                                _buildCheckboxColumn('Select fields', [
                                  Row(
                                    children: [
                                      _buildCheckbox(
                                          'Created by',
                                          'created_by',
                                          controller.selectedFields,
                                          controller.addField),
                                      _buildCheckbox(
                                          'Title',
                                          'title',
                                          controller.selectedFields,
                                          controller.addField),
                                    ],
                                  ),
                                  _buildCheckbox(
                                      'Description',
                                      'description',
                                      controller.selectedFields,
                                      controller.addField),
                                  _buildCheckbox(
                                      'Priority Level',
                                      'priority_level',
                                      controller.selectedFields,
                                      controller.addField),
                                  _buildCheckbox(
                                      'Recurrent Task',
                                      'recurrent_task',
                                      controller.selectedFields,
                                      controller.addField),
                                  Row(
                                    children: [
                                      _buildCheckbox(
                                          'Completed',
                                          'is_completed',
                                          controller.selectedFields,
                                          controller.addField),
                                      _buildCheckbox(
                                          'Deadline',
                                          'dead_line',
                                          controller.selectedFields,
                                          controller.addField),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      _buildCheckbox(
                                          'Killed',
                                          'is_killed',
                                          controller.selectedFields,
                                          controller.addField),
                                      _buildCheckbox(
                                          'Tags',
                                          'tags',
                                          controller.selectedFields,
                                          controller.addField),
                                    ],
                                  ),
                                  _buildCheckbox(
                                      'Assigned To',
                                      'assigned_to',
                                      controller.selectedFields,
                                      controller.addField),
                                  _buildCheckbox(
                                      'Created At',
                                      'created_at',
                                      controller.selectedFields,
                                      controller.addField),
                                ]),
                                adjustHieght(10.h),
                                const Text('Select report type',
                                    style: TextStyle(
                                        fontSize: 18, color: neonShade)),
                                adjustHieght(10.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _buildReportTypeButton(
                                        'PDF',
                                        'pdf',
                                        controller.selectedReportType.value,
                                        controller.setReportType),
                                    adjustWidth(10.w),
                                    _buildReportTypeButton(
                                        'Excel',
                                        'excel',
                                        controller.selectedReportType.value,
                                        controller.setReportType),
                                  ],
                                ),
                                adjustHieght(20.h),
                                Center(
                                  child: EventButton(
                                    wdth: kwidth * 0.9,
                                    text: 'Generate Report',
                                    onTap: () async {
                                      controller.generateReport(
                                        generateReportModel:
                                            GenearateReportModel(
                                          fields: controller.selectedFields,
                                          reportType: controller
                                              .selectedReportType.value,
                                          taskIds: controller.selectedTaskIds,
                                        ),
                                      );

                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                wdth: double.infinity,
              ),
              adjustHieght(15.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheckboxColumn(String title, List<Widget> checkboxes) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: checkboxes,
    );
  }

  Widget _buildCheckbox(String label, String value,
      RxList<String> selectedOptions, Function(String) onChanged) {
    return Obx(
      () => Row(
        children: [
          Checkbox(
            side: const BorderSide(color: neonShade),
            value: selectedOptions.contains(value),
            onChanged: (newValue) {
              if (newValue != null) {
                onChanged(value);
              }
            },
            checkColor: neonShade,
            activeColor: kwhite,
          ),
          Text(label, style: const TextStyle(color: kwhite)),
        ],
      ),
    );
  }

  Widget _buildReportTypeButton(String label, String value, String selectedType,
      Function(String) onChanged) {
    return ElevatedButton(
      onPressed: () => onChanged(value),
      style: ElevatedButton.styleFrom(
        backgroundColor: selectedType == value ? neonShade : lightGrey,
      ),
      child: Text(
        label,
        style: const TextStyle(color: kwhite),
      ),
    );
  }
}