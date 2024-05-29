import 'package:bizkit/module/task/application/presentation/screens/generate_report/widgets/date_container.dart';
import 'package:bizkit/module/task/application/presentation/screens/generate_report/widgets/drop_down_list.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenTaskReportGenerator extends StatefulWidget {
  const ScreenTaskReportGenerator({super.key});

  @override
  _ScreenTaskReportGeneratorState createState() =>
      _ScreenTaskReportGeneratorState();
}

class _ScreenTaskReportGeneratorState extends State<ScreenTaskReportGenerator> {
  bool othersToSelf = false;
  bool selfToOthers = false;
  bool selfToSelf = false;
  bool personal = false;
  bool social = false;
  bool critical = false;
  bool medium = false;
  String? selectedTaskFrom;

  String selectedOptionCategory = '';
  String selectedTaskType = '';
  String selectedPriorityType = '';

  void _handleCategoryChange(String newValue) {
    setState(() {
      selectedOptionCategory = newValue;
    });
  }

  void _handleTaskTypeChange(String newValue) {
    setState(() {
      selectedTaskType = newValue;
    });
  }

  void _handlePriorityTypeChange(String newValue) {
    setState(() {
      selectedPriorityType = newValue;
    });
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
              _buildCheckbox(
                  'Social', 'Social', selectedTaskType, _handleTaskTypeChange),
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
            const GenerateReportDropDownButton(),
            adjustHieght(20.h),
            Center(
              child: EventButton(
                wdth: kwidth * 98,
                text: 'Generate',
                onTap: () {
                  Navigator.pop(context);
                },
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

  Widget _buildCheckbox(String label, String currentValue,
      String selectedOption, Function(String) onChanged) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          side: const BorderSide(color: neonShade),
          value: selectedOption == currentValue,
          onChanged: (newValue) {
            if (newValue != null && newValue) {
              onChanged(currentValue);
            } else {
              onChanged('');
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
