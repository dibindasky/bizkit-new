import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class PreviewHomeAddReminderScreen extends StatefulWidget {
  const PreviewHomeAddReminderScreen(
      {super.key, required this.connectionId, required this.cardId});

  final int connectionId;
  final int cardId;

  @override
  State<PreviewHomeAddReminderScreen> createState() =>
      _PreviewHomeAddReminderScreenState();
}

class _PreviewHomeAddReminderScreenState
    extends State<PreviewHomeAddReminderScreen> {
  final dateController = TextEditingController();
  String time = '';
  String date = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: knill,
        foregroundColor: kwhite,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: const Text('Alex Adams'),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TTextFormField(
                  suffix: Icon(
                    Icons.edit_outlined,
                    color: kwhite.withOpacity(0.5),
                  ),
                  text: 'Write Meeting Label',
                  controller: TextEditingController(),
                  inputType: TextInputType.text),
              TTextFormField(
                  suffix: Icon(
                    Icons.edit_outlined,
                    color: kwhite.withOpacity(0.5),
                  ),
                  text: 'Venue',
                  controller: TextEditingController(),
                  inputType: TextInputType.text),
              TTextFormField(
                  suffix: Icon(
                    Icons.edit_outlined,
                    color: kwhite.withOpacity(0.5),
                  ),
                  text: 'Occation',
                  controller: TextEditingController(),
                  inputType: TextInputType.text),
              Container(
                padding: const EdgeInsets.all(10),
                height: kwidth * 0.3,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: textFieldFillColr,
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Message',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: klightgrey,
                        fontSize: kwidth * 0.04,
                      ),
                    ),
                    TextField(
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Write here',
                        hintStyle: TextStyle(
                          color: klightgrey,
                          fontSize: kwidth * 0.03,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              adjustHieght(kwidth * 0.03),
              Container(
                padding: const EdgeInsets.all(10),
                height: kwidth * 0.13,
                decoration: const BoxDecoration(
                  color: textFieldFillColr,
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date == '' ? 'Select the Date' : date,
                      style: TextStyle(
                        color: date == '' ? klightgrey : kwhite,
                        fontSize: date == '' ? kwidth * 0.03 : kwidth * 0.04,
                      ),
                    ),
                    const Icon(
                      Icons.calendar_month_outlined,
                      color: neonShade,
                    )
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: ColoredBox(
                  color: kwhite.withOpacity(0.05),
                  child: CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(
                      const Duration(days: 365 * 100),
                    ),
                    onDateChanged: (dates) {
                      setState(() {
                        date = '${dates.day}/${dates.month}/${dates.year}';
                      });
                    },
                  ),
                ),
              ),
              adjustHieght(kwidth * 0.10),
              InkWell(
                onTap: () async {
                  final selectedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (selectedTime != null) {
                    setState(() {
                      time = '${selectedTime.hour}:${selectedTime.minute}';
                    });
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: kwidth * 0.13,
                  decoration: const BoxDecoration(
                    color: textFieldFillColr,
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        time == '' ? 'Choose time' : time,
                        style: TextStyle(
                          color: time == '' ? klightgrey : kwhite,
                          fontSize: time == '' ? kwidth * 0.03 : kwidth * 0.04,
                        ),
                      ),
                      const Icon(
                        Icons.alarm_add_sharp,
                        color: neonShade,
                      )
                    ],
                  ),
                ),
              ),
              adjustHieght(kwidth * 0.10),
              Row(
                children: [
                  adjustWidth(kwidth * 0.30),
                  Expanded(
                    child: Container(
                      height: kwidth * 0.1,
                      decoration: BoxDecoration(
                        border: Border.all(color: neonShade),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: const Center(child: Text('Cancel')),
                    ),
                  ),
                  adjustWidth(kwidth * 0.10),
                  Expanded(
                    child: Container(
                      height: kwidth * 0.1,
                      decoration: const BoxDecoration(
                        color: textFieldFillColr,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: const Center(
                        child: Text('Save & Notify'),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
