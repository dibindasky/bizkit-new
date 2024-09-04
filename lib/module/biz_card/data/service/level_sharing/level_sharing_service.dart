import 'dart:developer';

import 'package:bizkit/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/all_common_shared_fields_responce/all_common_shared_fields_responce.dart';
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
}
