import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/page_query/page_query.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/biz_card/domain/model/admin/get_all_business_card_requests/get_all_business_card_requests.dart';
import 'package:bizkit/module/biz_card/domain/model/admin/get_blocked_users/get_blocked_users.dart';
import 'package:bizkit/module/biz_card/domain/model/admin/get_company_users_model/get_company_users_model.dart';
import 'package:dartz/dartz.dart';

abstract class AdminRepo {
  Future<Either<Failure, GetCompanyUsersModel>> getCompanySelectedUsersList();
  Future<Either<Failure, SuccessResponseModel>>
      removeIndiVidualusersPartOfBusiness({required String id});
  Future<Either<Failure, GetAllBusinessCardRequests>>
      getAllBusinessCardRequests({required PageQuery pageQuery});
  Future<Either<Failure, SuccessResponseModel>> businessCardRequestAccept(
      {required String id});
  Future<Either<Failure, SuccessResponseModel>> businessCardRequestReject(
      {required String id});
  Future<Either<Failure, GetBlockedUsers>> getBusinessBlockeUsers();
  Future<Either<Failure, SuccessResponseModel>> businessUnBlockeUser(
      {required String id});
}
