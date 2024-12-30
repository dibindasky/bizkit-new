import 'dart:developer';

import 'package:bizkit/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/card_detail_model.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/my_connections_responce/connection.dart';
import 'package:bizkit/module/module_manager/domain/model/profile_model/profile_model.dart';
import 'package:bizkit/module/module_manager/domain/repository/service/profile_repo/profile_repo.dart';
import 'package:bizkit/module/task/domain/model/success_responce/success_responce.dart';
import 'package:bizkit/service/api_service/api_service.dart';
import 'package:bizkit/service/local_service/sqflite_local_service.dart';
import 'package:bizkit/service/local_service/sql/bizcard/bizcard_oncreate_db.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProfileService implements ProfileRepo {
  ApiService apiService = ApiService();
  final LocalService localService = LocalService();
  @override
  Future<Either<Failure, ProfileModel>> editNameAndProfileImage(
      {required ProfileModel profileModel}) async {
    try {
      // log('editNameAndProfileImage datas ${profileModel.toJson()}');
      final response = await apiService.patch(
        ApiEndPoints.nameAndImage,
        data: profileModel.toJson(),
      );
      return Right(ProfileModel.fromJson(response.data));
    } on DioException catch (e) {
      log('editNameProfileImage Dio Exception $e');
      return Left(Failure(
          message: (e.response?.data as Map<String, dynamic>?)?['error'] ??
              errorMessage));
    } catch (e) {
      log('editNameAndProfileImage ${e.toString()}');
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<Either<Failure, ProfileModel>> getUserProfileData() async {
    try {
      final response = await apiService.get(ApiEndPoints.getUserProfileDetais);

      return Right(ProfileModel.fromJson(response.data['result']));
    } on DioException catch (e) {
      log('getUserProfileData Dio Exception $e');
      return Left(Failure(
          message: (e.response?.data as Map<String, dynamic>?)?['error'] ??
              errorMessage));
    } catch (e) {
      log('getUserProfileData $e');
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<Either<Failure, SuccessResponce>> updateEmailOrPhone(
      {required ProfileModel profileModel}) async {
    try {
      final response = await apiService.patch(ApiEndPoints.updateEmailorPhone,
          data: profileModel.toJson());
      log('update email datas  ${response.data}');
      log('update email or phone success');
      return Right(SuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('update email or phone dio exception${e.toString()}');
      return Left(Failure(
          message: (e.response?.data as Map<String, dynamic>?)?['error'] ??
              errorMessage));
    } catch (e) {
      log('update email or phone catch error ${e.toString()}');
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<Either<Failure, SuccessResponce>> emailAndPhoneOtp(
      {required ProfileModel profileModel}) async {
    try {
      log('email and phone otp to json${profileModel.toJson()}');
      final response = await apiService.patch(ApiEndPoints.updateEmailorPhone,
          data: profileModel.toJson());
      log('emailAndPhoneOtp ${response.data}');
      return Right(SuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('emailAndPhoneOtp Dio Exception $e');
      log('emailAndPhoneOtp Dio Exception ${e.response?.data}');
      return Left(Failure(
          message: (e.response?.data as Map<String, dynamic>?)?['error'] ??
              errorMessage));
    } catch (e) {
      log('emailAndPhoneOtp Dio Exception $e');
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<Either<Failure, SuccessResponce>> deleteAllLocalData(
      {required String currentUserId}) async {
    try {
      final beforeDelete = await localService.query(BizCardSql.myConnectionTable,
          where: '${MyConnection.colCurrentUserId} = ?',
          whereArgs: [currentUserId]);
          if(beforeDelete.isEmpty){
            print('no values in local data before delete'); 
          }
      for (var value in beforeDelete) {
        print(value);
      }
      const deleteconnectionQuery =
          '''DELETE FROM ${BizCardSql.myConnectionTable} WHERE ${MyConnection.colCurrentUserId} = ? ''';
      const deleteBizcardQuery =
          '''DELETE FROM ${BizCardSql.bizcardTable} WHERE ${CardDetailModel.colUserId} = ? ''';

      await localService.rawDelete(deleteconnectionQuery, [currentUserId]);
      await localService.rawDelete(deleteBizcardQuery, [currentUserId]);
      final values = await localService.query(BizCardSql.myConnectionTable,
          where: '${MyConnection.colCurrentUserId} = ?',
          whereArgs: [currentUserId]);
          if(values.isEmpty){
            print('no values in local data'); 
          }
      for (var value in values) {
        print(value);
      }
      return Right(SuccessResponce(message: 'success'));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
