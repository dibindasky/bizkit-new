import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/core/model/token/access_token/token_model.dart';
import 'package:dartz/dartz.dart';

abstract class UsersLocalRepo {
  /// add user to loacl storage
  Future<Either<Failure, SuccessResponseModel>> addUserToLocalStorage(
      {required TokenModel model});

  /// update user in loacl storage
  Future<Either<Failure, SuccessResponseModel>> updateUserInLocalStorage({
    required TokenModel model,
  });

  /// get user details with given user id
  Future<Either<Failure, TokenModel>> getUserWithUid({required String userId});

  /// get users form loacal stroage
  Future<Either<Failure, List<TokenModel>>> getUsersFromLocalStorage();

  /// add if not present and update if alredy there
  Future<Either<Failure, SuccessResponseModel>>
      addUserToLocalStorageIfNotPresentInStorage({required TokenModel model});
}
