import 'dart:developer';

import 'package:bizkit/module/biz_card/data/service/reminder/reminder_service.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/create_reminder_model/create_reminder_model.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/reminder_id_model/reminder_id_model.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/reminders_success_responce/reminder.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/update_reminder_model/update_reminder_model.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/reminder/reminder_repo.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:flutter/material.dart' as mat;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ReminderController extends GetxController {
  final ReminderRepo reminderSerivce = ReminderService();

  // Loadings
  RxBool createReminderLoading = false.obs;
  RxBool deleteReminderLoading = false.obs;
  RxBool allReminderLoading = false.obs;
  RxBool historyReminderLoading = false.obs;
  RxBool upcomingReminderLoading = false.obs;
  RxBool todaysReminderLoading = false.obs;

  /// loading for history of a reminder
  RxBool reminderHistoryCardLoading = false.obs;

  RxList<Reminder> allReminders = <Reminder>[].obs;
  RxList<Reminder> todaysReminders = <Reminder>[].obs;
  RxList<Reminder> upcomingReminders = <Reminder>[].obs;
  RxList<Reminder> historyReminders = <Reminder>[].obs;

  /// history of a reminder for detail view
  RxList<Reminder> historyCardReminders = <Reminder>[].obs;

  final mat.TextEditingController messageController =
      mat.TextEditingController();
  final mat.TextEditingController meetingLabelController =
      mat.TextEditingController();
  final mat.TextEditingController occasionController =
      mat.TextEditingController();
  final mat.TextEditingController venueController = mat.TextEditingController();

  @override
  void onInit() {
    fetchTodaysReminders();
    fetchAllReminders();
    fetchHistoryReminders();
    fetchUpcomingReminders();
    super.onInit();
  }

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
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    final result = await reminderSerivce.createReminder(
        createReminderModel: createReminderModel);

    result.fold(
      (failure) {
        createReminderLoading.value = false;
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text(
              errorMessage,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            backgroundColor: kred,
          ),
        );
      },
      (success) {
        createReminderLoading.value = false;
        clearAllTextEditingControllers();
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text(
              "Reminder set successfully",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            backgroundColor: neonShade,
          ),
        );
        GoRouter.of(context).pop();
        fetchAllReminders();
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
        GoRouter.of(context).pop();
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
        log('allReminders length ${allReminders.length}');
      },
    );
  }

  // fetch all today's reminders
  void fetchTodaysReminders() async {
    todaysReminderLoading.value = true;

    final result = await reminderSerivce.getTodaysReminders();

    result.fold(
      (failure) {
        todaysReminderLoading.value = false;
      },
      (success) {
        todaysReminderLoading.value = false;
        todaysReminders.assignAll(success.reminders ?? []);
        log('todaysReminders length ${todaysReminders.length}');
      },
    );
  }

  // fetch all upcoming reminders
  void fetchUpcomingReminders() async {
    upcomingReminderLoading.value = true;

    final result = await reminderSerivce.getUpcomingReminders();

    result.fold(
      (failure) {
        upcomingReminderLoading.value = false;
      },
      (success) {
        upcomingReminderLoading.value = false;
        upcomingReminders.assignAll(success.reminders ?? []);
        log('upcomingReminders length ${upcomingReminders.length}');
      },
    );
  }

  // fetch all history reminders
  void fetchHistoryReminders() async {
    historyReminderLoading.value = true;

    final result = await reminderSerivce.getHistoryReminders();

    result.fold(
      (failure) {
        historyReminderLoading.value = false;
      },
      (success) {
        historyReminderLoading.value = false;
        historyReminders.assignAll(success.reminders ?? []);
        log('historyReminders length ${historyReminders.length}');
      },
    );
  }

  void getCardRemiderHistory({required String id}) async {
    reminderHistoryCardLoading.value = true;
    historyCardReminders.value = [];
    final result = await reminderSerivce.getCardReminderHistory(id: id);
    result.fold((l) {
      reminderHistoryCardLoading.value = false;
    }, (r) {
      historyCardReminders.value = r.reminders ?? [];
      reminderHistoryCardLoading.value = false;
    });
  }
}
