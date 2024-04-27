import 'dart:developer';

import 'package:bizkit/data/service/api_service.dart';
import 'package:bizkit/domain/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/admin/company_selected_users_list_model/company_selected_users_list_model.dart';
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
  Future<Either<Failure, CompanySelectedUsersListModel>>
      getCompanySelectedUsersList() async {
    try {
      final response =
          await _apiService.get(ApiEndPoints.companySelectedUsersList);
      log('getCompanySelectedUsersList done');
      return Right(CompanySelectedUsersListModel.fromJson(response.data));
    } on DioException catch (e) {
      log('getCompanySelectedUsersList dio error $e');
      return Left(Failure());
    } catch (e) {
      log('getCompanySelectedUsersList catch error $e');
      return Left(Failure());
    }
  }
}
