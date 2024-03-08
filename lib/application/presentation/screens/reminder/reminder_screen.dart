import 'package:bizkit/application/business_logic/reminder/reminder_bloc.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/domain/model/reminders/create_reminder_model/create_reminder_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final GlobalKey<FormState> reminderKey = GlobalKey<FormState>();

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
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Form(
            key: reminderKey,
            child: Column(
              children: [
                TTextFormField(
                    validate: Validate.notNull,
                    suffix: Icon(
                      Icons.edit_outlined,
                      color: kwhite.withOpacity(0.5),
                    ),
                    text: 'Write Meeting Label',
                    maxlegth: 100,
                    controller: context.read<ReminderBloc>().labelController,
                    inputType: TextInputType.text),
                TTextFormField(
                    validate: Validate.notNull,
                    suffix: Icon(
                      Icons.edit_outlined,
                      color: kwhite.withOpacity(0.5),
                    ),
                    text: 'Venue',
                    maxlegth: 100,
                    controller: context.read<ReminderBloc>().venueController,
                    inputType: TextInputType.text),
                TTextFormField(
                    validate: Validate.notNull,
                    suffix: Icon(
                      Icons.edit_outlined,
                      color: kwhite.withOpacity(0.5),
                    ),
                    text: 'Occation',
                    maxlegth: 100,
                    controller: context.read<ReminderBloc>().occationController,
                    inputType: TextInputType.text),
                Container(
                  padding: const EdgeInsets.only(top: 5),
                  // height: kwidth * 0.3,
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
                      TTextFormField(
                        controller:
                            context.read<ReminderBloc>().messageController,
                        text: 'write here',
                        maxLines: 3,
                        maxlegth: 300,
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
                          date = '${dates.year}-${dates.month}-${dates.day}';
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
                            fontSize:
                                time == '' ? kwidth * 0.03 : kwidth * 0.04,
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
                      child: InkWell(
                        onTap: () => Navigator.of(context).pop(),
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
                    ),
                    adjustWidth(kwidth * 0.10),
                    BlocListener<ReminderBloc, ReminderState>(
                      listenWhen: (previous, current) => current.reminderAdded,
                      listener: (context, state) {
                        if (state.reminderAdded) {
                          date = '';
                          time = '';
                          showSnackbar(context,
                              message: 'Reminder Created Successfully');
                          Navigator.of(context).pop();
                        }
                      },
                      child: Expanded(
                        child: InkWell(
                          onTap: () {
                            if (reminderKey.currentState!.validate()) {
                              if (date == '') {
                                showSnackbar(context,
                                    message: 'choose date to continue');
                              } else if (time == '') {
                                showSnackbar(context,
                                    message: 'choose time to continue');
                              } else {
                                context.read<ReminderBloc>().add(
                                    ReminderEvent.createReminder(
                                        createReminderModel:
                                            CreateReminderModel(
                                                cardId: widget.cardId,
                                                connectionId:
                                                    widget.connectionId,
                                                date: date,
                                                time: time,
                                                meetingLabel: context
                                                    .read<ReminderBloc>()
                                                    .labelController
                                                    .text
                                                    .trim(),
                                                message: context
                                                    .read<ReminderBloc>()
                                                    .messageController
                                                    .text
                                                    .trim(),
                                                occation: context
                                                    .read<ReminderBloc>()
                                                    .occationController
                                                    .text
                                                    .trim(),
                                                venue: context
                                                    .read<ReminderBloc>()
                                                    .venueController
                                                    .text
                                                    .trim())));
                              }
                            }
                          },
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
                        ),
                      ),
                    )
                  ],
                ),
                adjustHieght(kwidth * 0.10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
