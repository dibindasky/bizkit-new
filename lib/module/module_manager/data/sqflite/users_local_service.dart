import 'dart:developer';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/core/model/token/access_token/token_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/card_detail_model.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/my_connections_responce/connection.dart';
import 'package:bizkit/module/module_manager/domain/model/access/access.dart';
import 'package:bizkit/module/module_manager/domain/repository/sqflite/users_local_service_repo.dart';
import 'package:bizkit/module/task/domain/model/dashboard/get_recent_tasks_responce/get_recent_tasks_responce.dart';
import 'package:bizkit/module/task/domain/model/quick_task/quick_tasks_responce/assigned_to.dart';
import 'package:bizkit/module/task/domain/model/quick_task/quick_tasks_responce/quick_tasks.dart';
import 'package:bizkit/module/task/domain/model/success_responce/success_responce.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_deadline_model/filter_by_deadline_model.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/assigned_to_detail.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/get_task_responce.dart';
import 'package:bizkit/service/local_service/sqflite_local_service.dart';
import 'package:bizkit/service/local_service/sql/bizcard/bizcard_oncreate_db.dart';
import 'package:bizkit/service/local_service/sql/oncreate_db.dart';
import 'package:bizkit/service/local_service/sql/task/task_oncreate_db.dart';
import 'package:bizkit/service/secure_storage/flutter_secure_storage.dart';
import 'package:dartz/dartz.dart';

import '../../../task/domain/model/task/get_task_responce/attachment.dart';
import '../../../task/domain/model/task/get_task_responce/sub_task.dart';

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
        users.add(TokenModel.fromJson(x, fromLocalDb: true));
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

  @override
  Future<Either<Failure, SuccessResponce>> clearBizcardLocalStorage() async {
    try {
      final currentUserId = await SecureStorage.getUserId() ?? '';
      // final beforeDelete = await localService.query(
      //     BizCardSql.myConnectionTable,
      //     where: '${MyConnection.colCurrentUserId} = ?',
      //     whereArgs: [currentUserId]);
      // if (beforeDelete.isEmpty) {
      //   print('no values in local data before delete');
      // }
      // for (var value in beforeDelete) {
      //   print(value);
      // }
      const deleteconnectionQuery =
          '''DELETE FROM ${BizCardSql.myConnectionTable} WHERE ${MyConnection.colCurrentUserId} = ? ''';
      const deleteBizcardQuery =
          '''DELETE FROM ${BizCardSql.bizcardTable} WHERE ${CardDetailModel.colUserId} = ? ''';

      await localService.rawDelete(deleteconnectionQuery, [currentUserId]);
      await localService.rawDelete(deleteBizcardQuery, [currentUserId]);
      // final values = await localService.query(BizCardSql.myConnectionTable,
      //     where: '${MyConnection.colCurrentUserId} = ?',
      //     whereArgs: [currentUserId]);
      // if (values.isEmpty) {
      //   print('no values in local data');
      // }
      // for (var value in values) {
      //   print(value);
      // }
      return Right(SuccessResponce(message: 'success'));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponce>> clearTaskLocalStorage() async {
    try {
      final currentUserId = await SecureStorage.getUserId() ?? '';

      const taskQuery =
          '''DELETE FROM ${TaskSql.tasksTable} WHERE ${GetTaskResponce.colUserId} = ? ''';
      const taskAttachmentQuery =
          '''DELETE FROM ${TaskSql.taskAttachmentsTable} WHERE ${Attachment.colUserId} = ? ''';
      const taskSubTaskQuery =
          '''DELETE FROM ${TaskSql.taskSubTasksTable} WHERE ${SubTask.colUserId} = ? ''';
      const taskAssignedToDetailQuery =
          '''DELETE FROM ${TaskSql.taskAssignedToDetailTable} WHERE ${AssignedToDetail.colUserId} = ? ''';

      const taskNextActionDateQuery =
          '''DELETE FROM ${TaskSql.taskNextActionDatesTable} WHERE ${AssignedToDetail.colUserId} = ? ''';
      const filterByDeadlineTaskQuery =
          '''DELETE FROM ${TaskSql.filterByDeadlineTable} WHERE ${FilterByDeadlineModel.colUserId} = ? ''';
      const recentTaskQuery =
          '''DELETE FROM ${TaskSql.recentTasksTable} WHERE ${GetRecentTasksResponce.colUserId} = ? ''';
      const quickTaskQuery =
          '''DELETE FROM ${TaskSql.quickTasksTable} WHERE ${QuickTasks.colUserId} = ? ''';
      const quickTaskAssignedToQuery =
          '''DELETE FROM ${TaskSql.quickTaskAssignedToTable} WHERE ${QuickTaskAssignedToResponce.colUserId} = ? ''';

      await localService.rawDelete(taskQuery, [currentUserId]);
      await localService.rawDelete(taskAttachmentQuery, [currentUserId]);
      await localService.rawDelete(taskNextActionDateQuery, [currentUserId]);
      await localService.rawDelete(taskSubTaskQuery, [currentUserId]);
      await localService.rawDelete(taskAssignedToDetailQuery, [currentUserId]);
      await localService.rawDelete(filterByDeadlineTaskQuery, [currentUserId]);
      await localService.rawDelete(recentTaskQuery, [currentUserId]);
      await localService.rawDelete(quickTaskQuery, [currentUserId]);
      await localService.rawDelete(quickTaskAssignedToQuery, [currentUserId]);

      return Right(SuccessResponce(message: 'success'));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
