import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/core/model/token/access_token/token_model.dart';
import 'package:bizkit/module/module_manager/domain/model/access/access.dart';
import 'package:dartz/dartz.dart';

abstract class UsersLocalRepo {
  /// add user to loacl storage
  Future<Either<Failure, SuccessResponseModel>> addUserToLocalStorage(
      {required TokenModel model});

  /// update user in loacl storage
  Future<Either<Failure, SuccessResponseModel>> updateUserInLocalStorage({
    required TokenModel model,
  });

  /// add accesses to loacl storage
  Future<Either<Failure, SuccessResponseModel>> addAccessToStorage(
      {required Access access});

  /// update accesses in loacl storage
  Future<Either<Failure, SuccessResponseModel>> updateAccessToStorage({
    required Access access,
  });

  /// get user details with given user id
  Future<Either<Failure, TokenModel>> getUserWithUid({required String userId});

  /// get users form loacal stroage
  Future<Either<Failure, List<TokenModel>>> getUsersFromLocalStorage();

  /// add if not present and update if alredy there
  Future<Either<Failure, SuccessResponseModel>>
      addUserToLocalStorageIfNotPresentInStorage({required TokenModel model});

  /// add if not present and update if alredy there
  Future<Either<Failure, SuccessResponseModel>>
      addAccessToLocalStorageIfNotPresentInStorage({required Access access});

  /// get all access of an user
  Future<Either<Failure, List<Access>>> getAccessFromLocalStorage();
}
