import 'dart:developer';

import 'package:bizkit/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/create_reminder_model/create_reminder_model.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/create_reminder_responce/create_reminder_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/update_reminder_model/update_reminder_model.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/reminder/reminder_repo.dart';
import 'package:bizkit/service/api_service/api_service.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ReminderService implements ReminderRepo {
  final ApiService apiService = ApiService();

  @override
  Future<Either<Failure, CreateReminderResponce>> createReminder(
      {required CreateReminderModel createReminderModel}) async {
    try {
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
}
