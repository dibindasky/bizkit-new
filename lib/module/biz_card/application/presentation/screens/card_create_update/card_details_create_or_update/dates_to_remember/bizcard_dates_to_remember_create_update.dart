import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/card/personal_details.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/bottom_sheets/date_bottom_sheet.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class BizcardDatesToRememberCreateUpdateScreen extends StatefulWidget {
  const BizcardDatesToRememberCreateUpdateScreen({super.key});

  //final int cardId;

  @override
  State<BizcardDatesToRememberCreateUpdateScreen> createState() =>
      _BizcardDatesToRememberCreateUpdateScreenState();
}

class _BizcardDatesToRememberCreateUpdateScreenState
    extends State<BizcardDatesToRememberCreateUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    final personalController = Get.find<PersonalDetailsController>();
    final cardController = Get.find<CardController>();
    return GestureDetector(
      onTap: () {
        FocusScopeNode focusScopeNode = FocusScope.of(context);
        if (!focusScopeNode.hasPrimaryFocus) {
          focusScopeNode.unfocus();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kHeight10,
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).pop();
                        },
                        child: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.onPrimary,
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            size: 15.sp,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                        ),
                      ),
                      kWidth10,
                      Text('Date to remember',
                          style: Theme.of(context).textTheme.displayMedium)
                    ],
                  ),
                  kHeight20,
                  Text('Select Date',
                      style: Theme.of(context).textTheme.displayMedium),
                  kHeight10,
                  InkWell(
                    onTap: () => showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return DatePickingBottomSheet(
                          year: 500,
                          last: 500,
                          onPressed: (date) {
                            setState(() {
                              personalController
                                  .personalDatesToReminderDate.text = date;
                            });
                            Navigator.pop(context);
                          },
                          datePicker:
                              personalController.personalDatesToReminderDate,
                        );
                      },
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(left: 10, right: 12),
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).colorScheme.secondary),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              personalController
                                      .personalDatesToReminderDate.text.isEmpty
                                  ? 'Choose Date'
                                  : personalController
                                      .personalDatesToReminderDate.text,
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ),
                          Icon(Icons.calendar_month,
                              color: Theme.of(context).colorScheme.surface),
                        ],
                      ),
                    ),
                  ),
                  kHeight20,
                  Text('Message  *',
                      style: Theme.of(context).textTheme.displayMedium),
                  kHeight10,
                  CustomTextFormField(
                    textCapitalization: TextCapitalization.sentences,
                    maxlegth: 250,
                    maxLines: 7,
                    labelText: 'Write your message here',
                    controller:
                        personalController.personalDatesToReminderMessage,
                  ),
                  kHeight40,
                  Center(
                    child: Obx(
                      () {
                        if (personalController.isLoading.value) {
                          return const LoadingAnimation();
                        }
                        return EventButton(
                          text: 'Add',
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            if (personalController
                                    .personalDatesToReminderDate.text.isEmpty ||
                                personalController
                                    .personalDatesToReminderMessage
                                    .text
                                    .isEmpty) {
                              showSnackbar(context,
                                  message: personalController
                                          .personalDatesToReminderDate
                                          .text
                                          .isEmpty
                                      ? 'Choose Date For Reminder'
                                      : 'Enter Message',
                                  backgroundColor: kred);
                              return;
                            }
                            personalController.personalDatesToRemiderAdding(
                                context: context);
                          },
                        );
                      },
                    ),
                  ),
                  kHeight40,
                  Obx(
                    () => personalController.deleteLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : Wrap(
                            children: List.generate(
                              (cardController
                                      .bizcardDetail
                                      .value
                                      .personalDetails
                                      ?.datesToRemember
                                      ?.length ??
                                  0),
                              (index) {
                                return Stack(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.all(8),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 8),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: neonShade),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              cardController
                                                      .bizcardDetail
                                                      .value
                                                      .personalDetails
                                                      ?.datesToRemember?[index]
                                                      .description ??
                                                  '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall),
                                          kHeight5,
                                          Text(
                                              DateTimeFormater
                                                  .getDateByDayMonthYear(
                                                      cardController
                                                              .bizcardDetail
                                                              .value
                                                              .personalDetails
                                                              ?.datesToRemember?[
                                                                  index]
                                                              .date ??
                                                          ''),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall?.copyWith(fontSize: 12.sp)),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      top: 0,
                                      child: InkWell(
                                        onTap: () {
                                          showCustomConfirmationDialogue(
                                              context: context,
                                              title:
                                                  'Are you sure want to delete this Date to Reminder?',
                                              buttonText: 'Delete',
                                              onTap: () {
                                                personalController
                                                    .personalDatesToReminderDelete(
                                                        context: context,
                                                        index);
                                              });
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: ColoredBox(
                                            color: neonShade,
                                            child: Padding(
                                              padding: const EdgeInsets.all(5),
                                              child:
                                                  Icon(Icons.close, size: 12.w),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                  ),
                  kHeight20
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}