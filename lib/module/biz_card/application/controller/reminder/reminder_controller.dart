import 'package:bizkit/module/biz_card/data/service/reminder/reminder_service.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/create_reminder_model/create_reminder_model.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/update_reminder_model/update_reminder_model.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/reminder/reminder_repo.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReminderController extends GetxController {
  final ReminderRepo reminderSerivce = ReminderService();

  // Loadings
  RxBool createReminderLoading = false.obs;

  // Create a new reminder
  void createReminder(
      {required CreateReminderModel createReminderModel,
      required BuildContext context}) async {
    createReminderLoading.value = true;

    final result = await reminderSerivce.createReminder(
        createReminderModel: createReminderModel);

    result.fold(
      (failure) {
        createReminderLoading.value = false;
        showSnackbar(context, message: errorMessage, backgroundColor: kred);
      },
      (success) {
        createReminderLoading.value = false;
        showSnackbar(context,
            message: success.message ?? '', backgroundColor: neonShade);
      },
    );
  }

  // Update a  reminder
  void updateReminder(
      {required UpdateReminderModel updateReminderModel,
      required BuildContext context}) async {
    createReminderLoading.value = true;

    final result = await reminderSerivce.updateReminder(
        updateReminderModel: updateReminderModel);

    result.fold(
      (failure) {
        createReminderLoading.value = false;
        showSnackbar(context, message: errorMessage, backgroundColor: kred);
      },
      (success) {
        createReminderLoading.value = false;
        showSnackbar(context,
            message: success.message ?? '', backgroundColor: neonShade);
      },
    );
  }
}
