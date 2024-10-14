import 'dart:developer';

import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/get_task_responce.dart';
import 'package:bizkit/module/task/domain/repository/sqfilte/task_local_repo.dart';
import 'package:bizkit/service/local_service/sqflite_local_service.dart';
import 'package:bizkit/service/local_service/sql/task/task_oncreate_db.dart';
import 'package:bizkit/service/secure_storage/flutter_secure_storage.dart';
import 'package:dartz/dartz.dart';
import 'package:bizkit/module/task/domain/model/task/self_to_others_type_responce/task.dart'
    as task;

class TaskLocalService implements TaskLocalRepo {
  final LocalService localService = LocalService();

  /// Add the task full details to [ Local Storage ]
  @override
  Future<Either<Failure, SuccessResponseModel>> addFullTaskToLocalStorage(
      {required GetTaskResponce taskModel}) async {
    try {
      final userId = await SecureStorage.getUserId();

      const query = '''
      INSERT INTO ${TaskSql.tasksTable} (
        ${GetTaskResponce.colTaskId},
        ${GetTaskResponce.colTaskCreatedBy},
        ${GetTaskResponce.colTaskTitle},
        ${GetTaskResponce.colTaskDescription},
        ${GetTaskResponce.colTaskPriorityLevel},
        ${GetTaskResponce.colTaskRecurrentTask},
        ${GetTaskResponce.colTaskIsCompleted},
        ${GetTaskResponce.colTaskIsOwned},
        ${GetTaskResponce.colTaskDeadLine},
        ${GetTaskResponce.colTaskIsKilled},
        ${GetTaskResponce.colTaskTags},
        ${GetTaskResponce.colTaskCreatedAt},
        ${GetTaskResponce.colTaskStatus},
        ${GetTaskResponce.colTaskCreatedUserId},
        ${GetTaskResponce.colTaskCreatedUsername},
        ${GetTaskResponce.colTaskCreatedUserProfilePic},
        ${GetTaskResponce.colTaskTotalTime},
        ${GetTaskResponce.colTaskTotalExpense})
      VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
      ''';

      await localService.rawInsert(
        query,
        [
          userId ?? '',
          taskModel.id ?? '',
          taskModel.createdBy ?? '',
          taskModel.title ?? '',
          taskModel.description ?? '',
          taskModel.priorityLevel ?? '',
          ((taskModel.recurrentTask ?? false) ? 1 : 0),
          ((taskModel.isCompleted ?? false) ? 1 : 0),
          ((taskModel.isOwned ?? false) ? 1 : 0),
          taskModel.deadLine ?? '',
          ((taskModel.isKilled ?? false) ? 1 : 0),
          taskModel.tags ?? '',
          taskModel.createdAt ?? '',
          taskModel.status ?? '',
          taskModel.totalTime ?? '',
          taskModel.totalExpense ?? '',
        ],
      );

      log('addFullTaskToLocalStorage success =====> ');
      return Right(SuccessResponseModel());
    } catch (e) {
      log('addFullTaskToLocalStorage exception =====> ${e.toString()}');
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> addTaskToLocalStorage(
      {required task.Task taskModel}) async {
    try {
      // final userId = await SecureStorage.getUserId();

      // const query = '''
      // INSERT INTO ${TaskSql.tasksTable} (
      //   ${GetTaskResponce.colTaskId},
      //   ${GetTaskResponce.colTaskCreatedBy},
      //   ${GetTaskResponce.colTaskTitle},
      //   ${GetTaskResponce.colTaskDescription},
      //   ${GetTaskResponce.colTaskPriorityLevel},
      //   ${GetTaskResponce.colTaskRecurrentTask},
      //   ${GetTaskResponce.colTaskIsCompleted},
      //   ${GetTaskResponce.colTaskIsOwned},
      //   ${GetTaskResponce.colTaskDeadLine},
      //   ${GetTaskResponce.colTaskIsKilled},
      //   ${GetTaskResponce.colTaskTags},
      //   ${GetTaskResponce.colTaskCreatedAt},
      //   ${GetTaskResponce.colTaskStatus},
      //   ${GetTaskResponce.colTaskCreatedUserId},
      //   ${GetTaskResponce.colTaskCreatedUsername},
      //   ${GetTaskResponce.colTaskCreatedUserProfilePic},
      //   ${GetTaskResponce.colTaskTotalTime},
      //   ${GetTaskResponce.colTaskTotalExpense})
      // VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
      // ''';

      // await localService.rawInsert(
      //   query,
      //   [
      //     userId ?? '',
      //     taskModel.id ?? '',
      //     taskModel.createdBy ?? '',
      //     taskModel.title ?? '',
      //     taskModel.description ?? '',
      //     taskModel.priorityLevel ?? '',
      //     ((taskModel.isOwned ?? false) ? 1 : 0),
      //     taskModel.deadLine ?? '',
      //     taskModel.createdAt ?? '',
      //     taskModel.status ?? '',
      //   ],
      // );

      log('addTaskToLocalStorage success =====> ');
      return Right(SuccessResponseModel());
    } catch (e) {
      log('addTaskToLocalStorage exception =====> ${e.toString()}');
      return Left(Failure());
    }
  }
}
