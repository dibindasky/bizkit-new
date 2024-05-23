import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ReportGenerator extends StatefulWidget {
  const ReportGenerator({super.key});

  @override
  _ReportGeneratorState createState() => _ReportGeneratorState();
}

class _ReportGeneratorState extends State<ReportGenerator> {
  bool othersToSelf = false;
  bool selfToOthers = false;
  bool selfToSelf = false;
  bool personal = false;
  bool social = false;
  bool critical = false;
  bool medium = false;
  DateTimeRange? dateRange;
  String? selectedTaskFrom;
  final List<String> taskFromOptions = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Text(
          'Generate report for your tasks',
          style: TextStyle(fontSize: 18, color: Colors.tealAccent),
        ),
        adjustHieght(8),
        const Text(
          'Identify the problem which is affecting the task progress by getting a detailed report',
          style: TextStyle(color: Colors.grey),
        ),
        adjustHieght(16),
        _buildCheckboxRow('Select the reports you want to generate', [
          _buildCheckbox('Others to self', othersToSelf, (value) {
            setState(() {
              othersToSelf = value;
            });
          }),
          _buildCheckbox('Self to others', selfToOthers, (value) {
            setState(() {
              selfToOthers = value;
            });
          }),
          _buildCheckbox('Self to Self', selfToSelf, (value) {
            setState(() {
              selfToSelf = value;
            });
          }),
        ]),
        adjustHieght(16),
        _buildCheckboxRow('Select the Task type', [
          _buildCheckbox('Personal', personal, (value) {
            setState(() {
              personal = value;
            });
          }),
          _buildCheckbox('Social', social, (value) {
            setState(() {
              social = value;
            });
          }),
        ]),
        adjustHieght(16),
        _buildCheckboxRow('Priority Type', [
          _buildCheckbox('Critical', critical, (value) {
            setState(() {
              critical = value;
            });
          }),
          _buildCheckbox('Medium', medium, (value) {
            setState(() {
              medium = value;
            });
          }),
        ]),
        adjustHieght(16),
        _buildDateRangePicker(context),
        adjustHieght(16),
        Text('Select the Tasks From', style: TextStyle(color: Colors.grey)),
        adjustHieght(8),
        _buildDropdown(),
        SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {},
          child: Text('Generate'),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16),
            textStyle: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildCheckboxRow(String title, List<Widget> checkboxes) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: Colors.white)),
        adjustHieght(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: checkboxes,
        ),
      ],
    );
  }

  Widget _buildCheckbox(String label, bool value, Function(bool) onChanged) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: value,
          onChanged: (newValue) => onChanged(newValue!),
          checkColor: Colors.teal,
          activeColor: Colors.white,
        ),
        Text(label, style: TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget _buildDateRangePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select Date Range', style: TextStyle(color: Colors.white)),
        adjustHieght(8),
        Row(
          children: [
            ElevatedButton(
              onPressed: () async {
                DateTimeRange? picked = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2025),
                  initialDateRange: dateRange,
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.dark(
                          primary: Colors.teal,
                          onPrimary: Colors.white,
                          surface: Colors.teal,
                          onSurface: Colors.black,
                        ),
                        dialogBackgroundColor: Colors.white,
                      ),
                      child: child!,
                    );
                  },
                );
                if (picked != null && picked != dateRange) {
                  setState(() {
                    dateRange = picked;
                  });
                }
              },
              child: Text('Inline Preview'),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      dateRange == null
                          ? 'Select Date Range'
                          : '${dateRange!.start.toLocal()} - ${dateRange!.end.toLocal()}',
                      style: TextStyle(color: Colors.black),
                    ),
                    Icon(Icons.calendar_today, color: Colors.teal),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDropdown() {
    return DropdownButtonFormField<String>(
      value: selectedTaskFrom,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.teal),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      items: taskFromOptions.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: TextStyle(color: Colors.black)),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          selectedTaskFrom = newValue;
        });
      },
      dropdownColor: Colors.white,
      iconEnabledColor: Colors.teal,
    );
  }
}
