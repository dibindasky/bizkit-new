import 'dart:developer';

import 'package:bizkit/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/create_reminder_model/create_reminder_model.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/create_reminder_responce/create_reminder_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/reminder_id_model/reminder_id_model.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/reminders_success_responce/reminders_success_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/update_reminder_model/update_reminder_model.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/reminder/reminder_repo.dart';
import 'package:bizkit/service/api_service/api_service.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ReminderService implements ReminderRepo {
  final ApiService apiService = ApiService();

  @override
  Future<Either<Failure, CreateReminderResponce>> createReminder(
      {required CreateReminderModel createReminderModel}) async {
    try {
      log('Create reminder TO JSON  === > ${createReminderModel.toJson()}');
      final responce = await apiService.post(
        ApiEndPoints.reminder,
        data: createReminderModel.toJson(),
      );
      log('createReminder ==> success ');
      return Right(CreateReminderResponce.fromJson(responce.data));
    } on DioException catch (e) {
      log('createReminder DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('createReminder catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> updateReminder(
      {required UpdateReminderModel updateReminderModel}) async {
    try {
      final responce = await apiService.patch(
        ApiEndPoints.reminder,
        data: updateReminderModel.toJson(),
      );
      log('updateReminder ==> success ');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('updateReminder DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('updateReminder catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> deleteReminder(
      {required ReminderIdModel deleteReminderModel}) async {
    try {
      final responce = await apiService.delete(
        ApiEndPoints.reminder,
        data: deleteReminderModel.toJson(),
      );
      log('deleteReminder ==> success ');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('deleteReminder DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('deleteReminder catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, RemindersSuccessResponce>> getTodaysReminders() async {
    try {
      final responce = await apiService.get(
        ApiEndPoints.getReminders,
        queryParameters: {
          'category': 'today_reminders',
        },
      );
      log('getTodaysReminders ==> success ');
      return Right(RemindersSuccessResponce.fromJson(responce.data));
    } on DioException catch (e) {
      log('getTodaysReminders DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('getTodaysReminders catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, RemindersSuccessResponce>>
      getHistoryReminders() async {
    try {
      final responce = await apiService.get(
        ApiEndPoints.getReminders,
        queryParameters: {
          'category': 'history_reminders',
        },
      );
      log('getHistoryReminders ==> success ');
      return Right(RemindersSuccessResponce.fromJson(responce.data));
    } on DioException catch (e) {
      log('getHistoryReminders DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('getHistoryReminders catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, RemindersSuccessResponce>> getAllReminders() async {
    try {
      final responce = await apiService.get(
        ApiEndPoints.getReminders,
      );
      log('getAllReminders ==> success ');
      return Right(RemindersSuccessResponce.fromJson(responce.data));
    } on DioException catch (e) {
      log('getAllReminders DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('getAllReminders catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, RemindersSuccessResponce>>
      getUpcomingReminders() async {
    try {
      final responce = await apiService.get(
        ApiEndPoints.getReminders,
        queryParameters: {
          'category': 'upcoming_reminders',
        },
      );
      log('getUpcomingReminders ==> success ');
      return Right(RemindersSuccessResponce.fromJson(responce.data));
    } on DioException catch (e) {
      log('getUpcomingReminders DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('getUpcomingReminders catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, RemindersSuccessResponce>> getCardReminderHistory(
      {required String id}) async {
    try {
      final responce = await apiService.get(
        ApiEndPoints.getCardRemindersHistory,
        queryParameters: {
          'reminder_id': id,
        },
      );
      log('getCardReminderHistory ==> success ');
      return Right(RemindersSuccessResponce.fromJson(responce.data));
    } on DioException catch (e) {
      log('getCardReminderHistory DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('getCardReminderHistory catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }
}
