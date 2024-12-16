import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/biz_card_reminders_responce/biz_card_reminders_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/create_reminder_model/create_reminder_model.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/create_reminder_responce/create_reminder_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/reminder_id_model/reminder_id_model.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/reminder_query_params_model/reminder_query_params_model.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/reminders_success_responce/reminders_success_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/update_reminder_model/update_reminder_model.dart';

import 'package:dartz/dartz.dart';

abstract class ReminderRepo {
  // Create new reminder
  Future<Either<Failure, CreateReminderResponce>> createReminder(
      {required CreateReminderModel createReminderModel});

  // Update  reminder
  Future<Either<Failure, SuccessResponseModel>> updateReminder(
      {required UpdateReminderModel updateReminderModel});

  // Delete reminder
  Future<Either<Failure, SuccessResponseModel>> deleteReminder(
      {required ReminderIdModel deleteReminderModel});

  // Get today's reminders
  Future<Either<Failure, RemindersSuccessResponce>> getTodaysReminders(
      {required ReminderQueryParamsModel reminderQueryParams});

  // Get history reminders
  Future<Either<Failure, RemindersSuccessResponce>> getHistoryReminders(
      {required ReminderQueryParamsModel reminderQueryParams});

  // Get all reminders
  Future<Either<Failure, RemindersSuccessResponce>> getAllReminders(
      {required ReminderQueryParamsModel reminderQueryParams});

  // Get upcoming reminders
  Future<Either<Failure, RemindersSuccessResponce>> getUpcomingReminders(
      {required ReminderQueryParamsModel reminderQueryParams});

  // Get card reminder history
  Future<Either<Failure, BizCardRemindersResponce>> getCardReminderHistory(
      {required String id,required bool card});
}
