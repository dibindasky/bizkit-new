import 'dart:async';

import 'package:bizkit/module/task/application/controller/chat/chat_controller.dart';
import 'package:bizkit/module/task/domain/model/chat/time_expence/time_expence_creation.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class TimeExpenceCreation extends StatefulWidget {
  const TimeExpenceCreation({super.key});

  @override
  State<TimeExpenceCreation> createState() => _TimeExpenceCreationState();
}

class _TimeExpenceCreationState extends State<TimeExpenceCreation> {
  final TextEditingController hourController = TextEditingController();
  final TextEditingController minuteController = TextEditingController();
  final TextEditingController expenceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChatController>();
    return Container(
      decoration: BoxDecoration(borderRadius: kBorderRadius25),
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Update Time/Money',
                style:
                    textThinStyle1.copyWith(color: neonShade, fontSize: 15.sp),
              ),
              kHeight20,
              Text(
                'Time Taken',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              kHeight5,
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                      child: _buildTextField(
                          label: 'HH', controller: hourController)),
                  Text(
                    'Hr',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontSize: 10),
                  ),
                  kWidth5,
                  Expanded(
                      child: _buildTextField(
                          label: 'MM', controller: minuteController)),
                  Text(
                    'Min',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontSize: 10),
                  ),
                ],
              ),
              kHeight20,
              Text(
                'Enter the Money Spent on The Task',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              kHeight5,
              _buildTextField(
                  label: 'Enter the Amount', controller: expenceController),
              kHeight20,
              Text(
                'Description about the spent',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              kHeight5,
              _buildTextField(

                  label: 'Description here',
                  maxLines: 4,
                  description: true,
                  controller: descriptionController),
              kHeight30,
              isLoading
                  ? const Center(
                      child: CircularProgressIndicator(color: neonShade),
                    )
                  : EventButton(
                      text: 'Update',
                      onTap: () {
                        if (expenceController.text == '' &&
                            (hourController.text == '' &&
                                minuteController.text == '')) {
                          // show error
                        } else if (formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          int hour = int.parse(hourController.text == ''
                              ? '0'
                              : hourController.text);
                          int min = int.parse(minuteController.text == ''
                              ? '0'
                              : minuteController.text);
                          controller.addTimeExpence(
                              timeExpenceUpdation: TimeExpenseUpdation(
                                  description: descriptionController.text,
                                  expense: expenceController.text,
                                  time: ((hour * 60) + min).toString(),
                                  messageType: 'time_expense_updation'));
                          Timer(
                            const Duration(milliseconds: 300),
                            () {
                              setState(() {
                                isLoading = false;
                              });
                              GoRouter.of(context).pop();
                            },
                          );
                        }
                      },
                      width: double.infinity,
                    ),
              kHeight10,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required String label,
      int? maxLines,
      bool description = false,
      required TextEditingController controller}) {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      controller: controller,
      keyboardType: description ? null : TextInputType.number,
      style: Theme.of(context).textTheme.displaySmall,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: label,
        hintStyle: Theme.of(context).textTheme.displaySmall,
        contentPadding: const EdgeInsets.only(left: 10, top: 7),
        border: InputBorder.none,
      ),
      onChanged: (value) {
        if (description) return;
        controller.text = value.replaceAll(' ', '');
      },
      validator: (value) {
        if (!description) return null;
        if (value == null || value == '') return 'enter description';
        return null;
      },
    );
  }
}
