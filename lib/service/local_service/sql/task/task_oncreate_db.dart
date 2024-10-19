import 'dart:developer';

import 'package:bizkit/module/task/domain/model/task/filter_by_deadline_model/filter_by_deadline_model.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/assigned_to_detail.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/get_task_responce.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/sub_task.dart';
import 'package:sqflite/sqflite.dart' as sql;

import '../../../../module/task/domain/model/task/get_task_responce/attachment.dart';

class TaskSql {
  static const tasksTable = 'bizkit_tasks';
  static const taskAttachmentsTable = 'task_attachments';
  static const taskSubTasksTable = 'task_subtasks';
  static const taskAssignedToDetailTable = 'task_assigned_to_detail';

  static const recentTasksTable = 'recent_tasks';
  static const filterByDeadlineTable = 'tasks_filter_by_deadline';

  static Future onCreate(sql.Database db) async {
    try {
      log('----------------- oncreate database task module ---------------------');
      await db.execute(_bizkitTaskTableCreation);
      await db.execute(_taskAttachmentsTableCreation);
      await db.execute(_taskSubTasksTableCreation);
      await db.execute(_taskAssignedToDetailTableCreation);
      await db.execute(_filterByDeadlineTableCreation);
    } catch (e) {
      log('onCreate ==> ${e.toString()}');
    }
  }

  /// Table for bizkit task
  static const String _bizkitTaskTableCreation = '''
  CREATE TABLE IF NOT EXISTS $tasksTable (
    ${GetTaskResponce.colTaskLocalId} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${GetTaskResponce.colUserId} TEXT,
    ${GetTaskResponce.colTaskId} TEXT,
    ${GetTaskResponce.colTaskCreatedBy} TEXT,
    ${GetTaskResponce.colTaskTitle} TEXT,
    ${GetTaskResponce.colTaskDescription} TEXT,
    ${GetTaskResponce.colTaskPriorityLevel} TEXT,
    ${GetTaskResponce.colTaskRecurrentTask} INTEGER,    -- Boolean field (1 for true, 0 for false)
    ${GetTaskResponce.colTaskIsCompleted} INTEGER,  -- Boolean field (1 for true, 0 for false)
    ${GetTaskResponce.colTaskIsOwned} INTEGER,   -- Boolean field (1 for true, 0 for false)
    ${GetTaskResponce.colTaskDeadLine} TEXT,
    ${GetTaskResponce.colTaskIsKilled} INTEGER,   -- Boolean field (1 for true, 0 for false)
    ${GetTaskResponce.colTaskTags} TEXT,    -- Tags stored as TEXT (e.g. comma-separated)
    ${GetTaskResponce.colTaskCreatedAt} TEXT,
    ${GetTaskResponce.colTaskStatus} TEXT,
    ${GetTaskResponce.colTaskCreatedUserId} TEXT,
    ${GetTaskResponce.colTaskCreatedUsername} TEXT,
    ${GetTaskResponce.colTaskCreatedUserProfilePic} TEXT,
    ${GetTaskResponce.colTaskTotalTime} INTEGER,
    ${GetTaskResponce.colTaskTotalExpense} INTEGER,
    ${GetTaskResponce.colTaskType} TEXT,
    ${GetTaskResponce.colTaskSpotlightOn} INTEGER,  -- Boolean field (1 for true, 0 for false)
    ${GetTaskResponce.colTaskIsPinned} INTEGER  -- Boolean field (1 for true, 0 for false)
  )
  ''';

  /// Table for [Attachment] relation with [GetTaskResponce]
  static const String _taskAttachmentsTableCreation = '''
    CREATE TABLE IF NOT EXISTS $taskAttachmentsTable(
      ${Attachment.colTaskAttachmentLocalId} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${Attachment.colTaskAttachment} TEXT,
      ${Attachment.colTaskAttachmentType} TEXT,
      ${Attachment.colTaskAttachmentReferenceId} INTEGER,
      FOREIGN KEY (${Attachment.colTaskAttachmentReferenceId}) REFERENCES $tasksTable(${GetTaskResponce.colTaskLocalId})
      ON DELETE CASCADE  
    )
  ''';

  /// Table for [SubTask] relation with [GetTaskResponce]
  static const String _taskSubTasksTableCreation = '''
    CREATE TABLE IF NOT EXISTS $taskSubTasksTable(
      ${SubTask.colTaskSubtaskLocalId} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${SubTask.colTaskSubtaskId} TEXT,
      ${SubTask.colTaskSubtaskTitle} TEXT,
      ${SubTask.colTaskSubtaskDescription} TEXT,
      ${SubTask.colTaskSubtaskDeadline} TEXT,
      ${SubTask.colTaskSubtaskIsCompleted} INTEGER,  -- Boolean field (1 for true, 0 for false)
      ${SubTask.colTaskSubtaskTotalTimeTaken} TEXT,
      ${SubTask.colTaskSubtaskDuration} TEXT,
      ${SubTask.colTaskSubTaskReferenceId} INTEGER,
      FOREIGN KEY (${SubTask.colTaskSubTaskReferenceId}) REFERENCES $tasksTable(${GetTaskResponce.colTaskLocalId})
      ON DELETE CASCADE 
    )
  ''';

  /// Table for [AssignedToDetail] relation with [GetTaskResponce]
  static const String _taskAssignedToDetailTableCreation = '''
    CREATE TABLE IF NOT EXISTS $taskAssignedToDetailTable(
      ${AssignedToDetail.colTaskAssignedToDetailLocalId} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${AssignedToDetail.colTaskAssignedToDetailUserId} TEXT,
      ${AssignedToDetail.colTaskAssignedToDetailUserName} TEXT,
       ${AssignedToDetail.colTaskAssignedToDetailIsAccepted} TEXT,
      ${AssignedToDetail.ccolTaskAssignedToDetailReferenceId} INTEGER,
      FOREIGN KEY (${AssignedToDetail.ccolTaskAssignedToDetailReferenceId}) REFERENCES $tasksTable(${GetTaskResponce.colTaskLocalId})
      ON DELETE CASCADE 
    )
  ''';

  /// Table for Filter task by deadline [FilterByDeadlineModel] relation with [GetTaskResponce]
  static const _filterByDeadlineTableCreation = '''
    CREATE TABLE IF NOT EXISTS $filterByDeadlineTable(
      ${FilterByDeadlineModel.colTaskFilterByDeadlineLocalId} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${FilterByDeadlineModel.colTaskFilterByDeadline} TEXT,
      ${FilterByDeadlineModel.colTaskFilterByDeadlineReferenceId} INTEGER,
    FOREIGN KEY (${FilterByDeadlineModel.colTaskFilterByDeadlineReferenceId})  REFERENCES $tasksTable(${GetTaskResponce.colTaskLocalId})
    ON DELETE CASCADE
    )
  ''';
}
