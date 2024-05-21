import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/page_query/page_query.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/biz_card/domain/model/commen/card_id_model/card_id_model.dart';
import 'package:bizkit/module/biz_card/domain/model/reminders/create_reminder_model/create_reminder_model.dart';
import 'package:bizkit/module/biz_card/domain/model/reminders/get_reminder_model/get_reminder_model.dart';
import 'package:bizkit/module/biz_card/domain/model/reminders/get_reminder_response_model/get_reminder_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class ReminderRepo {
  Future<Either<Failure, SuccessResponseModel>> createReminder(
      {required CreateReminderModel createReminderModel});
  Future<Either<Failure, SuccessResponseModel>> editReminder(
      {required CreateReminderModel createReminderModel});
  Future<Either<Failure, SuccessResponseModel>> deleteReminder(
      {required int id});
  Future<Either<Failure, GetReminderModel>> getAllReminder(
      {required PageQuery pageQuery});
  Future<Either<Failure, GetReminderModel>> getTodaysReminder();
  Future<Either<Failure, GetReminderModel>> getUpcomingReminder(
      {required PageQuery pageQuery});
  Future<Either<Failure, GetReminderModel>> getHistoryReminder(
      {required PageQuery pageQuery});
  Future<Either<Failure, GetReminderResponseModel>> getReminderDetails(
      {required int id});
  Future<Either<Failure, GetReminderModel>> getCardReminders(
      {required CardIdModel cardIdModel, required PageQuery pageQuery});
}
