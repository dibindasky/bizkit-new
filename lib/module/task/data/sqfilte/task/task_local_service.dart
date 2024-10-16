import 'dart:developer';

import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/assigned_to_detail.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/attachment.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/get_task_responce.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/sub_task.dart';
import 'package:bizkit/module/task/domain/repository/sqfilte/task_local_repo.dart';
import 'package:bizkit/service/local_service/sqflite_local_service.dart';
import 'package:bizkit/service/local_service/sql/task/task_oncreate_db.dart';
import 'package:bizkit/service/secure_storage/flutter_secure_storage.dart';
import 'package:dartz/dartz.dart';
import 'package:bizkit/module/task/domain/model/task/self_to_others_type_responce/task.dart'
    as task;

class TaskLocalService implements TaskLocalRepo {
  final LocalService localService = LocalService();
  static String? _userID;

  Future<String?> get userId async {
    if (_userID != null) return _userID;
    _userID = await SecureStorage.getUserId();
    return _userID!;
  }

  /// Add the task full details to [ Local Storage ]
  @override
  Future<Either<Failure, SuccessResponseModel>>
      addFullTaskDetailsToLocalStorage(
          {required GetTaskResponce taskModel}) async {
    try {
      final String? currentUserId = await userId;
      if (currentUserId == null) {
        log('updateTaskFromLocalStorage error: User ID is null');
        return Left(Failure(message: "User ID is null"));
      }
      // Convert the tags list to a comma-separated string
      String tagsAsString = (taskModel.tags ?? []).join(',');

      // SQL query to insert task details into the local database
      const query = '''
      INSERT INTO ${TaskSql.tasksTable} (
        ${GetTaskResponce.colUserId},
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
      VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
      ''';

      final referenceId = await localService.rawInsert(
        query,
        [
          currentUserId,
          taskModel.id ?? '',
          taskModel.createdBy ?? '',
          taskModel.title ?? '',
          taskModel.description ?? '',
          taskModel.priorityLevel ?? '',
          taskModel.recurrentTask == true
              ? 1
              : 0, // Convert boolean to int (1/0)
          taskModel.isCompleted == true ? 1 : 0, // Convert boolean to int (1/0)
          taskModel.isOwned == true ? 1 : 0, // Convert boolean to int (1/0)
          taskModel.deadLine ?? '',
          taskModel.isKilled == true ? 1 : 0, // Convert boolean to int (1/0)
          tagsAsString,
          taskModel.createdAt ?? '',
          taskModel.status ?? '',
          taskModel.createdUserDetails?.id ?? '',
          taskModel.createdUserDetails?.name ?? '',
          taskModel.createdUserDetails?.profilePicture ?? '',
          taskModel.totalTime ?? '',
          taskModel.totalExpense ?? ''
        ],
      );

      // SQL query to insert task attachments
      const attachmentQuery = '''
      INSERT INTO ${TaskSql.taskAttachmentsTable} (
        ${Attachment.colTaskAttachment},
        ${Attachment.colTaskAttachmentType},
        ${Attachment.colTaskAttachmentReferenceId})
      VALUES(?,?,?)  
      ''';

      /// Loop through each attachment and insert into the database
      for (var attachment in taskModel.attachments ?? <Attachment>[]) {
        await localService.rawInsert(
          attachmentQuery,
          [
            attachment.attachment,
            attachment.type,
            referenceId,
          ],
        );
      }

      // SQL query to insert sub-task details
      const subTaskQuery = '''
      INSERT INTO ${TaskSql.taskSubTasksTable}(
        ${SubTask.colTaskSubtaskId},
        ${SubTask.colTaskSubtaskTitle},
        ${SubTask.colTaskSubtaskDescription},
        ${SubTask.colTaskSubtaskDeadline},
        ${SubTask.colTaskSubtaskIsCompleted},
        ${SubTask.colTaskSubtaskTotalTimeTaken},
        ${SubTask.colTaskSubtaskDuration},
        ${SubTask.colTaskSubTaskReferenceId})
      VALUES(?,?,?,?,?,?,?,?)  
      ''';

      // Loop through each sub-task and insert into the database
      for (var subtask in taskModel.subTask ?? <SubTask>[]) {
        await localService.rawInsert(
          subTaskQuery,
          [
            subtask.id,
            subtask.title,
            subtask.description,
            subtask.deadLine,
            subtask.isCompleted == true ? 1 : 0, // Convert boolean to int (1/0)
            subtask.totalTimeTaken,
            subtask.duration,
            referenceId
          ],
        );
      }

      // SQL query to insert assigned-to details [users assigned to the task]
      const assignedToDetailsQuery = '''
      INSERT INTO ${TaskSql.taskAssignedToDetailTable}(
         ${AssignedToDetail.colTaskAssignedToDetailUserId},
         ${AssignedToDetail.colTaskAssignedToDetailUserName},
         ${AssignedToDetail.colTaskAssignedToDetailIsAccepted},
         ${AssignedToDetail.ccolTaskAssignedToDetailReferenceId})
      VALUES(?,?,?,?)   
      ''';

      // Loop through each assigned-to user and insert into the database
      for (var assignedToDetail
          in taskModel.assignedToDetails ?? <AssignedToDetail>[]) {
        await localService.rawInsert(
          assignedToDetailsQuery,
          [
            assignedToDetail.userId,
            assignedToDetail.name,
            assignedToDetail.isAccepted,
            referenceId
          ],
        );
      }

      log('addFullTaskDetailsToLocalStorage success =====> ');
      return Right(SuccessResponseModel());
    } catch (e) {
      log('addFullTaskDetailsToLocalStorage exception =====> ${e.toString()}');
      return Left(Failure());
    }
  }

