import 'dart:developer';

import 'package:bizkit/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/core/model/token/access_token/token_model.dart';
import 'package:bizkit/service/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/module/module_manager/domain/model/auth/auth_postmodel/auth_postmodel.dart';
import 'package:bizkit/module/module_manager/domain/repository/service/authentication_repo/authentication_repo.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthenticationService implements AuthenticationRepo {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));

  @override
  Future<Either<Failure, SuccessResponseModel>> registerUser(
      {required AuthPostmodel authPostmodel}) async {
    try {
      log('data ${authPostmodel.toJson()}');
      log('api uri ==> post  ${_dio.options.baseUrl + ApiEndPoints.register}');
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
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<Either<Failure, TokenModel>> otpVerification(
      {required AuthPostmodel authPostmodel}) async {
    try {
      log('OTP data ${authPostmodel.toJson()}');
      log('api uri ==> post  ${_dio.options.baseUrl + ApiEndPoints.verifyOtp}');
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
      {required Map<String, dynamic> authPostmodel}) async {
    try {
      log('OTP data $authPostmodel');
      log('api uri ==> post  ${_dio.options.baseUrl + ApiEndPoints.verifyOtp}');
      final responce = await _dio.post(
        ApiEndPoints.verifyOtp,
        data: authPostmodel,
      );
      log('Success otpVerification');
      return Right(TokenModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('DioException otpVerification $e');
      log('DioException otpVerification ${e.response?.data}');
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
      log('api uri ==> post  ${_dio.options.baseUrl + ApiEndPoints.login}');
      final responce = await _dio.post(
        ApiEndPoints.login,
        data: authPostmodel.toJson(),
      );
      log('Success loginUser');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('DioException loginUser $e');
      log('DioException loginUser ${e.response?.data}');
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
      Dio dio = Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));
      dio.options.headers = {'Authorization': "Bearer ${token.accessToken}"};
      log('api uri ==> post  ${dio.options.baseUrl + ApiEndPoints.logOut}');

      final responce = await dio.post(
        ApiEndPoints.logOut,
        data: TokenModel(refreshToken: token.refreshToken).toJson(),
      );
      log('Success logOut');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('DioException logOut $e');
      log('DioException logOut ${e.response?.statusCode}');
      log('DioException logOut ${(e.response?.data as Map<String, dynamic>)["error"]}');
      return Left(
          Failure(message: e.response?.data["message"] ?? errorMessage));
    } catch (e) {
      log('catch logOut $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TokenModel>> loginUsingPassword(
      {required AuthPostmodel authPostmodel}) async {
    try {
      log('loginUsingPassword data ${authPostmodel.toJson()}');
      log('api uri ==> post  ${_dio.options.baseUrl + ApiEndPoints.verifyOtp}');
      final responce = await _dio.post(
        ApiEndPoints.passwordLogin,
        data: authPostmodel.toJson(),
      );
      log('Success loginUsingPassword');
      return Right(TokenModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('DioException loginUsingPassword $e');
      log('DioException loginUsingPassword ${e.response?.data}');
      return Left(
          Failure(message: e.response?.data["message"] ?? errorMessage));
    } catch (e) {
      log('catch loginUsingPassword $e');
      return Left(Failure(message: e.toString()));
    }
  }
}
