import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/admin/company_selected_users_list_model/company_selected_users_list_model.dart';
import 'package:bizkit/domain/model/commen/success_response_model/success_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class AdminRepo {
  Future<Either<Failure, List<CompanySelectedUsersListModel>>>
      getCompanySelectedUsersList();
  Future<Either<Failure, SuccessResponseModel>>
      removeIndiVidualusersPartOfBusiness({required String id});
}
