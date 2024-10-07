import 'dart:developer';

import 'package:bizkit/module/biz_card/application/controller/reminder/reminder_controller.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/create_reminder_model/create_reminder_model.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/reminders_success_responce/reminder.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/update_reminder_model/update_reminder_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:bizkit/utils/time_format/time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

final GlobalKey<FormState> reminderKey = GlobalKey<FormState>();

class ScreenCardReminderCreating extends StatefulWidget {
  const ScreenCardReminderCreating(
      {super.key, this.connectionId, this.cardId, this.reminder});

  final String? connectionId;
  final String? cardId;
  final Reminder? reminder;

  @override
  State<ScreenCardReminderCreating> createState() =>
      _ScreenCardReminderCreatingState();
}

class _ScreenCardReminderCreatingState
    extends State<ScreenCardReminderCreating> {
  String time = '';
  String date = '';
  bool showError = false;
  DateTime dates = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();

  @override
  void initState() {
    if (widget.reminder != null) {
      final reminderController = Get.find<ReminderController>();
      time = DateTimeFormater.extractTime(widget.reminder?.reminderDate ?? '');
      date = DateTimeFormater.formatYearMonthDate(
          widget.reminder?.reminderDate ?? '');
      reminderController.meetingLabelController.text =
          widget.reminder?.meetingLabel ?? '';
      reminderController.venueController.text = widget.reminder?.venue ?? '';
      reminderController.occasionController.text =
          widget.reminder?.occasion ?? '';
      reminderController.messageController.text =
          widget.reminder?.description ?? '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final reminderController = Get.find<ReminderController>();
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        forceMaterialTransparency: false,
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
                  textCapitalization: TextCapitalization.sentences,
                  maxlegth: 100,
                  controller: reminderController.meetingLabelController,
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
                    controller: reminderController.venueController,
                    textCapitalization: TextCapitalization.sentences,
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
                  controller: reminderController.occasionController,
                  textCapitalization: TextCapitalization.sentences,
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
                      CustomTextFormField(
                        controller: reminderController.messageController,
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
                          dates = dates;
                          date = DateTimeFormater.formatYearMonthDate(
                              dates.toString());
                          '${dates.year}-${dates.month}-${dates.day}';
                        });
                      },
                    ),
                  ),
                ),
                kHeight10,
                InkWell(
                  onTap: () async {
                    final selectedTime = await showTimePicker(
                        context: context, initialTime: TimeOfDay.now());
                    if (selectedTime != null) {
                      setState(() {
                        time =
                            '${'${selectedTime.hour}'.length == 1 ? '0${selectedTime.hour}' : selectedTime.hour}:${'${selectedTime.minute}'.length == 1 ? '0${selectedTime.minute}' : selectedTime.minute}';
                        timeOfDay = selectedTime;
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
                          time == '' ? 'Choose Time' : time,
                          style: TextStyle(
                              color: time == '' ? klightgrey : kwhite,
                              fontSize: time == '' ? 11.sp : 12.sp),
                        ),
                        const Icon(Icons.alarm_add_sharp, color: neonShade)
                      ],
                    ),
                  ),
                ),
                kHeight20,
                Obx(() {
                  if (reminderController.createReminderLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Row(
                    children: [
                      kWidth50,
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
                            if (date == '') {
                              setState(() {
                                showError = true;
                              });
                              showSnackbar(context,
                                  message: 'Choose date to continue');
                            } else if (time == '') {
                              setState(() {
                                showError = true;
                              });
                              showSnackbar(context,
                                  message: 'Choose time to continue');
                            } else {
                              setState(() {
                                showError = false;
                              });
                              if (reminderKey.currentState!.validate()) {
                                widget.reminder?.id == null
                                    ? reminderController.createReminder(
                                        createReminderModel: CreateReminderModel(
                                            bizcardId: widget.cardId,
                                            description: reminderController
                                                .messageController.text,
                                            meetingLabel: reminderController
                                                .meetingLabelController.text,
                                            occasion: reminderController
                                                .occasionController.text,
                                            reminderDate: DateTime(dates.year, dates.month, dates.day)
                                                .add(Duration(
                                                    hours: timeOfDay.hour,
                                                    minutes: timeOfDay.minute))
                                                .toUtc()
                                                .toString(),
                                            venue: reminderController
                                                .venueController.text),
                                        context: context)
                                    : reminderController.updateReminder(
                                        updateReminderModel: UpdateReminderModel(bizcardId: widget.cardId, reminderId: widget.reminder!.id, description: reminderController.messageController.text, meetingLabel: reminderController.meetingLabelController.text, occasion: reminderController.occasionController.text, reminderDate: dates.add(Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute)).toUtc().toString(), venue: reminderController.venueController.text),
                                        context: context);
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
                            child: Center(
                              child: FittedBox(
                                  child: Text(widget.reminder?.id == null
                                      ? 'Save & Notify'
                                      : 'Update and notify')),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }),
                adjustHieght(kwidth * 0.10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
