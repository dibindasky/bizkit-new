import 'dart:developer';

import 'package:bizkit/module/biz_card/data/service/reminder/reminder_service.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/biz_card_reminders_responce/reminder.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/create_reminder_model/create_reminder_model.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/reminder_id_model/reminder_id_model.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/reminder_query_params_model/reminder_query_params_model.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/reminders_success_responce/reminder.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/update_reminder_model/update_reminder_model.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/reminder/reminder_repo.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/snackbar/flutter_toast.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:flutter/material.dart' as mat;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ReminderController extends GetxController {
  final ReminderRepo reminderSerivce = ReminderService();

  // ScrollControllers
  final ScrollController historyReminderScrollControler =
      ScrollController(); // history reminders scroll controller
  final ScrollController allReminderScrollControler =
      ScrollController(); // all reminders scroll controller
  final ScrollController upcomingReminderScrollControler =
      ScrollController(); // upcoming reminders scroll controller
  final ScrollController todaysReminderScrollControler =
      ScrollController(); // today's reminders scroll controller

  // Loadings
  RxBool createReminderLoading = false.obs;
  RxBool deleteReminderLoading = false.obs;
  RxBool allReminderLoading = false.obs;
  RxBool allReminderLoadMoreLoading = false.obs;
  RxBool historyReminderLoading = false.obs;
  RxBool historyReminderLoadMoreLoading = false.obs;
  RxBool upcomingReminderLoading = false.obs;
  RxBool upcomingReminderLoadMoreLoading = false.obs;
  RxBool todaysReminderLoading = false.obs;
  RxBool todaysReminderLoadMoreLoading = false.obs;

  /// loading for history of a reminder
  RxBool reminderHistoryCardLoading = false.obs;

  RxList<Reminder> allReminders = <Reminder>[].obs;
  RxList<Reminder> todaysReminders = <Reminder>[].obs;
  RxList<Reminder> upcomingReminders = <Reminder>[].obs;
  RxList<Reminder> historyReminders = <Reminder>[].obs;

  /// history of a reminder for detail view
  RxList<BizCardReminder> historyCardReminders = <BizCardReminder>[].obs;

  final mat.TextEditingController messageController =
      mat.TextEditingController();
  final mat.TextEditingController meetingLabelController =
      mat.TextEditingController();
  final mat.TextEditingController occasionController =
      mat.TextEditingController();
  final mat.TextEditingController venueController = mat.TextEditingController();

  // Pagination controls
  int historyReminderPage = 1, pageSize = 5;
  int todaysReminderPage = 1;
  int upcomingReminderPage = 1;
  int allReminderPage = 1;

  @override
  void onInit() {
    fetchTodaysReminders();
    fetchAllReminders();
    fetchHistoryReminders();
    fetchUpcomingReminders();
    todaysReminderScrollControler
        .addListener(todaysRemindersSearchScrollListener);
    historyReminderScrollControler
        .addListener(historyRemindersSearchScrollListener);
    allReminderScrollControler.addListener(allRemindersSearchScrollListener);
    upcomingReminderScrollControler
        .addListener(upcomingRemindersSearchScrollListener);
    super.onInit();
  }

  void historyRemindersSearchScrollListener() {
    if (historyReminderScrollControler.position.pixels >=
        historyReminderScrollControler.position.maxScrollExtent - 100.h) {
      fetchHistoryRemindersLoadMore();
    }
  }

  void allRemindersSearchScrollListener() {
    if (allReminderScrollControler.position.pixels >=
        allReminderScrollControler.position.maxScrollExtent - 100.h) {
      fetchAllRemindersLoadMore();
    }
  }

  void upcomingRemindersSearchScrollListener() {
    if (upcomingReminderScrollControler.position.pixels >=
        upcomingReminderScrollControler.position.maxScrollExtent - 100.h) {
      fetchUpcomingRemindersLoadMore();
    }
  }

  void todaysRemindersSearchScrollListener() {
    if (todaysReminderScrollControler.position.pixels ==
        todaysReminderScrollControler.position.maxScrollExtent) {
      fetchTodaysRemindersLoadMore();
    }
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

    final result = await reminderSerivce.createReminder(
        createReminderModel: createReminderModel);

    result.fold(
      (failure) {
        createReminderLoading.value = false;

        showCustomToast(
          message: errorMessage,
          backgroundColor: kred,
        );
      },
      (success) {
        createReminderLoading.value = false;
        clearAllTextEditingControllers();

        showCustomToast(
          message: "Reminder set successfully",
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
    log('createReminderMupdateReminderModelodel [ reminderDate ] == > ${updateReminderModel.toJson()}');
    final result = await reminderSerivce.updateReminder(
        updateReminderModel: updateReminderModel);

    result.fold(
      (failure) {
        createReminderLoading.value = false;
        showCustomToast(
          message: errorMessage,
          backgroundColor: kred,
        );
      },
      (success) {
        createReminderLoading.value = false;
        GoRouter.of(context).pop();

        showCustomToast(
          message: success.message ?? '',
        );
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
        showCustomToast(message: errorMessage, backgroundColor: kred);
      },
      (success) {
        deleteReminderLoading.value = false;

        showCustomToast(
          message: success.message ?? '',
        );
      },
    );
  }

  fetchRemindersInOrder() async {
    allReminderLoading.value = true;
    todaysReminderLoading.value = true;
    upcomingReminderLoading.value = true;
    historyReminderLoading.value = true;
    await fetchTodaysReminders();
    await fetchAllReminders();
    await fetchUpcomingReminders();
    await fetchHistoryReminders();
  }

  // fetch all reminders
  Future<void> fetchAllReminders() async {
    allReminderLoading.value = true;
    allReminderPage = 1;
    allReminders.value = [];

    final result = await reminderSerivce.getAllReminders(
      reminderQueryParams:
          ReminderQueryParamsModel(page: allReminderPage, pageSize: pageSize),
    );

    result.fold(
      (failure) {
        allReminderLoading.value = false;
      },
      (success) {
        allReminders.assignAll(success.reminders ?? []);

        allReminderLoading.value = false;
      },
    );
  }

  // fetch all  reminders [ pagination ]
  Future<void> fetchAllRemindersLoadMore() async {
    if (allReminderLoadMoreLoading.value == true) {
      return;
    }
    allReminderLoadMoreLoading.value = true;
    final result = await reminderSerivce.getAllReminders(
      reminderQueryParams: ReminderQueryParamsModel(
        page: ++allReminderPage,
        pageSize: pageSize,
      ),
    );

    result.fold(
      (failure) {
        allReminderLoadMoreLoading.value = false;
      },
      (success) {
        allReminders.addAll(success.reminders ?? []);
        allReminderLoadMoreLoading.value = false;
      },
    );
  }

  // fetch all today's reminders
  Future<void> fetchTodaysReminders() async {
    todaysReminderLoading.value = true;
    todaysReminderPage = 1;
    todaysReminders.value = [];

    final result = await reminderSerivce.getTodaysReminders(
      reminderQueryParams: ReminderQueryParamsModel(
        category: 'today_reminders',
        page: todaysReminderPage,
        pageSize: pageSize,
      ),
    );

    result.fold(
      (failure) {
        todaysReminderLoading.value = false;
      },
      (success) {
        todaysReminders.assignAll(success.reminders ?? []);
        todaysReminderLoading.value = false;
      },
    );
  }

  // fetch all today's reminders [ pagination ]
  Future<void> fetchTodaysRemindersLoadMore() async {
    if (todaysReminderLoadMoreLoading.value == true) {
      return;
    }

    todaysReminderLoadMoreLoading.value = true;
    final result = await reminderSerivce.getTodaysReminders(
      reminderQueryParams: ReminderQueryParamsModel(
        category: 'today_reminders',
        page: ++todaysReminderPage,
        pageSize: pageSize,
      ),
    );

    result.fold(
      (failure) {
        todaysReminderLoadMoreLoading.value = false;
      },
      (success) {
        todaysReminders.addAll(success.reminders ?? []);
        todaysReminderLoadMoreLoading.value = false;
      },
    );
  }

  // fetch all upcoming reminders
  Future<void> fetchUpcomingReminders() async {
    upcomingReminderLoading.value = true;
    upcomingReminderPage = 1;
    upcomingReminders.value = [];

    final result = await reminderSerivce.getUpcomingReminders(
      reminderQueryParams: ReminderQueryParamsModel(
        category: 'upcoming_reminders',
        page: upcomingReminderPage,
        pageSize: pageSize,
      ),
    );

    result.fold(
      (failure) {
        upcomingReminderLoading.value = false;
      },
      (success) {
        upcomingReminders.assignAll(success.reminders ?? []);
        upcomingReminderLoading.value = false;
      },
    );
  }

  // fetch all upcoming reminders [ pagination ]
  Future<void> fetchUpcomingRemindersLoadMore() async {
    if (upcomingReminderLoadMoreLoading.value == true) {
      return;
    }

    upcomingReminderLoadMoreLoading.value = true;

    final result = await reminderSerivce.getUpcomingReminders(
      reminderQueryParams: ReminderQueryParamsModel(
        category: 'upcoming_reminders',
        page: ++upcomingReminderPage,
        pageSize: pageSize,
      ),
    );

    result.fold(
      (failure) {
        upcomingReminderLoadMoreLoading.value = false;
      },
      (success) {
        upcomingReminders.addAll(success.reminders ?? []);
        upcomingReminderLoadMoreLoading.value = false;
      },
    );
  }

  // fetch all history reminders
  Future<void> fetchHistoryReminders() async {
    historyReminderLoading.value = true;
    historyReminderPage = 1;
    historyReminders.value = [];

    final result = await reminderSerivce.getHistoryReminders(
      reminderQueryParams: ReminderQueryParamsModel(
        category: 'history_reminders',
        page: historyReminderPage,
        pageSize: pageSize,
      ),
    );

    result.fold(
      (failure) {
        historyReminderLoading.value = false;
      },
      (success) {
        historyReminders.assignAll(success.reminders ?? []);
        historyReminderLoading.value = false;
        update();
      },
    );
  }

  // fetch all history reminders [ pagination ]
  Future<void> fetchHistoryRemindersLoadMore() async {
    if (historyReminderLoadMoreLoading.value == true) {
      return;
    }
    historyReminderLoadMoreLoading.value = true;

    final result = await reminderSerivce.getHistoryReminders(
      reminderQueryParams: ReminderQueryParamsModel(
        category: 'history_reminders',
        page: ++historyReminderPage,
        pageSize: pageSize,
      ),
    );

    result.fold(
      (failure) {
        historyReminderLoadMoreLoading.value = false;
      },
      (success) {
        historyReminders.addAll(success.reminders ?? []);
        historyReminderLoadMoreLoading.value = false;
        update();
      },
    );
  }

  Future<void> getCardRemiderHistory(
      {required String id, bool card = false}) async {
    if (!card) {
      reminderHistoryCardLoading.value = true;
      historyCardReminders.value = [];
    }

    final result =
        await reminderSerivce.getCardReminderHistory(id: id, card: card);
    result.fold((l) {
      reminderHistoryCardLoading.value = false;
    }, (r) {
      historyCardReminders.value = r.reminders ?? [];
      reminderHistoryCardLoading.value = false;
    });
    reminderHistoryCardLoading.value = false;
  }
}
