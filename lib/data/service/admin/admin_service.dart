import 'dart:developer';
import 'package:bizkit/data/service/api_service.dart';
import 'package:bizkit/domain/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/admin/get_all_business_card_requests/get_all_business_card_requests.dart';
import 'package:bizkit/domain/model/admin/get_blocked_users/get_blocked_users.dart';
import 'package:bizkit/domain/model/admin/get_company_users_model/get_company_users_model.dart';
import 'package:bizkit/domain/model/commen/page_query/page_query.dart';
import 'package:bizkit/domain/model/commen/success_response_model/success_response_model.dart';
import 'package:bizkit/domain/repository/service/admin_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AdminRepo)
@injectable
class AdminServices implements AdminRepo {
  final ApiService _apiService;
  AdminServices(this._apiService);
  @override
  Future<Either<Failure, GetCompanyUsersModel>>
      getCompanySelectedUsersList() async {
    try {
      final response =
          await _apiService.get(ApiEndPoints.companySelectedUsersList);
      log('getCompanySelectedUsersList done');
      return Right(GetCompanyUsersModel.fromJson(response.data));
    } on DioException catch (e) {
      log('getCompanySelectedUsersList dio error $e');
      return Left(Failure());
    } catch (e) {
      log('getCompanySelectedUsersList catch error $e');
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>>
      removeIndiVidualusersPartOfBusiness({required String id}) async {
    try {
      final response = await _apiService.patch(
          ApiEndPoints.companySelectedUserAction.replaceFirst('{id}', id));
      log('removeIndiVidualusersPartOfBusiness done');
      return Right(SuccessResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      log('removeIndiVidualusersPartOfBusiness DioException error $e');
      return Left(Failure());
    } catch (e) {
      log('removeIndiVidualusersPartOfBusiness catch error $e');
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, GetAllBusinessCardRequests>>
      getAllBusinessCardRequests({required PageQuery pageQuery}) async {
    try {
      final response = await _apiService.get(
        ApiEndPoints.getAllBusinessUserRequsts,
        queryParameters: pageQuery.toJson(),
      );
      // log('getAllBusinessCardRequests done ${response.data}');
      return Right(GetAllBusinessCardRequests.fromJson(response.data));
    } on DioException catch (e) {
      log('getAllBusinessCardRequests DioException error $e');
      return Left(Failure());
    } catch (e) {
      log('getAllBusinessCardRequests catch error $e');
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> businessCardRequestAccept({
    required String id,
  }) async {
    try {
      final response = await _apiService.patch(
        ApiEndPoints.businessUserRequstAccept.replaceFirst(
          '{id}',
          id,
        ),
        data: {'is_declined': false, 'is_accepted': true},
      );
      log('businessCardRequestAccept done');
      return Right(SuccessResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      log('businessCardRequestAccept DioException error $e');
      return Left(Failure());
    } catch (e) {
      log('businessCardRequestAccept catch error $e');
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> businessCardRequestReject({
    required String id,
  }) async {
    try {
      final response = await _apiService.delete(
        ApiEndPoints.businessUserRequstReject.replaceFirst('{id}', id),
        data: {'is_declined': true, 'is_accepted': false},
      );
      log('businessCardRequestReject done');
      return Right(SuccessResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      log('businessCardRequestReject DioException error $e');
      return Left(Failure());
    } catch (e) {
      log('businessCardRequestReject catch error $e');
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> businessUnBlockeUser({
    required String id,
  }) async {
    try {
      final response = await _apiService.delete(
        ApiEndPoints.businessUnBlockUser.replaceFirst('{id}', id),
      );
      log('businessUnBlockeUser done ${response.data}');
      return Right(SuccessResponseModel(message: 'Deleted successfully'));
    } on DioException catch (e) {
      log('businessUnBlockeUser DioException error $e');
      return Left(Failure());
    } catch (e) {
      log('businessUnBlockeUser catch error $e');
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, GetBlockedUsers>> getBusinessBlockeUsers() async {
    try {
      final response = await _apiService.get(
        ApiEndPoints.businessBlockedUsers,
      );
      log('getBusinessBlockeUsers done ${response.data}');
      return Right(GetBlockedUsers.fromJson(response.data));
    } on DioException catch (e) {
      log('getBusinessBlockeUsers DioException error $e');
      return Left(Failure());
    } catch (e) {
      log('getBusinessBlockeUsers catch error $e');
      return Left(Failure());
    }
  }
}
