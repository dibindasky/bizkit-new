import 'package:bizkit/module/biz_card/data/service/reminder/reminder_service.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/create_reminder_model/create_reminder_model.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/reminder_id_model/reminder_id_model.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/reminders_success_responce/reminder.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/update_reminder_model/update_reminder_model.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/reminder/reminder_repo.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:flutter/material.dart' as mat;
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ReminderController extends GetxController {
  final ReminderRepo reminderSerivce = ReminderService();

  // Loadings
  RxBool createReminderLoading = false.obs;
  RxBool deleteReminderLoading = false.obs;
  RxBool allReminderLoading = false.obs;
  RxBool historyReminderLoading = false.obs;
  RxBool upcomingReminderLoading = false.obs;
  RxBool todaysReminderLoading = false.obs;

  RxList<Reminder> allReminders = <Reminder>[].obs;
  RxList<Reminder> todaysReminders = <Reminder>[].obs;
  RxList<Reminder> upcomingReminders = <Reminder>[].obs;
  RxList<Reminder> historyReminders = <Reminder>[].obs;

  final mat.TextEditingController messageController =
      mat.TextEditingController();
  final mat.TextEditingController meetingLabelController =
      mat.TextEditingController();
  final mat.TextEditingController occasionController =
      mat.TextEditingController();
  final mat.TextEditingController venueController = mat.TextEditingController();

  void clearAllTextEditingControllers() {
    venueController.clear();
    occasionController.clear();
    meetingLabelController.clear();
    messageController.clear();
  }

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
        clearAllTextEditingControllers();
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

  // Delete a reminder
  void deleteReminder(
      {required ReminderIdModel deleteReminderModel,
      required BuildContext context}) async {
    deleteReminderLoading.value = true;
    final result = await reminderSerivce.deleteReminder(
        deleteReminderModel: deleteReminderModel);

    result.fold(
      (failure) {
        deleteReminderLoading.value = false;
        showSnackbar(context, message: errorMessage, backgroundColor: kred);
      },
      (success) {
        deleteReminderLoading.value = false;
        showSnackbar(context,
            message: success.message ?? '', backgroundColor: neonShade);
      },
    );
  }

  // fetch all reminders
  void fetchAllReminders() async {
    allReminderLoading.value = true;

    final result = await reminderSerivce.getAllReminders();

    result.fold(
      (failure) {
        allReminderLoading.value = false;
      },
      (success) {
        allReminderLoading.value = false;
        allReminders.assignAll(success.reminders ?? []);
      },
    );
  }

  // fetch all today's reminders
  void fetchTodaysReminders() async {
    todaysReminderLoading.value = true;

    final result = await reminderSerivce.getAllReminders();

    result.fold(
      (failure) {
        todaysReminderLoading.value = false;
      },
      (success) {
        todaysReminderLoading.value = false;
        todaysReminders.assignAll(success.reminders ?? []);
      },
    );
  }

  // fetch all upcoming reminders
  void fetchUpcomingReminders() async {
    upcomingReminderLoading.value = true;

    final result = await reminderSerivce.getAllReminders();

    result.fold(
      (failure) {
        upcomingReminderLoading.value = false;
      },
      (success) {
        upcomingReminderLoading.value = false;
        upcomingReminders.assignAll(success.reminders ?? []);
      },
    );
  }

  // fetch all history reminders
  void fetchHistoryReminders() async {
    historyReminderLoading.value = true;

    final result = await reminderSerivce.getAllReminders();

    result.fold(
      (failure) {
        historyReminderLoading.value = false;
      },
      (success) {
        historyReminderLoading.value = false;
        historyReminders.assignAll(success.reminders ?? []);
      },
    );
  }
}
