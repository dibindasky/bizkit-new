import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/core/model/token/access_token/token_model.dart';
import 'package:bizkit/module/module_manager/domain/model/auth/auth_postmodel/auth_postmodel.dart';
import 'package:dartz/dartz.dart';

abstract class AuthenticationRepo {
  /// register user
  Future<Either<Failure, SuccessResponseModel>> registerUser(
      {required AuthPostmodel authPostmodel});

  /// otp verification api
  Future<Either<Failure, TokenModel>> otpVerification(
      {required AuthPostmodel authPostmodel});

  /// otp verification map
  Future<Either<Failure, TokenModel>> otpVerificationPhone(
      {required Map<String, dynamic> authPostmodel});

  /// login user using phone or email
  Future<Either<Failure, SuccessResponseModel>> loginUser(
      {required AuthPostmodel authPostmodel});

  /// log out user
  Future<Either<Failure, SuccessResponseModel>> logOut();

  /// login usign pasword and phone or email
  Future<Either<Failure, TokenModel>> loginUsingPassword(
      {required AuthPostmodel authPostmodel});
}
