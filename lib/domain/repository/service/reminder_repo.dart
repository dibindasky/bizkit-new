import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/commen/success_response_model/success_response_model.dart';
import 'package:bizkit/domain/model/reminders/create_reminder_model/create_reminder_model.dart';
import 'package:dartz/dartz.dart';

abstract class ReminderRepo {
  Future<Either<Failure, SuccessResponseModel>> createReminder(
      {required CreateReminderModel createReminderModel});
  Future<Either<Failure, SuccessResponseModel>> editReminder(
      {required CreateReminderModel createReminderModel});
}
