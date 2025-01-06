import 'package:bizkit/module/biz_card/application/controller/reminder/reminder_controller.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/create_reminder_model/create_reminder_model.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/reminders_success_responce/reminder.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/update_reminder_model/update_reminder_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<FormState> reminderKey = GlobalKey<FormState>();

class BizcardReminderCreateUpdateScreen extends StatefulWidget {
  const BizcardReminderCreateUpdateScreen(
      {super.key, this.connectionId, this.cardId, this.reminder});

  final String? connectionId;
  final String? cardId;
  final Reminder? reminder;

  @override
  State<BizcardReminderCreateUpdateScreen> createState() =>
      _BizcardReminderCreateUpdateScreenState();
}

class _BizcardReminderCreateUpdateScreenState
    extends State<BizcardReminderCreateUpdateScreen> {
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).pop(context);
                      },
                      child: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 18.sp,
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                      ),
                    ),
                    adjustWidth(20.w),
                    Text(
                      'Reminders',
                      style: Theme.of(context).textTheme.displayMedium,
                    )
                  ],
                ),
                adjustHieght(20.h),
                Form(
                  key: reminderKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        validate: Validate.notNull,
                        suffixIcon: const Icon(
                          Icons.edit_outlined,
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
                          suffixIcon: const Icon(
                            Icons.edit_outlined,
                          ),
                          labelText: 'Venue',
                          controller: reminderController.venueController,
                          textCapitalization: TextCapitalization.sentences,
                          maxlegth: 100,
                          //controller: context.read<ReminderBloc>().venueController,
                          inputType: TextInputType.text),
                      CustomTextFormField(
                        validate: Validate.notNull,
                        suffixIcon: const Icon(
                          Icons.edit_outlined,
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
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(7),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Message',
                              style: Theme.of(context).textTheme.displaySmall,
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
                              maxlegth: 150,
                            ),
                          ],
                        ),
                      ),
                      kHeight10,
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CalendarDatePicker(
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.now()
                                        .add(const Duration(days: 365 * 100)),
                                    onDateChanged: (dates) {
                                      setState(() {
                                        dates = dates;
                                        date = DateTimeFormater
                                            .formatYearMonthDate(
                                                dates.toString());
                                        '${dates.year}-${dates.month}-${dates.day}';
                                      });
                                    },
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      OutlinedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text(
                                          'Cancel',
                                        ),
                                      ),
                                      adjustWidth(20),
                                      OutlinedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text(
                                          'Ok',
                                        ),
                                      ),
                                      adjustWidth(20)
                                    ],
                                  ),
                                  adjustHieght(15.h)
                                ],
                              );
                            },
                          );
                        },
                        child: Card(
                          elevation: 0,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
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
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                                const Icon(
                                  Icons.calendar_month_outlined,
                                  color: neonShade,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      // ClipRRect(
                      //   borderRadius:
                      //       const BorderRadius.all(Radius.circular(8)),
                      //   child: ColoredBox(
                      //     color: kwhite.withOpacity(0.05),
                      //     child: CalendarDatePicker(
                      //       initialDate: widget.reminder?.id == null
                      //           ? DateTime.now()
                      //           : DateTime.parse(date),
                      //       firstDate: DateTime.now(),
                      //       lastDate: DateTime.now()
                      //           .add(const Duration(days: 365 * 100)),
                      //       onDateChanged: (dates) {
                      //         setState(() {
                      //           dates = dates;
                      //           date = DateTimeFormater.formatYearMonthDate(
                      //               dates.toString());
                      //           '${dates.year}-${dates.month}-${dates.day}';
                      //         });
                      //       },
                      //     ),
                      //   ),
                      // ),
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
                        child: Card(
                          elevation: 0,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
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
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                                const Icon(Icons.alarm_add_sharp,
                                    color: neonShade)
                              ],
                            ),
                          ),
                        ),
                      ),
                      kHeight20,
                      Obx(() {
                        if (reminderController.createReminderLoading.value) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () => GoRouter.of(context).pop(context),
                                child: Card(
                                  elevation: 1,
                                  child: Container(
                                    height: kwidth * 0.1,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: neonShade),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    child: Center(
                                        child: Text(
                                      'Cancel',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    )),
                                  ),
                                ),
                              ),
                            ),
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
                                                  meetingLabel:
                                                      reminderController
                                                          .meetingLabelController
                                                          .text,
                                                  occasion: reminderController
                                                      .occasionController.text,
                                                  reminderDate: DateTime(dates.year, dates.month, dates.day)
                                                      .add(Duration(
                                                          hours: timeOfDay.hour,
                                                          minutes:
                                                              timeOfDay.minute))
                                                      .toUtc()
                                                      .toString(),
                                                  venue: reminderController.venueController.text),
                                              context: context)
                                          : reminderController.updateReminder(updateReminderModel: UpdateReminderModel(bizcardId: widget.cardId, reminderId: widget.reminder!.id, description: reminderController.messageController.text, meetingLabel: reminderController.meetingLabelController.text, occasion: reminderController.occasionController.text, reminderDate: dates.add(Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute)).toUtc().toString(), venue: reminderController.venueController.text), context: context);
                                    }
                                  }
                                },
                                child: Card(
                                  elevation: 1,
                                  child: Container(
                                    height: kwidth * 0.1,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: neonShade),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: Center(
                                      child: FittedBox(
                                          child: Text(
                                        widget.reminder?.id == null
                                            ? 'Save & Notify'
                                            : 'Update and notify',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                      )),
                                    ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
