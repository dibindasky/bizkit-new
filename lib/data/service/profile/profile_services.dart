import 'dart:developer';
import 'package:bizkit/data/service/api_service.dart';
import 'package:bizkit/domain/model/commen/page_query/page_query.dart';
import 'package:bizkit/domain/model/commen/success_response_model/success_response_model.dart';
import 'package:bizkit/domain/model/profile/blocked_connection_model/blocked_connection_model.dart';
import 'package:bizkit/domain/model/profile/foregott_password_responce_mdel/foregott_password_responce_mdel.dart';
import 'package:bizkit/domain/model/profile/forgott_password_request_model/forgott_password_request_model.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/domain/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/profile/get_question_model/get_question_model.dart';
import 'package:bizkit/domain/model/profile/get_user_info_model/get_user_info_model.dart';
import 'package:bizkit/domain/model/profile/get_user_info_model/result.dart';
import 'package:bizkit/domain/model/profile/update_user_info_model/update_user_info_model.dart';
import 'package:bizkit/domain/model/profile/user_info_change_request_model/user_info_change_request_model.dart';
import 'package:bizkit/domain/model/profile/username_change_responce_model/username_change_responce_model.dart';
import 'package:bizkit/domain/model/report_a_problem/report_a_problem_request_model/report_a_problem_request_model.dart';
import 'package:bizkit/domain/repository/service/profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProfileRepo)
@injectable
class ProfileService implements ProfileRepo {
  final ApiService apiService;
  ProfileService(this.apiService);

  @override
  Future<Either<Failure, ForegottPasswordResponceMdel>> resetPassword({
    required ForgottPasswordRequestModel forgottPasswordRequestModel,
  }) async {
    try {
      final responce = await apiService.patch(
        ApiEndPoints.forgottPasswordProfile,
        data: forgottPasswordRequestModel.toJson(),
      );
      return Right(ForegottPasswordResponceMdel.fromJson(responce.data));
    } on DioException catch (e) {
      log('resetPassword DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
    } catch (e) {
      log('resetPassword catch $e');
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<Either<Failure, UsernameChangeResponceModel>> deleteProfile() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UpdateUserInfoModel>> editProfile({
    required UserInfoChangeRequestModel userInfoChangeRequestModel,
  }) async {
    try {
      log('editProfile data before ${userInfoChangeRequestModel.toJson()}');
      final responce = await apiService.patch(
        ApiEndPoints.editProfileInfo,
        data: userInfoChangeRequestModel.toJson(),
      );
      log('editProfile done');
      return Right(UpdateUserInfoModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('editProfile DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('editProfile catch $e');
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<Either<Failure, GetUserInfoModel>> getProfile() async {
    try {
      final responce = await apiService.get(ApiEndPoints.getProfileInfo);

      return Right(GetUserInfoModel(results: Result.fromJson(responce.data)));
    } on DioException catch (e) {
      log('getProfile DioException $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('getProfile catch $e');
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> reportAProblem({
    required ReportAProblemRequestModel reportAProblemRequestModel,
  }) async {
    try {
      await apiService.post(
        ApiEndPoints.reportAProblem,
        data: reportAProblemRequestModel.toJson(),
      );
      return Right(
          SuccessResponseModel(message: 'Problem reported successfully'));
    } on DioException catch (e) {
      log('reportAProblem DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
    } catch (e) {
      log('reportAProblem catch $e');
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<Either<Failure, BlockedConnectionModel>> getBlockeConnections({
    required PageQuery pageQuery,
  }) async {
    try {
      final responce = await apiService.get(
        ApiEndPoints.getBlockedConnections,
      );
      return Right(BlockedConnectionModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('getBlockeConnections DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
    } catch (e) {
      log('getBlockeConnections catch $e');
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<Either<Failure, GetQuestionModel>> getQuestions({
    required PageQuery pageQuery,
  }) async {
    try {
      log('getQuestions before ${pageQuery.toJson()}');
      final responce = await apiService.get(
        ApiEndPoints.faq,
        queryParameters: pageQuery.toJson(),
      );
      log('getQuestions ${responce.data}');
      return Right(GetQuestionModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('getQuestions DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
    } catch (e) {
      log('getQuestions catch $e');
      return Left(Failure(message: errorMessage));
    }
  }
}
