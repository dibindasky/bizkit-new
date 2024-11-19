import 'dart:developer';

import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/generate_report/generate_report.dart';
import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/generate_report/widgets/date_container.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_textfrom_fireld.dart';
import 'package:bizkit/module/task/domain/model/dashboard/get_report_model/get_report_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ScreenTaskReportGenerator extends StatefulWidget {
  const ScreenTaskReportGenerator({super.key});

  @override
  _ScreenTaskReportGeneratorState createState() =>
      _ScreenTaskReportGeneratorState();
}

class _ScreenTaskReportGeneratorState extends State<ScreenTaskReportGenerator> {
  final TaskHomeScreenController controller =
      Get.find<TaskHomeScreenController>();
  final taskController = Get.find<CreateTaskController>();
  final taskGenerateReportController = Get.find<TaskGenerateReportController>();
  final TextEditingController searchController = TextEditingController();
  List<String> selectedOptionCategory = [];
  List<String> selectedTaskType = [];
  List<String> selectedPriorityType = [];

  void _handleCategoryChange(String value) {
    setState(() {
      if (selectedOptionCategory.contains(value)) {
        selectedOptionCategory.remove(value);
      } else {
        selectedOptionCategory.add(value);
      }
    });
  }

  void _handleTaskTypeChange(String value) {
    setState(() {
      if (selectedTaskType.contains(value)) {
        selectedTaskType.remove(value);
      } else {
        selectedTaskType.add(value);
      }
    });
  }

  void _handlePriorityTypeChange(String value) {
    setState(() {
      if (selectedPriorityType.contains(value)) {
        selectedPriorityType.remove(value);
      } else {
        selectedPriorityType.add(value);
      }
    });
  }

  void _getReport() async {
    List<String> formattedPriorityType = selectedPriorityType.map((type) {
      switch (type) {
        case 'High':
          return 'high';
        case 'Medium':
          return 'medium';
        case 'Low':
          return 'low';
        default:
          return type;
      }
    }).toList();

    List<String> formattedOptionCategory = selectedOptionCategory.map((type) {
      switch (type) {
        case 'Self to self':
          return 'self_to_self';
        case 'Others to self':
          return 'others_to_self';
        case 'Self to others':
          return 'self_to_others';
        default:
          return type;
      }
    }).toList();

    List<String> formattedTaskTypes = selectedTaskType.map((type) {
      switch (type) {
        case 'Personal':
          return 'personal';
        case 'Official':
          return 'official';
        case 'Others':
          return 'others';
        default:
          return type;
      }
    }).toList();
    if (formattedPriorityType.isEmpty ||
        formattedTaskTypes.isEmpty ||
        formattedOptionCategory.isEmpty ||
        taskGenerateReportController.fromDate.text.isEmpty) {
      log('message');
      // Get.snackbar('Failed', 'Please select any of the Fields');
      showSnackbar(context,
          message: 'Please select any of the Fields', backgroundColor: kred);
      return;
    } else {
      log('getreport print');
      controller.getReport(
        getReportModel: GetReportModel(
            fromDate: taskGenerateReportController.fromDate.text,
            toDate: taskGenerateReportController.toDate.text,
            priorityLevel: formattedPriorityType,
            taskMentionedType: formattedTaskTypes,
            taskType: formattedOptionCategory,
            searchTerm: searchController.text),
      );
      taskGenerateReportController.fromDate.clear();
      taskGenerateReportController.toDate.clear();
      Navigator.of(context).pop();
      Get.toNamed(Routes.reportsview, id: 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(
        () => SizedBox(
          width: double.infinity,
          height: khieght * 0.6,
          child: controller.loadingForGetReports.value
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  children: [
                    Text(
                      'Get report for your tasks',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontSize: 18,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    adjustHieght(8.h),
                    Text(
                      'Identify the problem which is affecting the task progress by getting a detailed report',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            color: kGreyNormal,
                          ),
                    ),
                    adjustHieght(16.h),
                    _buildCheckboxRow(
                        'Select the reports you want to generate', [
                      _buildCheckbox('Others to self', 'Others to self',
                          selectedOptionCategory, _handleCategoryChange),
                      _buildCheckbox('Self to others', 'Self to others',
                          selectedOptionCategory, _handleCategoryChange),
                      _buildCheckbox('Self to self', 'Self to self',
                          selectedOptionCategory, _handleCategoryChange),
                    ]),
                    _buildCheckboxRow('Select the Task type', [
                      _buildCheckbox('Personal', 'Personal', selectedTaskType,
                          _handleTaskTypeChange),
                      _buildCheckbox('Official', 'Official', selectedTaskType,
                          _handleTaskTypeChange),
                      _buildCheckbox('Others', 'Others', selectedTaskType,
                          _handleTaskTypeChange),
                    ]),
                    _buildCheckboxRow('Select the Priority type', [
                      _buildCheckbox('High', 'High', selectedPriorityType,
                          _handlePriorityTypeChange),
                      _buildCheckbox('Medium', 'Medium', selectedPriorityType,
                          _handlePriorityTypeChange),
                      _buildCheckbox('Low', 'Low', selectedPriorityType,
                          _handlePriorityTypeChange),
                    ]),
                    adjustHieght(16.h),
                    adjustHieght(8.h),
                    TaskTextField(
                      onTapOutside: () => FocusScope.of(context).unfocus(),
                      onChanged: (value) {
                        taskController.searchTasks();
                      },
                      controller: taskController.taskSearchController,
                      hintText: 'Search with title , des , type etc..',
                      showBorder: true,
                      fillColor: textFieldFillColr,
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Iconsax.search_status, color: kneon),
                      ),
                    ),
                    adjustHieght(10.h),
                    DateContainer(
                      isFromDate: false,
                      title: 'Select date range',
                    ),
                    // GenerateReportDropDownButton(),
                    adjustHieght(20.h),
                    Center(
                      child: EventButton(
                        color: const LinearGradient(colors: [kneon, kneon]),
                        width: kwidth * 98,
                        text: 'Get Report',
                        onTap: _getReport,
                      ),
                    ),
                    adjustHieght(10.h),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildCheckboxRow(String title, List<Widget> checkboxes) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(fontSize: 12)),
        FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: checkboxes,
          ),
        ),
      ],
    );
  }

  Widget _buildCheckbox(String label, String value,
      List<String> selectedOptions, Function(String) onChanged) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          side: const BorderSide(color: kneon),
          value: selectedOptions.contains(value),
          onChanged: (newValue) {
            if (newValue != null) {
              onChanged(value);
            }
          },
          checkColor: kneon,
          activeColor: kwhite,
        ),
        Text(label, style: Theme.of(context).textTheme.displaySmall),
      ],
    );
  }
}
