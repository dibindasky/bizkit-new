import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/auth/email_verification/email_verification.dart';
import 'package:bizkit/domain/model/auth/login_model/login_model.dart';
import 'package:bizkit/domain/model/auth/login_response_model/login_response_model.dart';
import 'package:bizkit/domain/model/auth/sign_up_model/sign_up_model.dart';
import 'package:bizkit/domain/model/auth/sign_up_response_model/sign_up_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginResponseModel>> login(
      {required LoginModel loginModel});
  Future<Either<Failure, SignUpResponseModel>> register(
      {required SignUpModel signUpModel});
  Future<Either<Failure, SignUpResponseModel>> sendOtp(
      {required EmailModel emailModel});
}
