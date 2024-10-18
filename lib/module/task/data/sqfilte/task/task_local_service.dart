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

import '../../../domain/model/task/get_task_responce/created_user_details.dart';

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
  Future<Either<Failure, SuccessResponseModel>> addTaskFulDetailsToLocalStorage(
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
          taskModel.totalTime ?? 0,
          taskModel.totalExpense ?? 0
        ],
      );

      // SQL query to insert task attachments
      addTaskAttachmentsToLocalStorageIfNotPresentInStorage(
          attachments: taskModel.attachments ?? <Attachment>[],
          referenceId: referenceId);

      // SQL query to insert sub-task details
      addTaskSubtasksToLocalStorageIfNotPresentInStorage(
          subtasks: taskModel.subTask ?? <SubTask>[], referenceId: referenceId);

      // SQL query to insert assigned-to details [users assigned to the task]
      addTaskAssignedToDetailsToLocalStorageIfNotPresentInStorage(
          assignedToDetails:
              taskModel.assignedToDetails ?? <AssignedToDetail>[],
          referenceId: referenceId);

      log('addFullTaskDetailsToLocalStorage success =====> ');
      return Right(SuccessResponseModel());
    } catch (e) {
      log('addFullTaskDetailsToLocalStorage exception =====> ${e.toString()}');
      return Left(Failure());
    }
  }

  Future<void> addAssignedToDetails(
      AssignedToDetail assignedToDetail, int referenceId) async {
    const assignedToDetailsQuery = '''
        INSERT INTO ${TaskSql.taskAssignedToDetailTable}(
         ${AssignedToDetail.colTaskAssignedToDetailUserId},
         ${AssignedToDetail.colTaskAssignedToDetailUserName},
         ${AssignedToDetail.colTaskAssignedToDetailIsAccepted},
         ${AssignedToDetail.ccolTaskAssignedToDetailReferenceId})
      VALUES(?,?,?,?)   
      ''';

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

  Future<void> addSubTask(SubTask subtask, int referenceId) async {
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
    await localService.rawInsert(
      subTaskQuery,
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

  Future<void> addAttachments(Attachment attachment, int referenceId) async {
    const attachmentQuery = '''
        INSERT INTO ${TaskSql.taskAttachmentsTable} (
        ${Attachment.colTaskAttachment},
        ${Attachment.colTaskAttachmentType},
        ${Attachment.colTaskAttachmentReferenceId})
      VALUES(?,?,?)  
      ''';

    await localService.rawInsert(
      attachmentQuery,
      [attachment.attachment, attachment.type, referenceId],
    );
  }

  /// Update existing task details in local storage
  @override
  Future<Either<Failure, SuccessResponseModel>>
      updateTaskFullDetailsFromLocalStorage(
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
          currentUserId
        ],
      );

      // Update attachments
      // await _updateAttachments(taskModel.attachments ?? [], referenceId);
      addTaskAttachmentsToLocalStorageIfNotPresentInStorage(
          attachments: taskModel.attachments ?? <Attachment>[],
          referenceId: referenceId);

      // Update subtasks
      // await _updateSubtasks(taskModel.subTask ?? [], referenceId);
      addTaskSubtasksToLocalStorageIfNotPresentInStorage(
          subtasks: taskModel.subTask ?? <SubTask>[], referenceId: referenceId);

      // Update assigned-to details
      // await _updateAssignedToDetails(
      //     taskModel.assignedToDetails ?? [], referenceId);

      addTaskAssignedToDetailsToLocalStorageIfNotPresentInStorage(
          assignedToDetails:
              taskModel.assignedToDetails ?? <AssignedToDetail>[],
          referenceId: referenceId);

      log('updateFullTaskDetailsFromLocalStorage success =====> ');
      return Right(SuccessResponseModel());
    } catch (e) {
      log('updateFullTaskDetailsFromLocalStorage exception =====> ${e.toString()}');
      return Left(Failure());
    }
  }

  Future<void> _updateAttachments(
      List<Attachment> attachments, int referenceId) async {
    // First, delete all existing attachments for this task
    await localService.rawDelete(
        'DELETE FROM ${TaskSql.taskAttachmentsTable} WHERE ${Attachment.colTaskAttachmentReferenceId} = ?',
        [referenceId]);

    // Then, insert all current attachments
    const insertAttachmentQuery = '''
    INSERT INTO ${TaskSql.taskAttachmentsTable} (
      ${Attachment.colTaskAttachment},
      ${Attachment.colTaskAttachmentType},
      ${Attachment.colTaskAttachmentReferenceId})
    VALUES(?, ?, ?)
  ''';

    for (var attachment in attachments) {
      await localService.rawInsert(
        insertAttachmentQuery,
        [attachment.attachment, attachment.type, referenceId],
      );
    }
  }

  Future<void> _updateSubtasks(List<SubTask> subtasks, int referenceId) async {
    // First, delete all existing subtasks for this task
    await localService.rawDelete(
        'DELETE FROM ${TaskSql.taskSubTasksTable} WHERE ${SubTask.colTaskSubTaskReferenceId} = ?',
        [referenceId]);

    // Then, insert all current subtasks
    const insertSubTaskQuery = '''
    INSERT INTO ${TaskSql.taskSubTasksTable}(
      ${SubTask.colTaskSubtaskId},
      ${SubTask.colTaskSubtaskTitle},
      ${SubTask.colTaskSubtaskDescription},
      ${SubTask.colTaskSubtaskDeadline},
      ${SubTask.colTaskSubtaskIsCompleted},
      ${SubTask.colTaskSubtaskTotalTimeTaken},
      ${SubTask.colTaskSubtaskDuration},
      ${SubTask.colTaskSubTaskReferenceId})
    VALUES(?, ?, ?, ?, ?, ?, ?, ?)
  ''';

    for (var subtask in subtasks) {
      await localService.rawInsert(
        insertSubTaskQuery,
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
  }

  Future<void> _updateAssignedToDetails(
      List<AssignedToDetail> assignedToDetails, int referenceId) async {
    // First, delete all existing assigned-to details for this task
    await localService.rawDelete(
        'DELETE FROM ${TaskSql.taskAssignedToDetailTable} WHERE ${AssignedToDetail.ccolTaskAssignedToDetailReferenceId} = ?',
        [referenceId]);

    // Then, insert all current assigned-to details
    const insertAssignedToDetailsQuery = '''
    INSERT INTO ${TaskSql.taskAssignedToDetailTable}(
      ${AssignedToDetail.colTaskAssignedToDetailUserId},
      ${AssignedToDetail.colTaskAssignedToDetailUserName},
      ${AssignedToDetail.colTaskAssignedToDetailIsAccepted},
      ${AssignedToDetail.ccolTaskAssignedToDetailReferenceId})
    VALUES(?, ?, ?, ?)
  ''';

    for (var assignedToDetail in assignedToDetails) {
      await localService.rawInsert(
        insertAssignedToDetailsQuery,
        [
          assignedToDetail.userId,
          assignedToDetail.name,
          assignedToDetail.isAccepted,
          referenceId
        ],
      );
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>>
      addTaskAttachmentsToLocalStorageIfNotPresentInStorage(
          {required List<Attachment> attachments,
          required int referenceId}) async {
    try {
      //   const String query = '''
      //   SELECT COUNT(*)
      //   FROM ${TaskSql.taskAttachmentsTable}
      //   WHERE ${Attachment.colTaskAttachmentReferenceId} = ?
      //   AND ${Attachment.colTaskAttachment} = ?
      // ''';

      const String query = '''
      DELETE FROM ${TaskSql.taskAttachmentsTable}
      WHERE ${Attachment.colTaskAttachmentReferenceId} =?
    ''';

      await localService.rawDelete(query, [referenceId]);

      const String getQuery = '''
      SELECT * FROM ${TaskSql.taskAttachmentsTable}
      WHERE ${Attachment.colTaskAttachmentReferenceId} =?
    ''';

      final getdata = await localService.rawQuery(getQuery, [referenceId]);
      log('get attachments form lcoal db ==> $getdata');

      for (var attachment in attachments) {
        await addAttachments(attachment, referenceId);
      }

      // for (var attachment in attachments) {
      //   final bool present = await localService.presentOrNot(
      //     query,
      //     [
      //       referenceId,
      //       attachment.attachment,
      //     ],
      //   );

      //   if (!present) {
      //     await addAttachments(attachment, referenceId);
      //   }
      // }

      return Right(SuccessResponseModel());
    } catch (e) {
      log('addTaskAttachmentsToLocalStorageIfNotPresentInStorage exception =====> ${e.toString()}');
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>>
      addTaskSubtasksToLocalStorageIfNotPresentInStorage(
          {required List<SubTask> subtasks, required int referenceId}) async {
    try {
      const String query = '''
      SELECT COUNT(*) 
      FROM ${TaskSql.taskSubTasksTable} 
      WHERE ${SubTask.colTaskSubTaskReferenceId} = ? 
      AND ${SubTask.colTaskSubtaskId} = ?
    ''';

      for (var subtask in subtasks) {
        final bool present = await localService.presentOrNot(
          query,
          [
            referenceId,
            subtask.id,
          ],
        );

        if (!present) {
          await addSubTask(subtask, referenceId);
        }
      }

      return Right(SuccessResponseModel());
    } catch (e) {
      log('addTaskSubtasksToLocalStorageIfNotPresentInStorage exception =====> ${e.toString()}');
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>>
      addTaskAssignedToDetailsToLocalStorageIfNotPresentInStorage(
          {required List<AssignedToDetail> assignedToDetails,
          required int referenceId}) async {
    try {
      //   const String query = '''
      //   SELECT COUNT(*)
      //   FROM ${TaskSql.taskAssignedToDetailTable}
      //   WHERE ${AssignedToDetail.ccolTaskAssignedToDetailReferenceId} = ?
      //   AND ${AssignedToDetail.colTaskAssignedToDetailUserId} = ?
      // ''';

      const String query = '''
      DELETE FROM ${TaskSql.taskAssignedToDetailTable}
      WHERE ${AssignedToDetail.colTaskAssignedToDetailUserId} =?
    ''';

      await localService.rawDelete(query, [referenceId]);

      for (var assignedToDetail in assignedToDetails) {
        await addAssignedToDetails(assignedToDetail, referenceId);
      }

      // for (var assignedToDetail in assignedToDetails) {
      //   final bool present = await localService.presentOrNot(
      //     query,
      //     [
      //       referenceId,
      //       assignedToDetail.userId,
      //     ],
      //   );

      //   if (!present) {
      //     await addAssignedToDetails(assignedToDetail, referenceId);
      //   }
      // }

      return Right(SuccessResponseModel());
    } catch (e) {
      log('addTaskAssignedToDetailsToLocalStorageIfNotPresentInStorage exception =====> ${e.toString()}');
      return Left(Failure());
    }
  }

  /// Add full task details to local storage if not present
  @override
  Future<Either<Failure, SuccessResponseModel>>
      addTaskFullDetailsToLocalStorageIfNotPresentInStorage(
          {required GetTaskResponce taskModel}) async {
    try {
      final String? currentUserId = await userId;
      if (currentUserId == null) {
        log('updateTaskFromLocalStorage error: User ID is null');
        return Left(Failure(message: "User ID is null"));
      }

      /// SQL query to check if the task is already present in the [ TaskSql.tasksTable ]
      const String query = '''
      SELECT COUNT(*) 
      FROM ${TaskSql.tasksTable} 
      WHERE ${GetTaskResponce.colTaskId} = ? 
      AND ${GetTaskResponce.colUserId} = ?
    ''';

      /// Check if the task is present in the database
      final bool present =
          await localService.presentOrNot(query, [taskModel.id, currentUserId]);

      // If not present, add the task; otherwise, update it
      if (!present) {
        return await addTaskFulDetailsToLocalStorage(taskModel: taskModel);
      } else {
        return await updateTaskFullDetailsFromLocalStorage(
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

  @override
  Future<Either<Failure, GetTaskResponce>> getTaskFullDetailsFromLocalStorage({
    required String taskId,
  }) async {
    try {
      final String? currentUserId = await userId;
      if (currentUserId == null) {
        log('getTaskFullDetailsFromLocalStorage error: User ID is null');
        return Left(Failure(message: "User ID is null"));
      }

      // Helper function to safely convert to String
      String? toSafeString(dynamic value) => value?.toString();

      // Fetch main task details
      final List<
          Map<String,
              dynamic>> taskResults = await localService.rawQuery(
          'SELECT * FROM ${TaskSql.tasksTable} WHERE ${GetTaskResponce.colTaskId} = ? AND ${GetTaskResponce.colUserId} = ?',
          [taskId, currentUserId]);

      if (taskResults.isEmpty) {
        return Left(Failure(message: "Task not found"));
      }

      final taskData = taskResults.first;
      final String localTaskId =
          taskData[GetTaskResponce.colTaskLocalId].toString();

      // Fetch attachments
      final List<
          Map<String,
              dynamic>> attachmentResults = await localService.rawQuery(
          'SELECT * FROM ${TaskSql.taskAttachmentsTable} WHERE ${Attachment.colTaskAttachmentReferenceId} = ?',
          [localTaskId]);

      // Fetch subtasks
      final List<
          Map<String,
              dynamic>> subtaskResults = await localService.rawQuery(
          'SELECT * FROM ${TaskSql.taskSubTasksTable} WHERE ${SubTask.colTaskSubTaskReferenceId} = ?',
          [localTaskId]);

      // Fetch assigned users
      final List<
          Map<String,
              dynamic>> assignedUserResults = await localService.rawQuery(
          'SELECT * FROM ${TaskSql.taskAssignedToDetailTable} WHERE ${AssignedToDetail.ccolTaskAssignedToDetailReferenceId} = ?',
          [localTaskId]);

      // Parse the results into GetTaskResponce
      final GetTaskResponce taskResponse = GetTaskResponce(
        id: toSafeString(taskData[GetTaskResponce.colTaskId]),
        title: toSafeString(taskData[GetTaskResponce.colTaskTitle]),
        description: toSafeString(taskData[GetTaskResponce.colTaskDescription]),
        createdBy: toSafeString(taskData[GetTaskResponce.colTaskCreatedBy]),
        priorityLevel:
            toSafeString(taskData[GetTaskResponce.colTaskPriorityLevel]),
        recurrentTask: taskData[GetTaskResponce.colTaskRecurrentTask] == 1,
        isCompleted: taskData[GetTaskResponce.colTaskIsCompleted] == 1,
        isOwned: taskData[GetTaskResponce.colTaskIsOwned] == 1,
        deadLine: toSafeString(taskData[GetTaskResponce.colTaskDeadLine]),
        isKilled: taskData[GetTaskResponce.colTaskIsKilled] == 1,
        tags: toSafeString(taskData[GetTaskResponce.colTaskTags])?.split(','),
        createdAt: toSafeString(taskData[GetTaskResponce.colTaskCreatedAt]),
        status: toSafeString(taskData[GetTaskResponce.colTaskStatus]),
        totalTime: taskData[GetTaskResponce.colTaskTotalTime] as int?,
        totalExpense: taskData[GetTaskResponce.colTaskTotalExpense] as int?,
        attachments: attachmentResults
            .map((r) => Attachment(
                  attachment: toSafeString(r[Attachment.colTaskAttachment]),
                  type: toSafeString(r[Attachment.colTaskAttachmentType]),
                ))
            .toList(),
        subTask: subtaskResults
            .map((r) => SubTask(
                  id: toSafeString(r[SubTask.colTaskSubtaskId]),
                  title: toSafeString(r[SubTask.colTaskSubtaskTitle]),
                  description:
                      toSafeString(r[SubTask.colTaskSubtaskDescription]),
                  deadLine: toSafeString(r[SubTask.colTaskSubtaskDeadline]),
                  isCompleted: r[SubTask.colTaskSubtaskIsCompleted] == 1,
                  totalTimeTaken:
                      toSafeString(r[SubTask.colTaskSubtaskTotalTimeTaken]),
                  duration: toSafeString(r[SubTask.colTaskSubtaskDuration]),
                ))
            .toList(),
        assignedToDetails: assignedUserResults
            .map((r) => AssignedToDetail(
                  userId: toSafeString(
                      r[AssignedToDetail.colTaskAssignedToDetailUserId]),
                  name: toSafeString(
                      r[AssignedToDetail.colTaskAssignedToDetailUserName]),
                  isAccepted:
                      r[AssignedToDetail.colTaskAssignedToDetailIsAccepted],
                ))
            .toList(),
        createdUserDetails: CreatedUserDetails(
          id: toSafeString(taskData[GetTaskResponce.colTaskCreatedUserId]),
          name: toSafeString(taskData[GetTaskResponce.colTaskCreatedUsername]),
          profilePicture: toSafeString(
              taskData[GetTaskResponce.colTaskCreatedUserProfilePic]),
        ),
      );

      log('getTaskFullDetailsFromLocalStorage success =====> ${taskResponse.toJson()}');
      return Right(taskResponse);
    } catch (e) {
      log('getTaskFullDetailsFromLocalStorage exception =====> ${e.toString()}');
      return Left(Failure());
    }
  }
}
