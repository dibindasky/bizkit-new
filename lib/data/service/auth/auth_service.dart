import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/domain/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/auth/login_model/login_model.dart';
import 'package:bizkit/domain/model/auth/login_response_model/login_response_model.dart';
import 'package:bizkit/domain/repository/service/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

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
}