  /// Update existing task details in local storage
  @override
  Future<Either<Failure, SuccessResponseModel>>
      updateFullTaskDetailsFromLocalStorage(
          {required GetTaskResponce taskModel}) async {
    try {
      final String? currentUserId = await userId;
      if (currentUserId == null) {
        log('updateTaskFromLocalStorage error: User ID is null');
        return Left(Failure(message: "User ID is null"));
      }

      // Convert the tags list to a comma-separated string
      String tagsAsString = (taskModel.tags ?? []).join(',');

      // SQL query to update the existing task in the [ TaskSql.tasksTable ]
      const query = '''
        UPDATE ${TaskSql.tasksTable}
        SET 
          ${GetTaskResponce.colUserId} = ?,
          ${GetTaskResponce.colTaskId} = ?,
          ${GetTaskResponce.colTaskCreatedBy} = ?,
          ${GetTaskResponce.colTaskTitle} = ?,
          ${GetTaskResponce.colTaskDescription} = ?,
          ${GetTaskResponce.colTaskPriorityLevel} = ?,
          ${GetTaskResponce.colTaskRecurrentTask} = ?,
          ${GetTaskResponce.colTaskIsCompleted} = ?,
          ${GetTaskResponce.colTaskIsOwned} = ?,
          ${GetTaskResponce.colTaskDeadLine} = ?,
          ${GetTaskResponce.colTaskIsKilled} = ?,
          ${GetTaskResponce.colTaskTags} = ?,
          ${GetTaskResponce.colTaskCreatedAt} = ?,
          ${GetTaskResponce.colTaskStatus} = ?,
          ${GetTaskResponce.colTaskCreatedUserId} = ?,
          ${GetTaskResponce.colTaskCreatedUsername} = ?,
          ${GetTaskResponce.colTaskCreatedUserProfilePic} = ?,
          ${GetTaskResponce.colTaskTotalTime} = ?,
          ${GetTaskResponce.colTaskTotalExpense} = ?
        WHERE 
          ${GetTaskResponce.colTaskId} = ? AND ${GetTaskResponce.colUserId} = ?  
      ''';

      final referenceId = await localService.rawUpdate(
        query,
        [
          currentUserId,
          taskModel.id ?? '',
          taskModel.createdBy ?? '',
          taskModel.title ?? '',
          taskModel.description ?? '',
          taskModel.priorityLevel ?? '',
          taskModel.recurrentTask == true
              ? 1
              : 0, // Convert boolean to int (1/0)
          taskModel.isCompleted == true ? 1 : 0, // Convert boolean to int (1/0)
          taskModel.isOwned == true ? 1 : 0, // Convert boolean to int (1/0)
          taskModel.deadLine ?? '',
          taskModel.isKilled == true ? 1 : 0, // Convert boolean to int (1/0)
          tagsAsString,
          taskModel.createdAt ?? '',
          taskModel.status ?? '',
          taskModel.createdUserDetails?.id ?? '',
          taskModel.createdUserDetails?.name ?? '',
          taskModel.createdUserDetails?.profilePicture ?? '',
          taskModel.totalTime ?? '',
          taskModel.totalExpense ?? '',
          taskModel.id ?? '',
          await userId
        ],
      );

      // Upsert attachments for the task
      const insertOrUpdateAttachmentQuery = '''
      INSERT OR REPLACE INTO ${TaskSql.taskAttachmentsTable} (
        ${Attachment.colTaskAttachment},
        ${Attachment.colTaskAttachmentType},
        ${Attachment.colTaskAttachmentReferenceId})
      VALUES(?,?,?)  
    ''';

      for (var attachment in taskModel.attachments ?? <Attachment>[]) {
        await localService.rawInsert(
          insertOrUpdateAttachmentQuery,
          [attachment.attachment, attachment.type, referenceId],
        );
      }

      // Upsert subtasks for the task
      const insertOrUpdateSubTaskQuery = '''
      INSERT OR REPLACE INTO ${TaskSql.taskSubTasksTable}(
        ${SubTask.colTaskSubtaskId},
        ${SubTask.colTaskSubtaskTitle},
        ${SubTask.colTaskSubtaskDescription},
        ${SubTask.colTaskSubtaskDeadline},
        ${SubTask.colTaskSubtaskIsCompleted},
        ${SubTask.colTaskSubtaskTotalTimeTaken},
        ${SubTask.colTaskSubtaskDuration},
        ${SubTask.colTaskSubTaskReferenceId})
      VALUES(?,?,?,?,?,?,?,?)  
    ''';

      for (var subtask in taskModel.subTask ?? <SubTask>[]) {
        await localService.rawInsert(
          insertOrUpdateSubTaskQuery,
          [
            subtask.id,
            subtask.title,
            subtask.description,
            subtask.deadLine,
            subtask.isCompleted == true ? 1 : 0,
            subtask.totalTimeTaken,
            subtask.duration,
            referenceId
          ],
        );
      }

      // Upsert assigned-to details
      const insertOrUpdateAssignedToDetailsQuery = '''
      INSERT OR REPLACE INTO ${TaskSql.taskAssignedToDetailTable}(
        ${AssignedToDetail.colTaskAssignedToDetailUserId},
        ${AssignedToDetail.colTaskAssignedToDetailUserName},
        ${AssignedToDetail.colTaskAssignedToDetailIsAccepted},
        ${AssignedToDetail.ccolTaskAssignedToDetailReferenceId})
      VALUES(?,?,?,?)   
    ''';

      for (var assignedToDetail
          in taskModel.assignedToDetails ?? <AssignedToDetail>[]) {
        await localService.rawInsert(
          insertOrUpdateAssignedToDetailsQuery,
          [
            assignedToDetail.userId,
            assignedToDetail.name,
            assignedToDetail.isAccepted,
            referenceId
          ],
        );
      }

      log('updateFullTaskDetailsFromLocalStorage success =====> ');
      return Right(SuccessResponseModel());
    } catch (e) {
      log('updateFullTaskDetailsFromLocalStorage exception =====> ${e.toString()}');
      return Left(Failure());
    }
  }

