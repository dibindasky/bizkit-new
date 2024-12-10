import 'dart:developer';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/core/model/token/access_token/token_model.dart';
import 'package:bizkit/module/module_manager/domain/model/access/access.dart';
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
      for (var data in model.allowedAccesses ?? []) {
        await addAccessToLocalStorageIfNotPresentInStorage(access: data);
      }
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
      for (var data in model.allowedAccesses ?? []) {
        await addAccessToLocalStorageIfNotPresentInStorage(access: data);
      }
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
        print('user data ->  $x');
        tokens.add(TokenModel.fromJson(x, fromLocalDb: true));
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
        users.add(TokenModel.fromJson(x,fromLocalDb: true));
      }
      log('getUserWithUid success =====> ${users.length}');
      if (users.isEmpty) return Left(Failure());
      TokenModel model = users.first;
      // final access = await getAccessFromLocalStorage();
      // access.fold((l) => null, (r) {
      //   model = model.copyWith(allowedAccesses: r);
      // });
      return Right(model);
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

  @override
  Future<Either<Failure, SuccessResponseModel>>
      addAccessToLocalStorageIfNotPresentInStorage(
          {required Access access}) async {
    try {
      final userId = await SecureStorage.getUserId();
      const String query =
          '''SELECT COUNT(*) FROM ${Sql.accessTable} WHERE ${Access.colCurrentUserId} = ? AND ${Access.colAccess} = ? AND ${Access.colComesUnder} =?''';
      final bool present = await localService.presentOrNot(
          query, [userId ?? '', access.access ?? '', access.comesUnder ?? '']);
      log('user present in db => $present');
      if (present) {
        return await updateAccessToStorage(access: access);
      } else {
        return await addAccessToStorage(access: access);
      }
    } catch (e) {
      log('addUserToLocalStorageIfNotPresentInStorage ======> ${e.toString()}');
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> addAccessToStorage(
      {required Access access}) async {
    try {
      const query = '''
          INSERT INTO ${Sql.accessTable} (
                  ${Access.colComesUnder},
                  ${Access.colId},
                  ${Access.colAccess},
                  ${Access.colPermissions},
                  ${Access.colCurrentUserId})
          VALUES (?,?,?,?,?)
          ''';
      final uid = await SecureStorage.getUserId() ?? '';
      await localService.rawInsert(query, [
        access.comesUnder ?? '',
        access.id ?? '',
        access.access ?? '',
        (access.permissions ?? [])
            .toString()
            .replaceFirst('[', '')
            .replaceFirst(']', ''),
        uid,
      ]);
      return Right(SuccessResponseModel());
    } catch (e) {
      log('addUserToLocalStorage error=====> ${e.toString()}');
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> updateAccessToStorage({
    required Access access,
  }) async {
    try {
      final uid = await SecureStorage.getUserId() ?? '';
      const query = '''
        UPDATE ${Sql.accessTable}
        SET 
          ${Access.colComesUnder} = ?,
          ${Access.colId} = ?,
          ${Access.colAccess} = ?,
          ${Access.colPermissions} = ?,
        WHERE 
          ${Access.colCurrentUserId} = ? 
        ''';

      await localService.rawUpdate(query, [
        access.comesUnder ?? '',
        access.id ?? '',
        access.access ?? '',
        (access.permissions ?? [])
            .toString()
            .replaceFirst('[', '')
            .replaceFirst(']', ''),
        uid
      ]);

      return Right(SuccessResponseModel());
    } catch (e) {
      log('updateUserInLocalStorage error=====> ${e.toString()}');
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<Access>>> getAccessFromLocalStorage() async {
    try {
      final uid = await SecureStorage.getUserId() ?? '';
      const String query = '''SELECT * 
      FROM ${Sql.accessTable}
      WHERE ${Access.colCurrentUserId} = ?''';
      final data = await localService.rawQuery(query, [uid]);
      log('getAccessFromLocalStorage => length => ${data.length}');
      List<Access> accesses = [];
      for (var x in data) {
        accesses.add(Access.fromJson(x, fromLocalDb: true));
      }
      log('getAccessFromLocalStorage success =====> ${accesses.length}');
      return Right(accesses);
    } catch (e) {
      log('getAccessFromLocalStorage exception =====> ${e.toString()}');
      return Left(Failure());
    }
  }
}
