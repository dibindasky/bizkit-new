import 'dart:developer';

import 'package:bizkit/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/module/module_manager/domain/model/profile_model/profile_model.dart';
import 'package:bizkit/module/module_manager/domain/repository/service/profile_repo/profile_repo.dart';
import 'package:bizkit/module/task/domain/model/success_responce/success_responce.dart';
import 'package:bizkit/service/api_service/api_service.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProfileService implements ProfileRepo {
  ApiService apiService = ApiService();
  @override
  Future<Either<Failure, ProfileModel>> editNameAndProfileImage(
      {required ProfileModel profileModel}) async {
    try {
      log('editNameAndProfileImage datas ${profileModel.toJson()}');
      final response = await apiService.patch(
        ApiEndPoints.nameAndImage,
        data: profileModel.toJson(),
      );
      print('success editprofileimage');
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
      log('update email or phone success');
      return Right(response.data);
    } on DioException catch (e) {
      return Left(Failure(
          message: (e.response?.data as Map<String, dynamic>?)?['error'] ??
              errorMessage));
    } catch (e) {
      return Left(Failure(message: errorMessage));
    }
  }
}
