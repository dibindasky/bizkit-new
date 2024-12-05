import 'dart:developer';

import 'package:bizkit/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/achievement/personal_achievement_request_model/personal_achievement_request_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/achievement/personal_achievent_deletion_model/personal_achievent_deletion_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/personal_details_request_model/personal_details_request_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/reminder/personal_dayes_to_reminder_model/personal_dayes_to_reminder_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/reminder/reminder_deletion/reminder_deletion.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/social_media/personal_social_media_deletion/personal_social_media_deletion.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/social_media/personal_social_media_request_model/personal_social_media_request_model.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/card/personal_details_repo.dart';
import 'package:bizkit/service/api_service/api_service.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PersonalDetailsService implements PersonalDetailsRepo {
  final ApiService apiService = ApiService();

  @override
  Future<Either<Failure, SuccessResponseModel>> personalDetailsAdding(
      {required PersonalDetailsRequestModel
          personalDetailsRequestModel}) async {
    try {
      log('${personalDetailsRequestModel.toJson()}');
      final responce = await apiService.put(
          ApiEndPoints.cardCreationPersonalDetails,
          data: personalDetailsRequestModel.toJson());
      log('personalDetailsAdding ==> success');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('personalDetailsAdding DioException ${e.response?.data} $e');

      return Left(Failure(message: errorMessage, data: e.response?.statusCode));
    } catch (e) {
      log('personalDetailsAdding catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> personalAchivmentAdding(
      {required PersonalAchievementRequestModel personalAchiment}) async {
    try {
      final responce = await apiService.post(ApiEndPoints.personalAchievement,
          data: personalAchiment.toJson());
      log('personalAchivmentAdding ==>success');
      final map = responce.data as Map<String, dynamic>?;
      return Right(SuccessResponseModel(data: map));
    } on DioException catch (e) {
      log('personalAchivmentAdding DioException ${e.response?.data} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('personalAchivmentAdding catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> personalAchivmentDeleting(
      {required PersonalAchieventDeletionModel
          personalAchimentDeletion}) async {
    try {
      final responce = await apiService.delete(ApiEndPoints.personalAchievement,
          data: personalAchimentDeletion.toJson());
      log('personalAchivmentDeleting ==>success');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('personalAchivmentDeleting DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('personalAchivmentDeleting catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> personalAchivmentEditing(
      {required PersonalAchievementRequestModel personalAchiment}) async {
    try {
      final responce = await apiService.patch(ApiEndPoints.personalAchievement,
          data: personalAchiment.toJson());
      log('personalAchivmentEditing ==>success');
      final map = responce.data as Map<String, dynamic>?;
      print(map.toString());
      return Right(SuccessResponseModel(
          message: map?['message'],
          data: (map?['image_urls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList()));
    } on DioException catch (e) {
      log('personalAchivmentEditing DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('personalAchivmentEditing catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, PersonalDayesToReminderModel>>
      personalDatesToReminderAdding(
          {required PersonalDayesToReminderModel
              personalDatesToReminderModel}) async {
    try {
      final responce = await apiService.post(
          ApiEndPoints.personalDatesToReminder,
          data: personalDatesToReminderModel.toJson());
      log('personalDatesToReminderAdding ==>success');
      return Right(PersonalDayesToReminderModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('personalDatesToReminderAdding DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('personalDatesToReminderAdding catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> personalDatesToReminderDeleting(
      {required ReminderDeletion remiderDeletion}) async {
    try {
      log('${remiderDeletion.toJson()}');
      final responce = await apiService.delete(
          ApiEndPoints.personalDatesToReminder,
          data: remiderDeletion.toJson());
      log('personalDatesToReminderDeleting ==>success');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('personalDatesToReminderDeleting DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('personalDatesToReminderDeleting catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> personalDatesToReminderEditing(
      {required PersonalDayesToReminderModel
          personalDatesToReminderModel}) async {
    try {
      final responce = await apiService.put(
          ApiEndPoints.personalDatesToReminder,
          data: personalDatesToReminderModel.toJson());
      log('personalDatesToReminderEditing ==>success');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('personalDatesToReminderEditing DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('personalDatesToReminderEditing catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> personalSocialMediaAdding(
      {required PersonalSocialMediaRequestModel
          personalSocialMediaModel}) async {
    try {
      final responce = await apiService.post(ApiEndPoints.personalSocialedia,
          data: personalSocialMediaModel.toJson());
      log('personalSocialMediaAdding ==>success');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('personalSocialMediaAdding DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('personalSocialMediaAdding catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> personalSocialMediaDeleting(
      {required PersonalSocialMediaDeletion
          personalSocialMediaDeletion}) async {
    try {
      final responce = await apiService.delete(ApiEndPoints.personalSocialedia,
          data: personalSocialMediaDeletion.toJson());
      log('personalSocialMediaDeleting ==>success');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('personalSocialMediaDeleting DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('personalSocialMediaDeleting catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> personalSocialMediaEditing(
      {required PersonalSocialMediaRequestModel
          personalSocialMediaModel}) async {
    try {
      final responce = await apiService.put(ApiEndPoints.personalSocialedia,
          data: personalSocialMediaModel.toJson());
      log('personalSocialMediaEditing ==>success');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('personalSocialMediaEditing DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('personalSocialMediaEditing catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }
}
