import 'dart:developer';

import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/task/domain/model/dashboard/get_recent_tasks_responce/get_recent_tasks_responce.dart';
import 'package:bizkit/module/task/domain/model/dashboard/get_recent_tasks_responce/recent_tasks/created_by.dart';
import 'package:bizkit/module/task/domain/model/dashboard/get_recent_tasks_responce/recent_tasks/recent_tasks.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_deadline_model/filter_by_deadline_model.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/assigned_to_detail.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/attachment.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/get_task_responce.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/sub_task.dart';
import 'package:bizkit/module/task/domain/model/task/next_action_date_responce/next_action_date_responce.dart';
import 'package:bizkit/module/task/domain/repository/sqfilte/task_local_repo.dart';
import 'package:bizkit/service/local_service/sqflite_local_service.dart';
import 'package:bizkit/service/local_service/sql/task/task_oncreate_db.dart';
import 'package:bizkit/service/secure_storage/flutter_secure_storage.dart';
import 'package:dartz/dartz.dart';
import 'package:bizkit/module/task/domain/model/task/self_to_others_type_responce/task.dart'
    as task;
import 'package:sqflite/sqflite.dart';

import '../../../domain/model/task/get_task_responce/created_user_details.dart';

class TaskLocalService implements TaskLocalRepo {
  final LocalService localService = LocalService();
  static String? _userID;

