import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/create_reminder_model/create_reminder_model.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/create_reminder_responce/create_reminder_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/update_reminder_model/update_reminder_model.dart';

import 'package:dartz/dartz.dart';

abstract class ReminderRepo {
  // Create new reminder
  Future<Either<Failure, CreateReminderResponce>> createReminder(
      {required CreateReminderModel createReminderModel});

  // Update  reminder
  Future<Either<Failure, SuccessResponseModel>> updateReminder(
      {required UpdateReminderModel updateReminderModel});
}
