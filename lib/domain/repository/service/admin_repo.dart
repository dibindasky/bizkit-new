import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/admin/company_selected_users_list_model/company_selected_users_list_model.dart';
import 'package:bizkit/domain/model/admin/get_all_business_card_requests/get_all_business_card_requests.dart';
import 'package:bizkit/domain/model/commen/page_query/page_query.dart';
import 'package:bizkit/domain/model/commen/success_response_model/success_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class AdminRepo {
  Future<Either<Failure, List<CompanySelectedUsersListModel>>>
      getCompanySelectedUsersList();
  Future<Either<Failure, SuccessResponseModel>>
      removeIndiVidualusersPartOfBusiness({required String id});
  Future<Either<Failure, GetAllBusinessCardRequests>>
      getAllBusinessCardRequests({required PageQuery pageQuery});
  Future<Either<Failure, SuccessResponseModel>> businessCardRequestAccept(
      {required String id});
  Future<Either<Failure, SuccessResponseModel>> businessCardRequestReject(
      {required String id});
}
