import 'dart:developer';

import 'package:bizkit/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/all_common_shared_fields_responce/all_common_shared_fields_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/individual_shared_fields_query_params_model/individual_shared_fields_query_params_model.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/individual_shared_fields_responce/individual_shared_fields_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/update_common_shared_fields_model/update_common_shared_fields_model.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/level_sharing/level_sharing_repo.dart';
import 'package:bizkit/service/api_service/api_service.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class LevelSharingService implements LevelSharingRepo {
  final ApiService apiService = ApiService();
  @override
  Future<Either<Failure, AllCommonSharedFieldsResponce>>
      getAllCommonSharedFields() async {
    try {
      final responce = await apiService.get(ApiEndPoints.commonLevelSharing);
      log('getAllCommonSharedFields Responce  ==> success ');
      return Right(AllCommonSharedFieldsResponce.fromJson(responce.data));
    } on DioException catch (e) {
      log('getAllCommonSharedFields DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('getAllCommonSharedFields catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> updateCommonSharedFields(
      {required UpdateCommonSharedFieldsModel updateCommonSharedFields}) async {
    try {
      final responce = await apiService.patch(
        ApiEndPoints.commonLevelSharing,
        data: updateCommonSharedFields.toJson(),
      );
      log('updateCommonSharedFields Responce  ==> success ');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('updateCommonSharedFields DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('updateCommonSharedFields catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, IndividualSharedFieldsResponce>>
      getAllIndividualSharedFields(
          {required IndividualSharedFieldsQueryParamsModel
              queryParameter}) async {
    try {
      final responce = await apiService.get(
        ApiEndPoints.individualLevelSharing,
        queryParameters: queryParameter.toJson(),
      );
      log('getAllIndividualSharedFields Responce  ==> success ');
      return Right(IndividualSharedFieldsResponce.fromJson(responce.data));
    } on DioException catch (e) {
      log('getAllIndividualSharedFields DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('getAllIndividualSharedFields catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> updateIndividualSharedFields(
      {required IndividualSharedFieldsResponce
          updateIndividualSharedFields}) async {
    try {
      final responce = await apiService.patch(
        ApiEndPoints.individualLevelSharing,
        data: updateIndividualSharedFields.toJson(),
      );
      log('updateIndividualSharedFields Responce  ==> success ');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('updateIndividualSharedFields DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('updateIndividualSharedFields catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }
}
