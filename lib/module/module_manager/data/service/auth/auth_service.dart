import 'dart:developer';

import 'package:bizkit/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/core/model/token/token_model.dart';
import 'package:bizkit/module/biz_card/data/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/module/module_manager/domain/model/auth/auth_post_phone_model/auth_post_phone_model.dart';
import 'package:bizkit/module/module_manager/domain/model/auth/auth_postmodel/auth_postmodel.dart';
import 'package:bizkit/module/module_manager/domain/repository/authentication_repo.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthenticationService implements AuthenticationRepo {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));

  @override
  Future<Either<Failure, SuccessResponseModel>> registerUser(
      {required AuthPostmodel authPostmodel}) async {
    try {
      log('data ${authPostmodel.toJson()}');
      final responce = await _dio.post(
        ApiEndPoints.register,
        data: authPostmodel.toJson(),
      );
      log('Success registerUser');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('DioException registerUser $e');
      return Left(
          Failure(message: e.response?.data["message"] ?? errorMessage));
    } catch (e) {
      log('catch registerUser $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TokenModel>> otpVerification(
      {required AuthPostmodel authPostmodel}) async {
    try {
      log('OTP data ${authPostmodel.toJson()}');
      final responce = await _dio.post(
        ApiEndPoints.verifyOtp,
        data: authPostmodel.toJson(),
      );
      log('Success otpVerification ');
      return Right(TokenModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('DioException otpVerification $e');
      return Left(
          Failure(message: e.response?.data["message"] ?? errorMessage));
    } catch (e) {
      log('catch otpVerification $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TokenModel>> otpVerificationPhone(
      {required AuthPostPhoneModel authPostmodel}) async {
    try {
      log('OTP data ${authPostmodel.toJson()}');
      final responce = await _dio.post(
        ApiEndPoints.verifyOtp,
        data: authPostmodel.toJson(),
      );
      log('Success otpVerification');
      return Right(TokenModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('DioException otpVerification $e');
      return Left(
          Failure(message: e.response?.data["message"] ?? errorMessage));
    } catch (e) {
      log('catch otpVerification $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> loginUser(
      {required AuthPostmodel authPostmodel}) async {
    try {
      log('OTP data ${authPostmodel.toJson()}');
      final responce = await _dio.post(
        ApiEndPoints.login,
        data: authPostmodel.toJson(),
      );
      log('Success loginUser');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('DioException loginUser $e');
      return Left(
          Failure(message: e.response?.data["message"] ?? errorMessage));
    } catch (e) {
      log('catch loginUser $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> logOut() async {
    try {
      log('logOut data ');
      final token = await SecureStorage.getToken();
      _dio.options.headers = {'Authorization': "Bearer ${token.accessToken}"};
      final responce = await _dio.post(
        ApiEndPoints.logOut,
        data: TokenModel(refreshToken: token.refreshToken).toJson(),
      );
      log('Success logOut');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('DioException logOut $e');
      return Left(
          Failure(message: e.response?.data["message"] ?? errorMessage));
    } catch (e) {
      log('catch logOut $e');
      return Left(Failure(message: e.toString()));
    }
  }
}
