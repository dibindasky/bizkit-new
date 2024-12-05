import 'dart:developer';

import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/userSearch/user_search_success_responce/user_search_success_responce.dart';
import 'package:bizkit/module/task/domain/model/success_responce/success_responce.dart';
import 'package:bizkit/service/local_service/sqflite_local_service.dart';
import 'package:bizkit/service/local_service/sql/oncreate_db.dart';
import 'package:bizkit/service/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:dartz/dartz.dart';

class UsersHistoryLocalService {
  LocalService localService = LocalService();
  Future<Either<Failure, SuccessResponce>> addUserToSearchHistory(
      {required UserSearchSuccessResponce user, Module? module}) async {
    try {
      const query = '''
          INSERT INTO ${Sql.userFreequentSearchTable} (
                  ${UserSearchSuccessResponce.colCurrentUserId},
                  ${UserSearchSuccessResponce.colUserId},
                  ${UserSearchSuccessResponce.colEmail},
                  ${UserSearchSuccessResponce.colCount},
                  ${UserSearchSuccessResponce.colModule},
                  ${UserSearchSuccessResponce.colName},
                  ${UserSearchSuccessResponce.colPhoto},
                  ${UserSearchSuccessResponce.colPhoneNumber}
                  )
          VALUES (?,?,?,?,?,?,?,?)
          ''';
      final userId = await SecureStorage.getUserId() ?? '';
      await localService.rawInsert(query, [
        userId,
        user.userId ?? '',
        user.email ?? '',
        0,
        getStringFromModule(module) ?? '',
        user.name ?? '',
        user.photo ?? '',
        user.phoneNumber ?? '',
      ]);
      log('addUserToSearchHistory success ');
      return Right(SuccessResponce());
    } catch (e) {
      log('addUserToSearchHistory exception => $e');
      return Left(Failure());
    }
  }

  Future<Either<Failure, SuccessResponce>> updateUserInSearchHistory({
    required UserSearchSuccessResponce user,
    Module? module,
  }) async {
    try {
      const query = '''
        UPDATE ${Sql.userFreequentSearchTable}
        SET 
          ${UserSearchSuccessResponce.colEmail} = ?,
          ${UserSearchSuccessResponce.colCount} = ?,
          ${UserSearchSuccessResponce.colModule} = ?,
          ${UserSearchSuccessResponce.colName} = ?,
          ${UserSearchSuccessResponce.colPhoto} = ?,
          ${UserSearchSuccessResponce.colPhoneNumber} = ?
        WHERE 
          ${UserSearchSuccessResponce.colCurrentUserId} = ? AND
          ${UserSearchSuccessResponce.colUserId} = ?
        ''';

      final userId = await SecureStorage.getUserId() ?? '';
      await localService.rawUpdate(query, [
        user.email ?? '',
        (user.count ?? 0) + 1,
        getStringFromModule(module) ?? '',
        user.name ?? '',
        user.photo ?? '',
        user.phoneNumber ?? '',
        userId,
        user.userId ?? '',
      ]);
      return Right(SuccessResponce());
    } catch (e) {
      return Left(Failure());
    }
  }

  Future<Either<Failure, List<UserSearchSuccessResponce>>> getSearchHistory({
    Module? module,
  }) async {
    try {
      const query = '''
        SELECT * FROM ${Sql.userFreequentSearchTable}
        WHERE ${UserSearchSuccessResponce.colCurrentUserId} = ?
        ORDER BY ${UserSearchSuccessResponce.colCount} DESC
        ''';

      final userId = await SecureStorage.getUserId() ?? '';
      final data = await localService.rawQuery(query, [userId]);
      log('getSearchHistory => length => ${data.length}');

      List<UserSearchSuccessResponce> searchHistory = [];
      for (var x in data) {
        searchHistory.add(UserSearchSuccessResponce.fromJson(x));
      }

      log('getSearchHistory success =====> ${searchHistory.length}');
      return Right(searchHistory);
    } catch (e) {
      log('getSearchHistory exception =====> ${e.toString()}');
      return Left(Failure());
    }
  }
}
