import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/domain/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/auth/change_password_model/change_password_model.dart';
import 'package:bizkit/domain/model/auth/email_model/email_model.dart';
import 'package:bizkit/domain/model/auth/login_model/login_model.dart';
import 'package:bizkit/domain/model/auth/login_response_model/login_response_model.dart';
import 'package:bizkit/domain/model/auth/sign_up_indivudal_model/sign_up_indivudal_model.dart';
import 'package:bizkit/domain/model/auth/sign_up_model/sign_up_model.dart';
import 'package:bizkit/domain/model/auth/sign_up_response_model/sign_up_response_model.dart';
import 'package:bizkit/domain/model/auth/verify_otp_model/verify_otp_model.dart';
import 'package:bizkit/domain/model/commen/success_response_model/success_response_model.dart';
import 'package:bizkit/domain/repository/service/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepo)
@injectable
class AuthService implements AuthRepo {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));

  @override
  Future<Either<Failure, LoginResponseModel>> login(
      {required LoginModel loginModel}) async {
    try {
      final response =
          await _dio.post(ApiEndPoints.login, data: loginModel.toJson());
      return Right(LoginResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
    } catch (e) {
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> sendOtp(
      {required EmailModel emailModel}) async {
    try {
      final response =
          await _dio.post(ApiEndPoints.sendOtpMail, data: emailModel.toJson());
      return Right(SuccessResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
    } catch (e) {
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> verifyOtp(
      {required VerifyOtpModel verifyOtpModel}) async {
    try {
      print('otp verify data ${verifyOtpModel.toJson()}');
      final response = await _dio.post(ApiEndPoints.verifyOtp,
          data: verifyOtpModel.toJson());
      print('otp verification response -----------------');
      print(response.data);
      return Right(SuccessResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      print('Dio error -------- $e');
      return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
    } catch (e) {
      print('error -------- $e');
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> changePassword(
      {required ChangePasswordModel changePasswordModel}) async {
    try {
      final response = await _dio.post(ApiEndPoints.changePassword,
          data: changePasswordModel.toJson());
      return Right(SuccessResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
    } catch (e) {
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> forgotPassword(
      {required EmailModel emailModel}) async {
    try {
      final response = await _dio.post(ApiEndPoints.forgotPassword,
          data: emailModel.toJson());
      return Right(SuccessResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
    } catch (e) {
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> verifyOtpForgotPassword(
      {required VerifyOtpModel verifyOtpModel}) async {
    try {
      final response = await _dio.post(ApiEndPoints.verifyforgotPassword,
          data: verifyOtpModel.toJson());
      return Right(SuccessResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
    } catch (e) {
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<Either<Failure, SignUpResponseModel>> registerBusiness(
      {required SignUpModel signUpModel}) async {
    try {
      print(signUpModel.toJson());
      final response =
          await _dio.post(ApiEndPoints.register, data: signUpModel.toJson());
      print('api response signup ${response.data}');
      return Right(SignUpResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      print('api dio exception => $e');
      // need to get exact error msg
      return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
    } catch (e) {
      print('api exception => $e');
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<Either<Failure, SignUpResponseModel>> registerIndivudual(
      {required SignUpIndivudalModel signUpIndivudalModel}) async {
    try {
      print(signUpIndivudalModel.toJson());
      final response = await _dio.post(ApiEndPoints.register,
          data: signUpIndivudalModel.toJson());
      print('api response signup ${response.data}');
      return Right(SignUpResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      print('api dio exc => $e');
      // need to get exact error msg
      return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
    } catch (e) {
      print('api exc => $e');
      return Left(Failure(message: errorMessage));
    }
  }
}
