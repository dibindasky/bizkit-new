import 'dart:developer';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/core/model/token/access_token/token_model.dart';
import 'package:bizkit/module/module_manager/domain/repository/sqflite/users_local_service_repo.dart';
import 'package:bizkit/service/local_service/sqflite_local_service.dart';
import 'package:bizkit/service/local_service/sql/oncreate_db.dart';
import 'package:bizkit/service/secure_storage/flutter_secure_storage.dart';
import 'package:dartz/dartz.dart';

class UsersLocalService implements UsersLocalRepo {
  final LocalService localService = LocalService();

  @override
  Future<Either<Failure, SuccessResponseModel>> addUserToLocalStorage(
      {required TokenModel model}) async {
    try {
      const query = '''
          INSERT INTO ${Sql.userTable} (
                  ${TokenModel.colUserId},
                  ${TokenModel.colName},
                  ${TokenModel.colAccess},
                  ${TokenModel.colRefresh},
                  ${TokenModel.colRole},
                  ${TokenModel.colOrganisationId},
                  ${TokenModel.colLogout})
          VALUES (?,?,?,?,?,?,?)
          ''';

      await localService.rawInsert(query, [
        model.uid ?? '',
        model.name ?? '',
        model.accessToken ?? '',
        model.refreshToken ?? '',
        model.role ?? '',
        model.organizationId ?? '',
        model.logoutFromDevice ?? 'login'
      ]);
      return Right(SuccessResponseModel());
    } catch (e) {
      log('addUserToLocalStorage error=====> ${e.toString()}');
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> updateUserInLocalStorage({
    required TokenModel model,
  }) async {
    try {
      const query = '''
        UPDATE ${Sql.userTable}
        SET 
          ${TokenModel.colName} = ?,
          ${TokenModel.colAccess} = ?,
          ${TokenModel.colRefresh} = ?,
          ${TokenModel.colRole} = ?,
          ${TokenModel.colOrganisationId} = ?,
          ${TokenModel.colLogout} = ?
        WHERE 
          ${TokenModel.colUserId} = ? 
        ''';

      await localService.rawUpdate(query, [
        model.name ?? '',
        model.accessToken ?? '',
        model.refreshToken ?? '',
        model.role ?? '',
        model.organizationId ?? '',
        model.logoutFromDevice ?? 'login',
        model.uid ?? ''
      ]);

      return Right(SuccessResponseModel());
    } catch (e) {
      log('updateUserInLocalStorage error=====> ${e.toString()}');
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<TokenModel>>> getUsersFromLocalStorage() async {
    try {
      const String query = '''SELECT * 
      FROM ${Sql.userTable}
      WHERE ${TokenModel.colLogout} = ?''';
      final data = await localService.rawQuery(query, ['login']);
      log('getUsersFromLocalStorage => length => ${data.length}');
      List<TokenModel> tokens = [];
      for (var x in data) {
        tokens.add(TokenModel.fromJson(x));
      }
      log('getUsersFromLocalStorage success =====> ${tokens.length}');
      return Right(tokens);
    } catch (e) {
      log('getUsersFromLocalStorage exception =====> ${e.toString()}');
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, TokenModel>> getUserWithUid(
      {required String userId}) async {
    try {
      const String query = '''SELECT * 
      FROM ${Sql.userTable} 
      WHERE ${TokenModel.colUserId} = ?''';
      final data = await localService.rawQuery(query, [userId]);
      log('getUserWithUid => length => ${data.length}');
      List<TokenModel> users = [];
      for (var x in data) {
        users.add(TokenModel.fromJson(x));
      }
      log('getUserWithUid success =====> ${users.length}');
      if (users.isEmpty) return Left(Failure());
      return Right(users.first);
    } catch (e) {
      log('getUserWithUid exception =====> ${e.toString()}');
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>>
      addUserToLocalStorageIfNotPresentInStorage(
          {required TokenModel model}) async {
    try {
      final userId = await SecureStorage.getUserId();
      const String query =
          '''SELECT COUNT(*) FROM ${Sql.userTable} WHERE ${TokenModel.colUserId} = ? ''';
      final bool present =
          await localService.presentOrNot(query, [userId ?? '']);
      log('user present in db => $present');
      if (present) {
        return await updateUserInLocalStorage(model: model);
      } else {
        return await addUserToLocalStorage(model: model);
      }
    } catch (e) {
      log('addUserToLocalStorageIfNotPresentInStorage ======> ${e.toString()}');
      return Left(Failure());
    }
  }
}
