import 'dart:developer';
import 'package:bizkit/data/service/api_service.dart';
import 'package:bizkit/domain/model/card/cards_in_profile/archeived_card_model/archeived_card_model.dart';
import 'package:bizkit/domain/model/commen/page_query/page_query.dart';
import 'package:bizkit/domain/model/profile/blocked_connection_model/blocked_connection_model.dart';
import 'package:bizkit/domain/model/profile/foregott_password_responce_mdel/foregott_password_responce_mdel.dart';
import 'package:bizkit/domain/model/profile/forgott_password_request_model/forgott_password_request_model.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/domain/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/profile/get_user_info_model/get_user_info_model.dart';
import 'package:bizkit/domain/model/profile/get_user_info_model/result.dart';
import 'package:bizkit/domain/model/profile/user_info_change_request_model/user_info_change_request_model.dart';
import 'package:bizkit/domain/model/profile/user_info_change_responce_model/user_info_change_responce_model.dart';
import 'package:bizkit/domain/model/profile/username_change_responce_model/username_change_responce_model.dart';
import 'package:bizkit/domain/model/qr/defauilt_qr/defauilt_qr.dart';
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
  Future<Either<Failure, UserInfoChangeResponceModel>> editProfile({
    required UserInfoChangeRequestModel userInfoChangeRequestModel,
  }) async {
    try {
      final responce = await apiService.patch(
        ApiEndPoints.editProfileInfo,
        data: userInfoChangeRequestModel.toJson(),
      );
      log('editProfile data ${userInfoChangeRequestModel.toJson()}');
      log('editProfile Status code ${responce.statusCode}');
      return Right(UserInfoChangeResponceModel.fromJson(responce.data));
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
  Future<Either<Failure, ArcheivedCardModel>> archievedCardsList(
      {required PageQuery pageQuery}) async {
    try {
      final responce = await apiService.get(
        ApiEndPoints.archeivedCardsList,
        data: pageQuery.toJson(),
      );
      return Right(ArcheivedCardModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('archievedCardsList DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
    } catch (e) {
      log('archievedCardsList catch $e');
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<Either<Failure, DefauiltQr>> defaultQr({
    required DefauiltQr defauiltQr,
  }) async {
    try {
      log('data before ${defauiltQr.toJson()}');
      final responce = await apiService.patch(
        ApiEndPoints.defaultQr,
        data: defauiltQr.toJson(),
      );
      log('defaultQr ${responce.data}');
      log('data after ${defauiltQr.toJson()}');
      return Right(DefauiltQr.fromJson(responce.data));
    } on DioException catch (e) {
      log('defaultQr DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
    } catch (e) {
      log('defaultQr catch $e');
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<Either<Failure, DefauiltQr>> getDefaultQr() async {
    try {
      final responce = await apiService.get(
        ApiEndPoints.defaultQr,
      );
      log('${responce.data}');
      return Right(DefauiltQr.fromJson(responce.data));
    } on DioException catch (e) {
      log('getDefaultQr DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('getDefaultQr catch $e');
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
}
