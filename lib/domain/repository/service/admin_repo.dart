import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/admin/company_selected_users_list_model/company_selected_users_list_model.dart';
import 'package:dartz/dartz.dart';

abstract class AdminRepo {
  Future<Either<Failure, CompanySelectedUsersListModel>>
      getCompanySelectedUsersList();
}
