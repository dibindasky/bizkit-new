import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/generate_report/widgets/date_container.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bizkit/module/task/domain/model/dashboard/generate_task_report_model/generate_task_report_model.dart';

class ScreenTaskReportGenerator extends StatefulWidget {
  const ScreenTaskReportGenerator({super.key});

  @override
  _ScreenTaskReportGeneratorState createState() =>
      _ScreenTaskReportGeneratorState();
}

class _ScreenTaskReportGeneratorState extends State<ScreenTaskReportGenerator> {
  final TaskHomeScreenController _controller =
      Get.put(TaskHomeScreenController());

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

  void _generateReport() async {
    // Create the report model with the selected values
    GenerateTaskReportModel reportModel = GenerateTaskReportModel(
      priorityLevel:
          selectedPriorityType.isNotEmpty ? selectedPriorityType : null,
      taskMentionedType: selectedTaskType.isNotEmpty ? selectedTaskType : null,
      taskType:
          selectedOptionCategory.isNotEmpty ? selectedOptionCategory : null,
      fromDate: '2024-01-01', // Replace with actual date if available
      toDate: '2024-12-31', // Replace with actual date if available
    );

    // Call the generateTaskReport function
    _controller.generateTaskReport(genearteTaskReport: reportModel);
    Navigator.pop(context);

    // Display the report if available
    if (_controller.taskReport.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Task Report'),
            content: Text(_controller.taskReport.value),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
    } else {
      // Optionally, show an error message if no report is available
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('No report available. Please try again.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: khieght * 0.6,
        child: ListView(
          children: [
            const Text(
              'Generate report for your tasks',
              style: TextStyle(fontSize: 18, color: neonShade),
            ),
            adjustHieght(8.h),
            const Text(
              'Identify the problem which is affecting the task progress by getting a detailed report',
              style: TextStyle(color: klightgrey),
            ),
            adjustHieght(16.h),
            _buildCheckboxRow('Select the reports you want to generate', [
              _buildCheckbox('Others to self', 'Others to self',
                  selectedOptionCategory, _handleCategoryChange),
              _buildCheckbox('Self to others', 'Self to others',
                  selectedOptionCategory, _handleCategoryChange),
              _buildCheckbox('Self to Self', 'Self to Self',
                  selectedOptionCategory, _handleCategoryChange),
            ]),
            _buildCheckboxRow('Select the Task type', [
              _buildCheckbox('Personal', 'Personal', selectedTaskType,
                  _handleTaskTypeChange),
              _buildCheckbox('Official', 'Official', selectedTaskType,
                  _handleTaskTypeChange),
              _buildCheckbox(
                  'Others', 'Others', selectedTaskType, _handleTaskTypeChange),
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
            DateContainer(),
            adjustHieght(8.h),
            // GenerateReportDropDownButton(),
            adjustHieght(20.h),
            Center(
              child: EventButton(
                wdth: kwidth * 98,
                text: 'Generate',
                onTap: _generateReport,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckboxRow(String title, List<Widget> checkboxes) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: kwhite)),
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
    );
  }
}
