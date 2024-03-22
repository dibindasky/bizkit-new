import 'dart:developer';
import 'package:bizkit/data/service/api_service.dart';
import 'package:bizkit/domain/model/commen/page_query/page_query.dart';
import 'package:bizkit/domain/model/profile/blocked_connection_model/blocked_connection_model.dart';
import 'package:bizkit/domain/model/profile/foregott_password_responce_mdel/foregott_password_responce_mdel.dart';
import 'package:bizkit/domain/model/profile/forgott_password_request_model/forgott_password_request_model.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/domain/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/profile/get_questions_model/get_questions_model.dart';
import 'package:bizkit/domain/model/profile/get_user_info_model/get_user_info_model.dart';
import 'package:bizkit/domain/model/profile/get_user_info_model/result.dart';
import 'package:bizkit/domain/model/profile/update_user_info_model/update_user_info_model.dart';
import 'package:bizkit/domain/model/profile/user_info_change_request_model/user_info_change_request_model.dart';
import 'package:bizkit/domain/model/profile/username_change_responce_model/username_change_responce_model.dart';
import 'package:bizkit/domain/model/report_a_problem/report_a_problem_request_model/report_a_problem_request_model.dart';
import 'package:bizkit/domain/model/search_query/search_query.dart';
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
      final responce = await apiService.patch(
        ApiEndPoints.editProfileInfo,
        data: userInfoChangeRequestModel.toJson(),
      );
      log('editProfile data ${userInfoChangeRequestModel.toJson()}');
      log('editProfile Status code ${responce.statusCode}');
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
      log('getProfile data ${responce.data}');
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
  Future<Either<Failure, Map>> reportAProblem({
    required ReportAProblemRequestModel reportAProblemRequestModel,
  }) async {
    try {
      final responce = await apiService.post(
        ApiEndPoints.reportAProblem,
        data: reportAProblemRequestModel.toJson(),
      );
      log('getProfile statusCode ${responce.statusCode}');
      return const Right({'Mesage': 'created'});
    } on DioException catch (e) {
      log('reportAProblem DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
    } catch (e) {
      log('getProfile catch $e');
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
  Future<Either<Failure, GetQuestionsModel>> getQuestions({
    required PageQuery pageQuery,
    required SearchQuery serachQuery,
  }) async {
    try {
      final responce = await apiService.get(
        ApiEndPoints.faq,
        data: pageQuery.toJson(),
        queryParameters: serachQuery.toJson(),
      );
      log('getQuestions data ${responce.data}');
      return Right(GetQuestionsModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('getQuestions DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
    } catch (e) {
      log('getQuestions catch $e');
      return Left(Failure(message: errorMessage));
    }
  }
}
