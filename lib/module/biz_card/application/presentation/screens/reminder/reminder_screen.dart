import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final GlobalKey<FormState> reminderKey = GlobalKey<FormState>();

class ScreenCardReminderCreating extends StatefulWidget {
  const ScreenCardReminderCreating({super.key, this.connectionId, this.cardId});

  final String? connectionId;
  final String? cardId;
  //final Reminders? reminder;

  @override
  State<ScreenCardReminderCreating> createState() =>
      _ScreenCardReminderCreatingState();
}

class _ScreenCardReminderCreatingState
    extends State<ScreenCardReminderCreating> {
  String time = '';
  String date = '';
  bool showError = false;

  // @override
  // void initState() {
  //   if (widget.reminder != null) {
  //     time = widget.reminder?.time ?? '';
  //     date = widget.reminder?.date ?? '';
  //     context.read<ReminderBloc>().labelController.text =
  //         widget.reminder?.meetingLabel ?? '';
  //     context.read<ReminderBloc>().venueController.text =
  //         widget.reminder?.venue ?? '';
  //     context.read<ReminderBloc>().occationController.text =
  //         widget.reminder?.occation ?? '';
  //     context.read<ReminderBloc>().messageController.text =
  //         widget.reminder?.message ?? '';
  //   }
  //   super.initState();
  // }

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
          icon: const Icon(Icons.arrow_back_ios, size: 17),
        ),
        title: const Text('Reminder'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Form(
            key: reminderKey,
            child: Column(
              children: [
                CustomTextFormField(
                  validate: Validate.notNull,
                  suffixIcon: Icon(
                    Icons.edit_outlined,
                    color: kwhite.withOpacity(0.5),
                  ),
                  labelText: 'Write Meeting Label',
                  textCapitalization: TextCapitalization.words,
                  maxlegth: 100,
                  //controller: context.read<ReminderBloc>().labelController,
                  inputType: TextInputType.text,
                ),
                CustomTextFormField(
                    validate: Validate.notNull,
                    suffixIcon: Icon(
                      Icons.edit_outlined,
                      color: kwhite.withOpacity(0.5),
                    ),
                    labelText: 'Venue',
                    textCapitalization: TextCapitalization.words,
                    maxlegth: 100,
                    //controller: context.read<ReminderBloc>().venueController,
                    inputType: TextInputType.text),
                CustomTextFormField(
                  validate: Validate.notNull,
                  suffixIcon: Icon(
                    Icons.edit_outlined,
                    color: kwhite.withOpacity(0.5),
                  ),
                  labelText: 'Occasion',
                  textCapitalization: TextCapitalization.words,
                  maxlegth: 100,
                  //controller: context.read<ReminderBloc>().occationController,
                  inputType: TextInputType.text,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 5),
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
                        style: textHeadStyle1.copyWith(
                            fontWeight: FontWeight.w500,
                            color: klightgrey,
                            fontSize: 12.sp),
                      ),
                      kHeight5,
                      const CustomTextFormField(
                        // controller:
                        //     context.read<ReminderBloc>().messageController,
                        validate: Validate.notNull,
                        labelText: 'write here',
                        textCapitalization: TextCapitalization.sentences,
                        maxLines: 3,
                        maxlegth: 300,
                      ),
                    ],
                  ),
                ),
                kHeight10,
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: klightGreyClr,
                    border: date == '' && showError
                        ? Border.all(color: kred)
                        : null,
                    borderRadius: const BorderRadius.all(
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
                          fontSize: date == '' ? 11.sp : 12.sp,
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
                      lastDate:
                          DateTime.now().add(const Duration(days: 365 * 100)),
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
                        context: context, initialTime: TimeOfDay.now());
                    if (selectedTime != null) {
                      setState(() {
                        time =
                            '${'${selectedTime.hour}'.length == 1 ? '0${selectedTime.hour}' : selectedTime.hour}:${'${selectedTime.minute}'.length == 1 ? '0${selectedTime.minute}' : selectedTime.minute}';
                      });
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: klightGreyClr,
                      border: time == '' && showError
                          ? Border.all(color: kred)
                          : null,
                      borderRadius: const BorderRadius.all(
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
                              fontSize: time == '' ? 11.sp : 12.sp),
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
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          // if (reminderKey.currentState!.validate()) {
                          //   if (date == '') {
                          //     setState(() {
                          //       showError = true;
                          //     });
                          //     showSnackbar(context,
                          //         message: 'Choose date to continue');
                          //   } else if (time == '') {
                          //     setState(() {
                          //       showError = true;
                          //     });
                          //     showSnackbar(context,
                          //         message: 'Choose time to continue');
                          //   } else {
                          //     setState(() {
                          //       showError = false;
                          //     });
                          //     final model = CreateReminderModel(
                          //         cardId: widget.cardId,
                          //         connectionId: widget.connectionId,
                          //         date: date,
                          //         time: time,
                          //         meetingLabel: context
                          //             .read<ReminderBloc>()
                          //             .labelController
                          //             .text
                          //             .trim(),
                          //         message: context
                          //             .read<ReminderBloc>()
                          //             .messageController
                          //             .text
                          //             .trim(),
                          //         occation: context
                          //             .read<ReminderBloc>()
                          //             .occationController
                          //             .text
                          //             .trim(),
                          //         venue: context
                          //             .read<ReminderBloc>()
                          //             .venueController
                          //             .text
                          //             .trim());
                          //     if (widget.reminder == null) {
                          //       context.read<ReminderBloc>().add(
                          //           ReminderEvent.createReminder(
                          //               createReminderModel: model));
                          //     } else {
                          //       final data = model.copyWith(
                          //           cardId: widget.reminder!.cardId,
                          //           id: widget.reminder!.id,
                          //           connectionId:
                          //               widget.reminder!.connectionId);
                          //       context.read<ReminderBloc>().add(
                          //             ReminderEvent.editReminder(
                          //               createReminderModel: data,
                          //             ),
                          //           );
                          //     }
                          //   }
                          // }
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
