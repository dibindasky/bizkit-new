import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/commen/page_query/page_query.dart';
import 'package:bizkit/domain/model/commen/success_response_model/success_response_model.dart';
import 'package:bizkit/domain/model/reminders/create_reminder_model/create_reminder_model.dart';
import 'package:bizkit/domain/model/reminders/get_reminder_model/get_reminder_model.dart';
import 'package:bizkit/domain/model/reminders/get_reminder_response_model/get_reminder_response_model.dart';
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
}