  /// Add full task details to local storage if not present
  @override
  Future<Either<Failure, SuccessResponseModel>>
      addFullTaskDetailsToLocalStorageIfNotPresentInStorage(
          {required GetTaskResponce taskModel}) async {
    try {
      /// SQL query to check if the task is already present in the [ TaskSql.tasksTable ]
      const String query = '''
      SELECT COUNT(*) 
      FROM ${TaskSql.tasksTable} 
      WHERE ${GetTaskResponce.colTaskId} = ? 
      AND ${GetTaskResponce.colUserId} = ?
    ''';

      /// Check if the task is present in the database
      final bool present =
          await localService.presentOrNot(query, [taskModel.id, await userId]);

      // If not present, add the task; otherwise, update it
      if (!present) {
        return await addFullTaskDetailsToLocalStorage(taskModel: taskModel);
      } else {
        return await updateFullTaskDetailsFromLocalStorage(
            taskModel: taskModel);
      }
    } catch (e) {
      log('addFullTaskDetailsToLocalStorageIfNotPresentInStorage exception =====> ${e.toString()}');
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> addTaskToLocalStorage(
      {required task.Task taskModel}) async {
    try {
      final String? currentUserId = await userId;
      if (currentUserId == null) {
        log('addTaskToLocalStorage error: User ID is null');
        return Left(Failure(message: "User ID is null"));
      }

      const query = '''
      INSERT INTO ${TaskSql.tasksTable}(
        ${GetTaskResponce.colUserId},
        ${GetTaskResponce.colTaskId},
        ${GetTaskResponce.colTaskTitle},
        ${GetTaskResponce.colTaskDescription},
        ${GetTaskResponce.colTaskCreatedAt},
        ${GetTaskResponce.colTaskDeadLine},
        ${GetTaskResponce.colTaskPriorityLevel},
        ${GetTaskResponce.colTaskType},
        ${GetTaskResponce.colTaskIsOwned},
        ${GetTaskResponce.colTaskSpotlightOn},
        ${GetTaskResponce.colTaskIsPinned},
        ${GetTaskResponce.colTaskStatus},
        ${GetTaskResponce.colTaskCreatedUserId},
        ${GetTaskResponce.colTaskCreatedUsername})
      VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)  
      ''';

      final List<dynamic> values = [
        currentUserId,
        taskModel.id ?? '',
        taskModel.title ?? '',
        taskModel.description ?? '',
        taskModel.createdAt ?? '',
        taskModel.deadLine ?? '',
        taskModel.priorityLevel ?? '',
        taskModel.taskType ?? '',
        taskModel.isOwned == true ? 1 : 0,
        taskModel.spotlightOn == true ? 1 : 0,
        taskModel.isPinned == true ? 1 : 0,
        taskModel.status ?? '',
        taskModel.createdBy?.userId ?? '',
        taskModel.createdBy?.name ?? '',
      ];

      await localService.rawInsert(query, values);

      log('addTaskToLocalStorage success');
      return Right(SuccessResponseModel());
    } catch (e) {
      log('addTaskToLocalStorage exception: ${e.toString()}');
      if (e is TypeError) {
        log('TypeError details: ${e.stackTrace}');
      }
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> updateTaskFromLocalStorage(
      {required task.Task taskModel}) async {
    try {
      final String? currentUserId = await userId;
      if (currentUserId == null) {
        log('updateTaskFromLocalStorage error: User ID is null');
        return Left(Failure(message: "User ID is null"));
      }

      const query = '''
        UPDATE ${TaskSql.tasksTable}
        SET 
          ${GetTaskResponce.colUserId} = ?,
          ${GetTaskResponce.colTaskId} = ?,
          ${GetTaskResponce.colTaskTitle} = ?,
          ${GetTaskResponce.colTaskDescription} = ?,
          ${GetTaskResponce.colTaskCreatedAt} = ?,
          ${GetTaskResponce.colTaskDeadLine} = ?,
          ${GetTaskResponce.colTaskPriorityLevel} = ?,
          ${GetTaskResponce.colTaskType} = ?,
          ${GetTaskResponce.colTaskIsOwned} = ?,
          ${GetTaskResponce.colTaskSpotlightOn} = ?,
          ${GetTaskResponce.colTaskIsPinned} = ?,
          ${GetTaskResponce.colTaskStatus} = ?,
          ${GetTaskResponce.colTaskCreatedUserId} = ?,
          ${GetTaskResponce.colTaskCreatedUsername} = ?
        WHERE 
          ${GetTaskResponce.colTaskId} = ? AND ${GetTaskResponce.colUserId} = ?
      ''';

      final List<dynamic> values = [
        currentUserId,
        taskModel.id ?? '',
        taskModel.title ?? '',
        taskModel.description ?? '',
        taskModel.createdAt ?? '',
        taskModel.deadLine ?? '',
        taskModel.priorityLevel ?? '',
        taskModel.taskType ?? '',
        taskModel.isOwned == true ? 1 : 0, // Convert boolean to int (1/0)
        taskModel.spotlightOn == true ? 1 : 0, // Convert boolean to int (1/0)
        taskModel.isPinned == true ? 1 : 0, // Convert boolean to int (1/0)
        taskModel.status ?? '',
        taskModel.createdBy?.userId ?? '',
        taskModel.createdBy?.name ?? '',
        taskModel.id ?? '', // for WHERE clause
        currentUserId, // for WHERE clause
      ];

      final int updatedRows = await localService.rawUpdate(query, values);

      log('updateTaskFromLocalStorage success: Updated rows = $updatedRows, Task ID = ${taskModel.id}');
      return Right(SuccessResponseModel());
    } catch (e) {
      log('updateTaskFromLocalStorage exception: ${e.toString()}');
      if (e is TypeError) {
        log('TypeError details: ${e.stackTrace}');
      }
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>>
      addTaskToLocalStorageIfNotPresentInStorage(
          {required task.Task taskModel}) async {
    try {
      /// SQL query to check if the task is already present in the [ TaskSql.tasksTable ]
      const String query = '''
      SELECT COUNT(*) 
      FROM ${TaskSql.tasksTable} 
      WHERE ${GetTaskResponce.colTaskId} = ? 
      AND ${GetTaskResponce.colUserId} = ?
    ''';

      /// Check if the task is present in the database
      final bool present =
          await localService.presentOrNot(query, [taskModel.id, await userId]);

      // If not present, add the task; otherwise, update it
      if (!present) {
        return await addTaskToLocalStorage(taskModel: taskModel);
      } else {
        return await updateTaskFromLocalStorage(taskModel: taskModel);
      }
    } catch (e) {
      log('addTaskToLocalStorageIfNotPresentInStorage exception =====> ${e.toString()}');
      return Left(Failure());
    }
  }
}
