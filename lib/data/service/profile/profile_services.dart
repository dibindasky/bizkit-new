import 'dart:developer';
import 'package:bizkit/data/service/api_service.dart';
import 'package:bizkit/domain/model/card/cards_in_profile/archieved_cards/archieved_cards.dart';
import 'package:bizkit/domain/model/commen/page_query/page_query.dart';
import 'package:bizkit/domain/model/profile/default_qrmodel/default_qrmodel.dart';
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
import 'package:bizkit/domain/model/qr/create_qr_model/create_qr_model.dart';
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
  Future<Either<Failure, ArchievedCards>> archievedCardsList(
      {required PageQuery pageQuery}) async {
    try {
      final responce = await apiService.get(
        ApiEndPoints.archeivedCardsList,
        data: pageQuery.toJson(),
      );
      // log('archievedCardsList statusCode ${responce.statusCode}');
      return Right(ArchievedCards.fromJson(responce.data));
    } on DioException catch (e) {
      log('archievedCardsList DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
    } catch (e) {
      log('archievedCardsList catch $e');
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<Either<Failure, DefaultQrmodel>> defaultQr({
    required CreateQrModel createQrModel,
  }) async {
    try {
      final responce = await apiService.patch(
        ApiEndPoints.setDefaultQr,
        data: createQrModel.toJson(),
      );
      return Right(DefaultQrmodel.fromJson(responce.data));
    } on DioException catch (e) {
      log('defaultQr DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
    } catch (e) {
      log('defaultQr catch $e');
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<Either<Failure, DefaultQrmodel>> getDefaultQr() async {
    try {
      final responce = await apiService.get(
        ApiEndPoints.archeivedCardsList,
      );
      // log('archievedCardsList statusCode ${responce.statusCode}');
      return Right(DefaultQrmodel.fromJson(responce.data));
    } on DioException catch (e) {
      log('archievedCardsList DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
    } catch (e) {
      log('archievedCardsList catch $e');
      return Left(Failure(message: errorMessage));
    }
  }
}