  Future<String?> get userId async {
    _userID = await SecureStorage.getUserId() ?? '';
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
          taskModel.totalTime ?? 0,
          taskModel.totalExpense ?? 0,
          taskModel.id ?? '',
          currentUserId
        ],
      );

      addTaskAttachmentsToLocalStorageIfNotPresentInStorage(
          attachments: taskModel.attachments ?? <Attachment>[],
          referenceId: referenceId);
      addTaskSubtasksToLocalStorageIfNotPresentInStorage(
          subtasks: taskModel.subTask ?? <SubTask>[], referenceId: referenceId);

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

  Future<void> _updateSubtasks(SubTask subtask, int referenceId) async {
    // Then, insert all current subtasks
    const insertSubTaskQuery = '''
    UPDATE ${TaskSql.taskSubTasksTable}
    SET
      ${SubTask.colTaskSubtaskId} = ?,
      ${SubTask.colTaskSubtaskTitle} = ?,
      ${SubTask.colTaskSubtaskDescription} = ?,
      ${SubTask.colTaskSubtaskDeadline} = ?,
      ${SubTask.colTaskSubtaskIsCompleted} = ?,
      ${SubTask.colTaskSubtaskTotalTimeTaken} = ?,
      ${SubTask.colTaskSubtaskDuration} = ?,
      ${SubTask.colTaskSubTaskReferenceId}  = ?
    WHERE ${SubTask.colTaskSubtaskId} = ? AND ${SubTask.colTaskSubTaskReferenceId}
  ''';

    await localService.rawUpdate(
      insertSubTaskQuery,
      [
        subtask.id,
        subtask.title,
        subtask.description,
        subtask.deadLine,
        subtask.isCompleted == true ? 1 : 0,
        subtask.totalTimeTaken,
        subtask.duration,
        subtask.id,
        referenceId,
      ],
    );
  }

  @override
  Future<Either<Failure, SuccessResponseModel>>
      addTaskAttachmentsToLocalStorageIfNotPresentInStorage(
          {required List<Attachment> attachments,
          required int referenceId}) async {
    try {
      const String query = '''
      DELETE FROM ${TaskSql.taskAttachmentsTable}
      WHERE ${Attachment.colTaskAttachmentReferenceId} =?
    ''';

      await localService.rawDelete(query, [referenceId]);

      for (var attachment in attachments) {
        await addAttachments(attachment, referenceId);
      }

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
        } else {
          await _updateSubtasks(subtask, referenceId);
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
      const String query = '''
      DELETE FROM ${TaskSql.taskAssignedToDetailTable}
      WHERE ${AssignedToDetail.ccolTaskAssignedToDetailReferenceId} =?
    ''';

      await localService.rawDelete(query, [referenceId]);

      for (var assignedToDetail in assignedToDetails) {
        await addAssignedToDetails(assignedToDetail, referenceId);
      }

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
      log('present => $present');
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

      // Convert the matched next action dates list to a comma-separated string
      String nextActionDatesAsString =
          (taskModel.matchedNextActionDates ?? []).join(',');

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
        ${GetTaskResponce.colNextActionDate},
        ${GetTaskResponce.colTaskCreatedUserId},
        ${GetTaskResponce.colTaskCreatedUsername})
      VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)  
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
        nextActionDatesAsString,
        taskModel.createdBy?.userId ?? '',
        taskModel.createdBy?.name ?? '',
      ];

      final int referenceId = await localService.rawInsert(query, values);

      if (taskModel.deadLine != null && taskModel.deadLine!.isNotEmpty) {
        const filterByDeadlineQuery = '''
          INSERT INTO ${TaskSql.filterByDeadlineTable} (
          ${FilterByDeadlineModel.colTaskFilterByDeadline},
          ${FilterByDeadlineModel.colUserId},
          ${FilterByDeadlineModel.colTaskId},
          ${FilterByDeadlineModel.colTaskNextActionDates},
          ${FilterByDeadlineModel.colTaskSpotlightOn},
          ${FilterByDeadlineModel.colTaskFilterByDeadlineReferenceId})
        VALUES(?,?,?,?,?,?)  
        ''';

        await localService.rawInsert(
          filterByDeadlineQuery,
          [
            taskModel.deadLine,
            currentUserId,
            taskModel.id,
            nextActionDatesAsString,
            (taskModel.spotlightOn ?? false) ? 1 : 0,
            referenceId
          ],
        );
      }

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

      // Convert the matched next action dates list to a comma-separated string
      String nextActionDatesAsString =
          (taskModel.matchedNextActionDates ?? []).join(',');

      const query = '''
      UPDATE ${TaskSql.tasksTable}
      SET 
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
        ${GetTaskResponce.colNextActionDate} = ?,
        ${GetTaskResponce.colTaskCreatedUserId} = ?,
        ${GetTaskResponce.colTaskCreatedUsername} = ?
      WHERE 
        ${GetTaskResponce.colTaskId} = ? AND ${GetTaskResponce.colUserId} = ?
    ''';

      final List<dynamic> values = [
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
        nextActionDatesAsString,
        taskModel.createdBy?.userId ?? '',
        taskModel.createdBy?.name ?? '',
        taskModel.id ?? '', // for WHERE clause
        currentUserId, // for WHERE clause
      ];

      await localService.rawUpdate(query, values);

      log('updateTaskFromLocalStorage success');

      // Update the filter by deadline table if the deadline has changed
      if (taskModel.deadLine != null) {
        const filterByDeadlineQuery = '''
        UPDATE ${TaskSql.filterByDeadlineTable}
        SET 
        ${FilterByDeadlineModel.colTaskFilterByDeadline} = ?,
        ${FilterByDeadlineModel.colTaskNextActionDates} = ?,
        ${FilterByDeadlineModel.colTaskSpotlightOn} = ?

        WHERE ${FilterByDeadlineModel.colTaskId} = ? AND ${FilterByDeadlineModel.colUserId} = ? 
      ''';

        final filterByDeadlineValues = [
          taskModel.deadLine,
          nextActionDatesAsString,
          (taskModel.spotlightOn ?? false) ? 1 : 0,
          taskModel.id ?? '',
          currentUserId,
        ];

        await localService.rawUpdate(
            filterByDeadlineQuery, filterByDeadlineValues);
      }

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
      final String? currentUserId = await userId;
      if (currentUserId == null) {
        log('addTaskToLocalStorageIfNotPresentInStorage error: User ID is null');
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
      GetTaskResponce taskResponse = _parseResultsToGetTaskResponce(
          taskData, attachmentResults, subtaskResults, assignedUserResults);

      log('getTaskFullDetailsFromLocalStorage success =====> ');
      return Right(taskResponse);
    } catch (e) {
      log('getTaskFullDetailsFromLocalStorage exception =====> ${e.toString()}');
      return Left(Failure());
    }
  }

  GetTaskResponce _parseResultsToGetTaskResponce(
      Map<String, dynamic> taskData,
      List<Map<String, dynamic>> attachmentResults,
      List<Map<String, dynamic>> subtaskResults,
      List<Map<String, dynamic>> assignedUserResults) {
    final GetTaskResponce taskResponse = GetTaskResponce(
      id: taskData[GetTaskResponce.colTaskId] as String?,
      title: taskData[GetTaskResponce.colTaskTitle] as String?,
      description: taskData[GetTaskResponce.colTaskDescription] as String?,
      createdBy: taskData[GetTaskResponce.colTaskCreatedBy] as String?,
      priorityLevel: taskData[GetTaskResponce.colTaskPriorityLevel] as String?,
      recurrentTask: taskData[GetTaskResponce.colTaskRecurrentTask] == 1,
      isCompleted: taskData[GetTaskResponce.colTaskIsCompleted] == 1,
      isOwned: taskData[GetTaskResponce.colTaskIsOwned] == 1,
      deadLine: taskData[GetTaskResponce.colTaskDeadLine] as String?,
      isKilled: taskData[GetTaskResponce.colTaskIsKilled] == 1,
      tags: (taskData[GetTaskResponce.colTaskTags] as String?)?.split(','),
      createdAt: taskData[GetTaskResponce.colTaskCreatedAt] as String?,
      status: taskData[GetTaskResponce.colTaskStatus] as String,
      totalTime: int.tryParse(
          taskData[GetTaskResponce.colTaskTotalTime]?.toString() ?? ''),
      totalExpense: int.tryParse(
          taskData[GetTaskResponce.colTaskTotalExpense]?.toString() ?? ''),
      attachments: attachmentResults
          .map((r) => Attachment(
                attachment: r[Attachment.colTaskAttachment] as String?,
                type: r[Attachment.colTaskAttachmentType] as String?,
              ))
          .toList(),
      nextActionDate:
          ((taskData[GetTaskResponce.colNextActionDate] as String?) ?? '')
              .split(',')
              .map(
                (e) => NextActionDateResponce(date: e),
              )
              .toList(),
      subTask: subtaskResults
          .map((r) => SubTask(
                id: r[SubTask.colTaskSubtaskId] as String?,
                title: r[SubTask.colTaskSubtaskTitle] as String?,
                description: r[SubTask.colTaskSubtaskDescription] as String?,
                deadLine: r[SubTask.colTaskSubtaskDeadline] as String?,
                isCompleted: r[SubTask.colTaskSubtaskIsCompleted] == 1,
                totalTimeTaken:
                    r[SubTask.colTaskSubtaskTotalTimeTaken] as String?,
                duration: r[SubTask.colTaskSubtaskDuration] as String?,
              ))
          .toList(),
      assignedToDetails: assignedUserResults
          .map((r) => AssignedToDetail(
                userId: r[AssignedToDetail.colTaskAssignedToDetailUserId]
                    as String?,
                name: r[AssignedToDetail.colTaskAssignedToDetailUserName]
                    as String?,
                isAccepted:
                    r[AssignedToDetail.colTaskAssignedToDetailIsAccepted]
                        as String?,
              ))
          .toList(),
      createdUserDetails: CreatedUserDetails(
        id: taskData[GetTaskResponce.colTaskCreatedUserId] as String?,
        name: taskData[GetTaskResponce.colTaskCreatedUsername] as String?,
        profilePicture:
            taskData[GetTaskResponce.colTaskCreatedUserProfilePic] as String?,
      ),
    );
    return taskResponse;
  }

  @override
  Future<Either<Failure, List<task.Task>>> getTasksFromLocalStorage({
    required String filterByDeadline,
    required int page,
    required int pageSize,
  }) async {
    try {
      // Parse the provided deadline string into a DateTime object
      final deadline = DateTime.parse(filterByDeadline);

      final currentUserId = await userId;

      if (currentUserId == null) {
        log('getTaskFullDetailsFromLocalStorage error: User ID is null');
        return Left(Failure(message: "User ID is null"));
      }

      // Query to fetch tasks from the database filtered by the user's ID
      final List<Map<String, dynamic>> alltasks =
          await localService.rawQuery('''
      SELECT * FROM ${TaskSql.filterByDeadlineTable} 
      WHERE ${FilterByDeadlineModel.colUserId} = ? 
      ORDER BY ${FilterByDeadlineModel.colTaskFilterByDeadline} DESC
      ''', [
        await userId,
      ]);

      // Separate tasks based on conditions
      List<Map<String, dynamic>> prioritizedTasks = [];
      List<Map<String, dynamic>> regularTasks = [];

      for (var item in alltasks) {
        bool isTaskAdded = false;

        // Split and check next action dates
        List<String> nextActionDates =
            ((item[FilterByDeadlineModel.colTaskNextActionDates] as String?) ??
                    '')
                .split(',');

        for (var nextTaskDate in nextActionDates) {
          if (nextTaskDate == filterByDeadline) {
            prioritizedTasks.insert(0, item);
            isTaskAdded = true;
            break;
          }
        }
        if (isTaskAdded) {
          continue;
        }

        // Check if the task is spotlighted
        if (((item[FilterByDeadlineModel.colTaskSpotlightOn] as int?) ?? 0) ==
            1) {
          prioritizedTasks.add(item);
          isTaskAdded = true;
          continue;
        }

        // Check if the task deadline is within the required range
        final taskDeadlineStr =
            item[FilterByDeadlineModel.colTaskFilterByDeadline] as String?;
        if (taskDeadlineStr != null) {
          final taskDeadline = DateTime.parse(taskDeadlineStr);
          if (taskDeadline.isBefore(deadline.add(const Duration(days: 1)))) {
            regularTasks.add(item);
          }
        }
      }

      // Merge prioritized tasks with regular tasks
      prioritizedTasks.addAll(regularTasks);

      // Apply pagination
      int startIndex = (page - 1) * pageSize;
      List<task.Task> paginatedTasks = [];

      for (var i = startIndex; i < startIndex + pageSize; i++) {
        final taskDeadlineStr = prioritizedTasks[i]
            [FilterByDeadlineModel.colTaskFilterByDeadline] as String?;
        if (taskDeadlineStr != null) {
          // Fetch full task details from the database
          final taskDetails = await localService.rawQuery(
            '''
              SELECT * FROM ${TaskSql.tasksTable} 
              WHERE ${GetTaskResponce.colTaskId} = ? 
              AND ${GetTaskResponce.colUserId} = ?
            ''',
            [
              prioritizedTasks[i][FilterByDeadlineModel.colTaskId],
              await userId
            ],
          );

          if (taskDetails.isNotEmpty) {
            paginatedTasks.add(task.Task.fromMap(taskDetails.first));
          }
        }
      }
      log('getTasksFromLocalStorage success ');
      return Right(paginatedTasks);
    } catch (e) {
      log('getTasksFromLocalStorage error: ${e.toString()}');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>>
      deleteRecentTaskFromLocalStorage() async {
    try {
      final String? currentUserId = await userId;
      if (currentUserId == null) {
        log('deleteRecentTaskFromLocalStorage error: User ID is null');
        return Left(Failure(message: "User ID is null"));
      }
      const String deleteQuery = '''
        DELETE FROM ${TaskSql.recentTasksTable}
        WHERE ${GetRecentTasksResponce.colUserId} = ?
      ''';

      await localService.rawDelete(
        deleteQuery,
        [currentUserId],
      );

      log('deleteRecentTaskFromLocalStorage success');
      return Right(SuccessResponseModel());
    } catch (e) {
      log('deleteRecentTaskFromLocalStorage exception: ${e.toString()}');
      if (e is TypeError) {
        log('TypeError details: ${e.stackTrace}');
      }
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> addRecentTaskToLocalStorage({
    required String recentTaskId,
    required String recentTaskType,
  }) async {
    try {
      final String? currentUserId = await userId;
      if (currentUserId == null) {
        log('addRecentTaskToLocalStorage error: User ID is null');
        return Left(Failure(message: "User ID is null"));
      }

      const query = '''
      INSERT INTO ${TaskSql.recentTasksTable}(
        ${GetRecentTasksResponce.colUserId},
        ${GetRecentTasksResponce.colRecentTaskId},
        ${GetRecentTasksResponce.colRecentTaskType}
      )
      VALUES (?,?,?)
     ''';

      final List<dynamic> values = [
        currentUserId,
        recentTaskId,
        recentTaskType,
      ];

      await localService.rawInsert(query, values);

      log('addRecentTaskToLocalStorage success');
      return Right(SuccessResponseModel());
    } catch (e) {
      log('addRecentTaskToLocalStorage exception: ${e.toString()}');
      if (e is TypeError) {
        log('TypeError details: ${e.stackTrace}');
      }
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetRecentTasksResponce>>
      getRecentsTasksFromLocalStorage() async {
    try {
      final currentUserData = await SecureStorage.getToken();
      if (currentUserData.uid == null) {
        log('getRecentsTasksFromLocalStorage error: User ID is null');
        return Left(Failure(message: "User ID is null"));
      }

      const query = '''
      SELECT * FROM ${TaskSql.recentTasksTable} 
      WHERE ${GetRecentTasksResponce.colUserId} = ? 
      ''';

      final List<Map<String, dynamic>> allrecentTasks =
          await localService.rawQuery(query, [currentUserData.uid]);

      final List<RecentTasks> selfToSelf = [];
      final List<RecentTasks> othersToSelf = [];
      final List<RecentTasks> selfToOthers = [];

      for (var taskData in allrecentTasks) {
        switch (taskData['recent_task_type']) {
          case 'self_to_self':
            await recentTaskAddToList(taskData, selfToSelf);
            break;
          case 'others_to_self':
            await recentTaskAddToList(taskData, othersToSelf);
            break;
          case 'self_to_others':
            await recentTaskAddToList(taskData, selfToOthers);
            break;
          default:
            log('Unknown task type: ${taskData['recent_task_type']}');
        }
      }
      final response = GetRecentTasksResponce(
        selfToSelf: selfToSelf,
        othersToSelf: othersToSelf,
        selfToOthers: selfToOthers,
      );
      log('getRecentsTasksFromLocalStorage success');
      return Right(response);
    } catch (e) {
      log('getRecentsTasksFromLocalStorage exception =====> ${e.toString()}');
      return Left(Failure());
    }
  }

  Future<void> recentTaskAddToList(
      Map<String, dynamic> taskData, List<RecentTasks> list) async {
    final taskResponce = await getTaskFullDetailsFromLocalStorage(
        taskId: taskData['recent_task_id']);
    taskResponce.fold(
      (failure) => null,
      (success) {
        list.add(
          RecentTasks(
            taskId: success.id,
            deadLine: success.deadLine,
            createdAt: success.createdAt,
            createdBy: CreatedBy(
                name: success.createdUserDetails?.name ?? '',
                userId: success.createdUserDetails?.id ?? ''),
            isOwned: success.isOwned,
            status: success.status,
            taskTitle: success.title,
          ),
        );
      },
    );
  }
}
