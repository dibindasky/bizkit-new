import 'package:bizkit/application/business_logic/reminder/reminder_bloc.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/domain/model/reminders/create_reminder_model/create_reminder_model.dart';
import 'package:bizkit/domain/model/reminders/get_reminder_model/reminders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final GlobalKey<FormState> reminderKey = GlobalKey<FormState>();

class PreviewHomeAddReminderScreen extends StatefulWidget {
  const PreviewHomeAddReminderScreen(
      {super.key, this.connectionId, this.cardId, this.reminder});

  final int? connectionId;
  final int? cardId;
  final Reminders? reminder;

  @override
  State<PreviewHomeAddReminderScreen> createState() =>
      _PreviewHomeAddReminderScreenState();
}

class _PreviewHomeAddReminderScreenState
    extends State<PreviewHomeAddReminderScreen> {
  String time = '';
  String date = '';

  @override
  void initState() {
    if (widget.reminder != null) {
      time = widget.reminder?.time ?? '';
      date = widget.reminder?.date ?? '';
      context.read<ReminderBloc>().labelController.text =
          widget.reminder?.meetingLabel ?? '';
      context.read<ReminderBloc>().venueController.text =
          widget.reminder?.venue ?? '';
      context.read<ReminderBloc>().occationController.text =
          widget.reminder?.occation ?? '';
      context.read<ReminderBloc>().messageController.text =
          widget.reminder?.message ?? '';
    }
    super.initState();
  }

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
        title: Text(widget.reminder != null
            ? widget.reminder!.name ?? 'Reminder'
            : 'Reminder'),
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
                    text: 'Occasion',
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
                        validate: Validate.notNull,
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
                        time =
                            '${'${selectedTime.hour}'.length == 1 ? '0${selectedTime.hour}' : selectedTime.hour}:${'${selectedTime.minute}'.length == 1 ? '0${selectedTime.minute}' : selectedTime.minute}';
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
                      listenWhen: (previous, current) =>
                          current.reminderAdded || current.reminderUpdated,
                      listener: (context, state) {
                        if (state.reminderAdded || state.reminderUpdated) {
                          date = '';
                          time = '';
                          showSnackbar(context,
                              message: state.reminderUpdated
                                  ? 'Reminder Updated Successfully'
                                  : 'Reminder Created Successfully');
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
                                final model = CreateReminderModel(
                                    cardId: widget.cardId,
                                    connectionId: widget.connectionId,
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
                                        .trim());
                                if (widget.reminder == null) {
                                  context.read<ReminderBloc>().add(
                                      ReminderEvent.createReminder(
                                          createReminderModel: model));
                                } else {
                                  final data = model.copyWith(
                                      cardId: widget.reminder!.cardId,
                                      id: widget.reminder!.id,
                                      connectionId:
                                          widget.reminder!.connectionId);
                                  context.read<ReminderBloc>().add(
                                        ReminderEvent.editReminder(
                                          createReminderModel: data,
                                        ),
                                      );
                                }
                              }
                            }
                          },
                          child: Container(
                            height: kwidth * 0.1,
                            decoration: BoxDecoration(
                              color: textFieldFillColr,
                              border: Border.all(color: neonShade),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: const Center(
                              child: FittedBox(child: Text('Save & Notify')),
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
