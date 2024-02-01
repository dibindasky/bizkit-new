import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/auth/login_model/login_model.dart';
import 'package:bizkit/domain/model/auth/login_response_model/login_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginResponseModel>> login(
      {required LoginModel loginModel});
}
