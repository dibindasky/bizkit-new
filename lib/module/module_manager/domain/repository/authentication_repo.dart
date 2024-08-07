import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/core/model/token/token_model.dart';
import 'package:bizkit/module/module_manager/domain/model/auth/auth_postmodel/auth_postmodel.dart';
import 'package:dartz/dartz.dart';

abstract class AuthenticationRepo {
  Future<Either<Failure, SuccessResponseModel>> registerUser(
      {required AuthPostmodel authPostmodel});
  Future<Either<Failure, TokenModel>> otpVerification(
      {required AuthPostmodel authPostmodel});
  Future<Either<Failure, TokenModel>> otpVerificationPhone(
      {required Map<String, dynamic> authPostmodel});
  Future<Either<Failure, SuccessResponseModel>> loginUser(
      {required AuthPostmodel authPostmodel});
  Future<Either<Failure, SuccessResponseModel>> logOut();
}
