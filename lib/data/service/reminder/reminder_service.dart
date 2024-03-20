import 'dart:developer';
import 'package:bizkit/data/service/api_service.dart';
import 'package:bizkit/domain/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/commen/page_query/page_query.dart';
import 'package:bizkit/domain/model/commen/success_response_model/success_response_model.dart';
import 'package:bizkit/domain/model/reminders/create_reminder_model/create_reminder_model.dart';
import 'package:bizkit/domain/model/reminders/get_reminder_model/get_reminder_model.dart';
import 'package:bizkit/domain/model/reminders/get_reminder_response_model/get_reminder_response_model.dart';
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

  @override
  Future<Either<Failure, SuccessResponseModel>> deleteReminder(
      {required int id}) async {
    try {
      log('deleteReminder ');
      await _apiService.delete(ApiEndPoints.editReminder
          .replaceFirst('{reminder_id}', id.toString()));
      log('deleteReminder done');
      return Right(
          SuccessResponseModel(message: 'Reminder deleted successfully'));
    } on DioException catch (e) {
      log('deleteReminder dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(
          Failure(message: 'Failed to delete reminder please try again'));
    } catch (e) {
      log('deleteReminder exception error');
      log(e.toString());
      return Left(
          Failure(message: 'Failed to delete reminder please try again'));
    }
  }

  @override
  Future<Either<Failure, GetReminderModel>> getAllReminder(
      {required PageQuery pageQuery}) async {
    try {
      log('getAllReminder ');
      final response = await _apiService.get(ApiEndPoints.getAllReminder,
          queryParameters: pageQuery.toJson());
      log('getAllReminder done');
      return Right(GetReminderModel.fromJson(response.data));
    } on DioException catch (e) {
      log('getAllReminder dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('getAllReminder exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, GetReminderModel>> getHistoryReminder(
      {required PageQuery pageQuery}) async {
    try {
      log('getHistoryReminder ');
      final response = await _apiService.get(ApiEndPoints.getHistoryReminder,
          queryParameters: pageQuery.toJson());
      log('getHistoryReminder done');
      return Right(GetReminderModel.fromJson(response.data));
    } on DioException catch (e) {
      log('getHistoryReminder dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('getHistoryReminder exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, GetReminderModel>> getTodaysReminder() async {
    try {
      log('getTodaysReminder ');
      final response = await _apiService.get(ApiEndPoints.getTodaysReminder);
      log('getTodaysReminder done ==================================${response.data}');
      return Right(GetReminderModel.fromJson(response.data));
    } on DioException catch (e) {
      log('getTodaysReminder dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('getTodaysReminder exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, GetReminderModel>> getUpcomingReminder(
      {required PageQuery pageQuery}) async {
    try {
      log('getUpcomingReminder ');
      final response = await _apiService.get(ApiEndPoints.getUpcomingReminder,
          queryParameters: pageQuery.toJson());
      log('getUpcomingReminder done');
      return Right(GetReminderModel.fromJson(response.data));
    } on DioException catch (e) {
      log('getUpcomingReminder dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('getUpcomingReminder exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, GetReminderResponseModel>> getReminderDetails(
      {required int id}) async {
    try {
      log('getReminderDetails ');
      final response = await _apiService.get(ApiEndPoints.getReminderDetails
          .replaceFirst('{reminder_id}', id.toString()));
      log('getReminderDetails done');
      return Right(GetReminderResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      log('getReminderDetails dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('getReminderDetails exception error');
      log(e.toString());
      return Left(Failure());
    }
  }
}
