import 'dart:developer';

import 'package:bizkit/data/service/api_service.dart';
import 'package:bizkit/domain/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/commen/success_response_model/success_response_model.dart';
import 'package:bizkit/domain/model/reminders/create_reminder_model/create_reminder_model.dart';
import 'package:bizkit/domain/repository/service/reminder_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ReminderRepo)
@injectable
class ReminderService implements ReminderRepo {
  final ApiService _apiService;

  ReminderService(this._apiService);
  @override
  Future<Either<Failure, SuccessResponseModel>> createReminder(
      {required CreateReminderModel createReminderModel}) async {
    try {
      log('createReminder ');
      print('createReminder  ${createReminderModel.toJson()}');
      await _apiService.post(ApiEndPoints.createReminder,
          data: createReminderModel.toJson());
      log('createReminder done');
      return Right(
          SuccessResponseModel(message: 'Reminder added successfully'));
    } on DioException catch (e) {
      log('createReminder dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(
          Failure(message: 'Failed to create reminder please try again'));
    } catch (e) {
      log('createReminder exception error');
      log(e.toString());
      return Left(
          Failure(message: 'Failed to create reminder please try again'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> editReminder(
      {required CreateReminderModel createReminderModel}) async {
    try {
      log('createReminder ');
      print('createReminder  ${createReminderModel.toJson()}');
      await _apiService.patch(
          ApiEndPoints.editReminder.replaceFirst(
              '{reminder_id}', createReminderModel.id!.toString()),
          data: createReminderModel.toJson());
      log('createReminder done');
      return Right(
          SuccessResponseModel(message: 'Reminder added successfully'));
    } on DioException catch (e) {
      log('createReminder dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(
          Failure(message: 'Failed to create reminder please try again'));
    } catch (e) {
      log('createReminder exception error');
      log(e.toString());
      return Left(
          Failure(message: 'Failed to create reminder please try again'));
    }
  }
}
